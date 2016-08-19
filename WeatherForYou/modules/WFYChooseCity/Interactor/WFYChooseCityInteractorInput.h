//
//  WFYChooseCityInteractorInput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;
@protocol WFYChooseCityInteractorInput <NSObject>
- (void) setTableViewManager:(RETableViewManager*)manager;
- (void) updateTable;
- (NSArray *) getAvailableCities;
- (void) addNewCityWithName:(NSString *)name;
@end
