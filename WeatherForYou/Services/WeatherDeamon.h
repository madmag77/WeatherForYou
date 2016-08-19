//
//  WeatherDeamon.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoLocationService.h"

@class WheatherDBService;
@class WeatherDataService;
@class City;
@class ImageStorageService;

@interface WeatherDeamon : NSObject <GeoLocationServiceProtocol>
@property WheatherDBService *dbService;
@property WeatherDataService *weatherDataService;
@property GeoLocationService *geoService;
@property ImageStorageService *imagesService;
@property (readonly) NSArray* availableCityNames;
@property (readonly) NSArray* allCities;
@property (readonly) City* currentCity;

-(void)startDaemon;
-(void)stopDaemon;
-(bool)addCityWithName:(NSString *)name;
-(void)deleteCity:(City *)city;
-(City *)getCityByName:(NSString *)name;
@end
