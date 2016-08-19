//
//  WFYCityWeatherInteractor.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherInteractor.h"

#import "WFYCityWeatherInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "WFYMeasurementCellPresenter.h"
#import "CurrentWeather.h"
#import "MeasurementPoint.h"
#import "NSDate+Utilities.h"

@interface WFYCityWeatherInteractor()
@property (weak) RETableViewManager* manager;
@property (weak) City *curCity;
@end

@implementation WFYCityWeatherInteractor {

}

- (void) setCurrenCity:(City *)city {
    if (!city || ![self.daemon getCityByName:city.name]) city = self.daemon.currentCity;
    self.curCity = city;
    [self updateAllWithCity:city];
}

-(void)updateCity:(NSNotification *)notif {
    if ([notif.object isEqual:self.curCity] || (self.curCity == nil && ((City *)notif.object).currentLocation.boolValue)) {
        self.curCity = notif.object;
        [self updateAllWithCity:self.curCity];
    }
}

-(void)updateAllWithCity:(City *) city {
    [self.output updateCurrentCityWithName:city.name andLongitude:self.curCity.locationLon.floatValue andLatitude:self.curCity.locationLat.floatValue andTemp:((CurrentWeather *)self.curCity.current).currentMeasure.temperature andTempEdIzm:@"°C" andImage:[self.imagesService getLocalImageWithName:((CurrentWeather *)self.curCity.current).icon]];


    NSArray *ar = ((CurrentWeather *)self.curCity.current).measures.allObjects;
    ar = [ar sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [((MeasurementPoint *)obj1).date compare:((MeasurementPoint *)obj2).date];
    }];
    
    if (ar.count == 0) {
        [self.manager.sections[0] removeAllItems];
        [self.manager.sections[0] reloadSectionWithAnimation:UITableViewRowAnimationNone];
        [self.manager.sections[1] removeAllItems];
        [self.manager.sections[1] reloadSectionWithAnimation:UITableViewRowAnimationNone];
    } else {
        long curSectionInd = 0;
        [self.manager.sections[curSectionInd] removeAllItems];
        for (MeasurementPoint *point in ar) {
            WFYMeasurementCellPresenter *pres = [WFYMeasurementCellPresenter item];
            pres.model = point;
            if ([pres.model.date isTomorrow]) {
                [self.manager.sections[curSectionInd] addItem:pres];
            }
            if ([pres.model.date isEqualToDateIgnoringTime:[[NSDate dateTomorrow] dateByAddingDays:1]]) {
                if (!curSectionInd) {
                    [self.manager.sections[curSectionInd] reloadSectionWithAnimation:UITableViewRowAnimationNone];
                    curSectionInd++;
                    [self.manager.sections[curSectionInd] removeAllItems];
                }
                [self.manager.sections[curSectionInd] addItem:pres];
            }
        }
        [self.manager.sections[curSectionInd] reloadSectionWithAnimation:UITableViewRowAnimationNone];
    }

}

- (void) initWithTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateCity:)
                                                 name:kNotificationNewDataForCity object:nil];
    
}

#pragma mark - Методы WFYCityWeatherInteractorInput

@end
