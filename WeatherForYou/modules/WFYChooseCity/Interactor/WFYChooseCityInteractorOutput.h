//
//  WFYChooseCityInteractorOutput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class City;

@protocol WFYChooseCityInteractorOutput <NSObject>
-(void) progressShow;
-(void) progressDismiss;
-(void) choosedCity:(City *)city;
@end
