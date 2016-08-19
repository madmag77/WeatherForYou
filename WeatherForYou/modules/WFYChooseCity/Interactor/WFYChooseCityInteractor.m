//
//  WFYChooseCityInteractor.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityInteractor.h"

#import "WFYChooseCityInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "WFYChooseCityCellPresenter.h"

@interface WFYChooseCityInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation WFYChooseCityInteractor

#pragma mark - Методы WFYChooseCityInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateCity:)
                                                 name:kNotificationNewDataForCity object:nil];
}

-(void)updateCity:(NSNotification *)notif {
    [self updateTable];
}

- (void) updateTable {
    [self.manager.sections[0] removeAllItems];
    NSArray *allCities = self.daemon.allCities;
    for (City *city in allCities) {
        WFYChooseCityCellPresenter *pres = [WFYChooseCityCellPresenter item];
        pres.model = city;
        pres.selectionHandler = ^(WFYChooseCityCellPresenter *item) {
            [self.output choosedCity:item.model];
        };
        if (!city.currentLocation.boolValue) {
            pres.editingStyle = UITableViewCellEditingStyleDelete;
            pres.deletionHandler = ^(WFYChooseCityCellPresenter *item) {
                [self.daemon deleteCity:item.model];
            };
        }
        [self.manager.sections[0] addItem:pres];
    }
    [self.manager.sections[0] reloadSectionWithAnimation:UITableViewRowAnimationNone];

}

- (NSArray *) getAvailableCities {
    return [self.daemon availableCityNames];
}

- (void) addNewCityWithName:(NSString *)name {
    if ([self.daemon addCityWithName:name]) {
        [self updateTable];
    }
}
@end
