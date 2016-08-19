//
//  WFYCityWeatherInteractorInput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;
@class City;
@protocol WFYCityWeatherInteractorInput <NSObject>
- (void) setCurrenCity:(City *)city;
- (void) initWithTableViewManager:(RETableViewManager*)manager;
@end
