//
//  WFYCityWeatherPresenter.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherViewOutput.h"
#import "WFYCityWeatherInteractorOutput.h"
#import "WFYCityWeatherModuleInput.h"

@protocol WFYCityWeatherViewInput;
@protocol WFYCityWeatherInteractorInput;
@protocol WFYCityWeatherRouterInput;
#import "BasePresenter.h"

@interface WFYCityWeatherPresenter : BasePresenter <WFYCityWeatherModuleInput, WFYCityWeatherViewOutput, WFYCityWeatherInteractorOutput>

@property (nonatomic, weak) id<WFYCityWeatherViewInput> view;
@property (nonatomic, strong) id<WFYCityWeatherInteractorInput> interactor;
@property (nonatomic, strong) id<WFYCityWeatherRouterInput> router;

@end
