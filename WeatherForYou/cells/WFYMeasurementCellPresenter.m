//
//  WFYMeasurementCellPresenter.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYMeasurementCellPresenter.h"

@implementation WFYMeasurementCellPresenter
-(NSDate *)getDate {
    return self.model.date;
}

-(NSNumber *)getTemperature {
    return self.model.temperature;
}

-(NSString *)getTemperatureEdIzm {
    return @"°C";
}
@end
