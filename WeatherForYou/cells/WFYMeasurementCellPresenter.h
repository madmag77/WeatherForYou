//
//  WFYMeasurementCellPresenter.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RETableViewManager/RETableViewManager.h>
#import "MeasurementPoint.h"

@interface WFYMeasurementCellPresenter : RETableViewItem
@property (readwrite, nonatomic) MeasurementPoint *model;
-(NSDate *)getDate;
-(NSNumber *)getTemperature;
-(NSString *)getTemperatureEdIzm;

@end
