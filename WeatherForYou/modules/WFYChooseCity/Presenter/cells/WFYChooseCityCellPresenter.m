//
//  WFYChooseCityCellPresenter.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityCellPresenter.h"
#import "CurrentWeather.h"
#import "MeasurementPoint.h"
#import "Functions.h"

@implementation WFYChooseCityCellPresenter
-(NSString *) getCityName {
    return self.model.name;
}

-(NSString *) getTemperature {
    return [NSString stringWithFormat:@"%.1f", ((CurrentWeather *)self.model.current).currentMeasure.temperature.floatValue];
}

-(NSString *) getEdIzm {
    return @"°C";
}

@end
