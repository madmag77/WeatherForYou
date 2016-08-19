//
//  WFYChooseCityModuleInput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol WFYChooseCityModuleInput <RamblerViperModuleInput>

/**
 @author Artem

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule:(NSMutableDictionary *)params;

@end
