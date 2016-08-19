//
//  WFYChooseCityAssembly_Testable.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityAssembly.h"

@class WFYChooseCityViewController;
@class WFYChooseCityInteractor;
@class WFYChooseCityPresenter;
@class WFYChooseCityRouter;

@interface WFYChooseCityAssembly ()

- (WFYChooseCityViewController *)viewWFYChooseCityModule;
- (WFYChooseCityPresenter *)presenterWFYChooseCityModule;
- (WFYChooseCityInteractor *)interactorWFYChooseCityModule;
- (WFYChooseCityRouter *)routerWFYChooseCityModule;

@end
