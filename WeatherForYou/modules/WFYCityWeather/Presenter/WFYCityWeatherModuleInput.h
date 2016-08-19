//
//  WFYCityWeatherModuleInput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
//#import "ViperMcFlurry.h"

@protocol WFYCityWeatherModuleInput <RamblerViperModuleInput>

/**
 @author Artem

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
