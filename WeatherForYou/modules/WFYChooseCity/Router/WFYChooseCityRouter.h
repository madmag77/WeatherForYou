//
//  WFYChooseCityRouter.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface WFYChooseCityRouter : NSObject <WFYChooseCityRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
