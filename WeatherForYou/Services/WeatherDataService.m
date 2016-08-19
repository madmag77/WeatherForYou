//
//  WeatherDataService.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WeatherDataService.h"

@implementation WeatherDataService
-(void) getWeatherDataForLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude withResultBlock: (void(^)(WeatherDataModel *dataModel, WFYError error))resultBlock {
    
    [self doGETOnURL:@"weather" withParams:@{@"lat":latitude, @"lon":longitude} success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable response) {
       // WFYLogVerbose(@"getWeatherDataForLatitude= %@ and lon=%@ current %@",latitude, longitude, response);
        NSError *error = nil;
        WeatherTimeDataModel *cur = [[WeatherTimeDataModel alloc] initWithDictionary:response error:&error];
        if (error) {
            if (resultBlock) resultBlock(nil, WFYJSONParseError);
        } else {
            if ([response objectForKey:@"weather"] && [[response objectForKey:@"weather"] firstObject] && [[[response objectForKey:@"weather"] firstObject] objectForKey:@"icon"]) {
                cur.iconName = (NSString *)[[[response objectForKey:@"weather"] firstObject] objectForKey:@"icon"];
            }
            
            [self doGETOnURL:@"forecast" withParams:@{@"lat":latitude, @"lon":longitude} success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable response) {
               // WFYLogVerbose(@"getWeatherData forecast ForLatitude= %@ and lon=%@ current %@",latitude, longitude, response);
                NSError *error = nil;
                NSArray *items = [WeatherTimeDataModel arrayOfModelsFromDictionaries:[response objectForKey:@"list"] error:&error];
                if (error) {
                    if (resultBlock) resultBlock(nil, WFYJSONParseError);
                } else {
                    WeatherDataModel *data = [WeatherDataModel new];
                    data.current = cur;
                    data.forecast = items;
                    if (resultBlock) resultBlock(data, WFYNoError);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                WFYLogError(@"getWeatherDataForLatitude forecast %@", error.localizedDescription);
                if (resultBlock) resultBlock(nil, WFYNetworkError);
            }];

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WFYLogError(@"getWeatherDataForLatitude current %@", error.localizedDescription);
        if (resultBlock) resultBlock(nil, WFYNetworkError);
        
    }];
    
}

-(void) loadIcon:(NSString *)icon withResultBlock: (void(^)(UIImage *im, WFYError error))resultBlock {
    
}

@end


@implementation WeatherTimeDataModel {
    long long _dt;
}

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"main.temp": @"currentTempInC"
                                                       }];
}

-(void)setDt:(long long)dt {
    self.measurementDate = [NSDate dateWithTimeIntervalSince1970:(dt+[[NSTimeZone localTimeZone] secondsFromGMT])];
    _dt = dt;
}

-(long long) dt {
    return _dt;
}

-(void)setCurrentTempInCWithNSNumber:(NSNumber *)number {
    _currentTempInC = @(number.doubleValue - 273.15); //переводим в цельсий
}

@end


@implementation WeatherDataModel
@end