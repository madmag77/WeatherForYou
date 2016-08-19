//
//  WFYCityWeatherRouter.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherRouter.h"
#import "WFYChooseCityModuleInput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>


@implementation WFYCityWeatherRouter

#pragma mark - Методы WFYCityWeatherRouterInput
-(void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

-(void)openChooseCityWithParams:(NSMutableDictionary *)params {
    [[self.transitionHandler openModuleUsingSegue:@"to choose city"] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<WFYChooseCityModuleInput> moduleInput) {
        [moduleInput configureModule:params];
        return nil;
    }];
    
}

@end
