//
//  WeatherDeamon.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WeatherDeamon.h"
#import "ServicesAssembly.h"
#import "City.h"
#import "CurrentWeather.h"
#import "MeasurementPoint.h"
#import "NSDate+Utilities.h"

@implementation WeatherDeamon {
    NSTimer *refreshTimer;
}

-(void)startDaemon {
    [self.dbService initService];
    [self updateDataForAllCities];
    self.geoService.delegate = self;
    ARDispatchOnMainThreadAfter(0.1, ^(){
        [self.geoService getCurrentLocation];
    });
    refreshTimer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(updateDataForAllCities) userInfo:nil repeats:YES];
}

-(void)stopDaemon {
    [self.dbService stopService];
    [refreshTimer invalidate];
}

-(void)updateDataForAllCities {
    NSArray *allCit = self.allCities;
    for (City *city in allCit) {
        [self updateWeatherDataForCity:city];
    }
}

-(NSArray *)allCities {
    return [self.dbService getAllCities];
}

-(City *)currentCity {
    return [self.dbService getCurrent];
}

-(void)errorCatched:(WFYError)error {
    [[appSettings getPopupObj] popupMessageWithTitle:WFYLocalize(@"geoError") andDescription:[AppErrors getErrorDescription:error] andType:PopupMessageTypeError];
}

-(void)gotCurrentLocationPoint:(CLLocation *)location andPlacemark:(CLPlacemark *)placemark {
    ARDispatchOnMainThread(^() {
        City *cur = [self.dbService getCurrent];
        cur.locationLon = @(location.coordinate.longitude);
        cur.locationLat = @(location.coordinate.latitude);
        cur.name = placemark.locality;
        [self.dbService save];
        [self updateWeatherDataForCity:cur];
    });
}

-(void) updateWeatherDataForCity:(City *)city {
    if (!city || city.locationLat == nil || city.locationLon == nil) return; //у текущего положения еще нет координат
    
    [self.weatherDataService getWeatherDataForLatitude:city.locationLat andLongitude:city.locationLon withResultBlock:^(WeatherDataModel *dataModel, WFYError error) {
        if (error != WFYNoError) {
            [[appSettings getPopupObj] popupMessageWithTitle:WFYLocalize(@"serverError") andDescription:[AppErrors getErrorDescription:error] andType:PopupMessageTypeError];
            return;
        }
         ARDispatchOnMainThread(^() {
             if (city.current) [city.current MR_deleteEntity];
             CurrentWeather *currentWeather = [CurrentWeather MR_createEntity];
             city.current = currentWeather;
             currentWeather.name = WFYLocalize(@"today");
             currentWeather.date = dataModel.current.measurementDate;
             currentWeather.icon = dataModel.current.iconName;
             currentWeather.currentMeasure = [MeasurementPoint MR_createEntity];
             currentWeather.currentMeasure.date = dataModel.current.measurementDate;
             currentWeather.currentMeasure.temperature = dataModel.current.currentTempInC;
             for (WeatherTimeDataModel *measure in dataModel.forecast) {
                    MeasurementPoint *meas = [MeasurementPoint MR_createEntity];
                    meas.date = measure.measurementDate;
                    meas.temperature = measure.currentTempInC;
                    [currentWeather addMeasuresObject:meas];
              }
              [self.dbService save];
             [self sendRefreshNotificationForCity:city];
         });
    }];
}

-(void) sendRefreshNotificationForCity:(City *)city {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNewDataForCity object:city];
}

-(NSArray*) availableCityNames {
   return [self.dbService getAvailabeCities].allKeys;
}

-(bool)addCityWithName:(NSString *)name {
    bool res = [self.dbService addCity:[[self.dbService getAvailabeCities] objectForKey:name]];
    if (res) [self updateWeatherDataForCity:[self.dbService getCityByName:name]];
    return res;
}

-(void)deleteCity:(City *)city {
    if (city) [city MR_deleteEntity];
    [self.dbService save];
}

-(City *)getCityByName:(NSString *)name {
    return [self.dbService getCityByName:name];
}

@end
