//
//  WFYCityWeatherRouter.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface WFYCityWeatherRouter : NSObject <WFYCityWeatherRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
