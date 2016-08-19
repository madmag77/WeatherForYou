//
//  WheatherDBService.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WheatherDBService.h"
#import "City.h"

@implementation WheatherDBService

-(void) addDefaultCities {
    [self addCity:[[self getAvailabeCities] objectForKey:WFYLocalize(@"london")]];
    [self addCity:[[self getAvailabeCities] objectForKey:WFYLocalize(@"tokyo")]];
    [self addCity:[[self getAvailabeCities] objectForKey:WFYLocalize(@"nyc")]];

    City *cur = [City MR_createEntity];
    cur.name = WFYLocalize(@"current");
    cur.locationLat = nil;
    cur.locationLon = nil;
    cur.currentLocation = @(true);

    [self save];
}

-(bool) addCity:(CityStubModel *)city {
    if ([self getCityByName:city.name]) return false;
    
    City *cityMore = [City MR_createEntity];
    cityMore.name = city.name;
    cityMore.locationLat = city.lat;
    cityMore.locationLon = city.lon;
    cityMore.currentLocation = @(false);
    return true;
}

-(bool) isTheFirstTime {
    bool res = false;
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HasBeenLaunched"])
    {
        res = true;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasBeenLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return res;
}

-(void) initService {
    [MagicalRecord setupCoreDataStackWithStoreNamed:self.storeName];

    if ([self getAllCities].count == 0 && [self isTheFirstTime]) {
        [self addDefaultCities];
    }
}

-(void) stopService {
    [MagicalRecord cleanUp];
}

-(NSArray *) getAllCities {
    return [City MR_findAll];
}

-(City *)getCurrent {
    return [City MR_findFirstByAttribute:@"currentLocation"
                               withValue:@(true)];
}

-(void)save {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

-(NSDictionary *)getAvailabeCities {
    static NSDictionary *stubDict = nil;
    if (!stubDict) {
        stubDict = [NSMutableDictionary new];
        CityStubModel *london = [CityStubModel new];
        london.name = WFYLocalize(@"london");
        london.lat = @(51.5085300);
        london.lon = @(-0.1257400);
        
        CityStubModel *tokyo = [CityStubModel new];
        tokyo.name = WFYLocalize(@"tokyo");
        tokyo.lat = @(35.6895000);
        tokyo.lon = @(139.6917100);
        
        CityStubModel *nyc = [CityStubModel new];
        nyc.name = WFYLocalize(@"nyc");
        nyc.lat = @(40.71448);
        nyc.lon = @(-74.00598);

        CityStubModel *moscow = [CityStubModel new];
        moscow.name = WFYLocalize(@"moscow");
        moscow.lat = @(55.751244);
        moscow.lon = @(37.618423);
        
        [stubDict setValue:london forKey:WFYLocalize(@"london")];
        [stubDict setValue:tokyo forKey:WFYLocalize(@"tokyo")];
        [stubDict setValue:nyc forKey:WFYLocalize(@"nyc")];
        [stubDict setValue:moscow forKey:WFYLocalize(@"moscow")];
    }
    return stubDict;
}

-(City *)getCityByName:(NSString *)name {
    return [City MR_findFirstByAttribute:@"name" withValue:name];
}
@end

@implementation CityStubModel


@end
