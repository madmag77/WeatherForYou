//
//  WeatherDataService.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFYApiHelper.h"
#import "JSONModel.h"

@interface  WeatherTimeDataModel: JSONModel
@property long long dt;
@property NSDate <Ignore> *measurementDate;
@property NSNumber *currentTempInC;
@property NSString<Ignore> *iconName;
@end

@interface  WeatherDataModel: NSObject
@property WeatherTimeDataModel *current;
@property NSArray *forecast; //WeatherTimeDataModel

@end

@interface WeatherDataService : WFYApiHelper
-(void) getWeatherDataForLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude withResultBlock: (void(^)(WeatherDataModel *dataModel, WFYError error))resultBlock;
-(void) loadIcon:(NSString *)icon withResultBlock: (void(^)(UIImage *im, WFYError error))resultBlock;
@end
