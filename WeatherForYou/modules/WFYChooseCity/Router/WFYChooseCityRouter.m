//
//  WFYChooseCityRouter.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>


@implementation WFYChooseCityRouter

#pragma mark - Методы WFYChooseCityRouterInput
-(void)goBack {
    [self.transitionHandler closeCurrentModule:true];
}



@end
