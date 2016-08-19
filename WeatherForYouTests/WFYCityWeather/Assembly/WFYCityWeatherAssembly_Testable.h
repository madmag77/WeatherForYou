//
//  WFYCityWeatherAssembly_Testable.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherAssembly.h"

@class WFYCityWeatherViewController;
@class WFYCityWeatherInteractor;
@class WFYCityWeatherPresenter;
@class WFYCityWeatherRouter;

@interface WFYCityWeatherAssembly ()

- (WFYCityWeatherViewController *)viewWFYCityWeatherModule;
- (WFYCityWeatherPresenter *)presenterWFYCityWeatherModule;
- (WFYCityWeatherInteractor *)interactorWFYCityWeatherModule;
- (WFYCityWeatherRouter *)routerWFYCityWeatherModule;

@end
