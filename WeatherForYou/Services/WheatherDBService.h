//
//  WheatherDBService.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>
#import "City.h"

@interface CityStubModel : NSObject
@property NSString *name;
@property NSNumber *lon;
@property NSNumber *lat;
@end

@interface WheatherDBService : NSObject
@property NSString *storeName;
-(void) initService;
-(void) stopService;
-(void)save;

-(NSArray *) getAllCities;
-(City *)getCurrent;
-(NSDictionary *)getAvailabeCities;
-(bool) addCity:(CityStubModel *)city;
-(City *)getCityByName:(NSString *)name;

@end
