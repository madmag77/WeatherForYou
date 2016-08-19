//
//  WFYCityWeatherViewOutput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WFYCityWeatherViewOutput <NSObject>

/**
 @author Artem

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;
- (void)backBtnTap;
- (void) viewWillApear;
- (void) menuBtnTap;
@end
