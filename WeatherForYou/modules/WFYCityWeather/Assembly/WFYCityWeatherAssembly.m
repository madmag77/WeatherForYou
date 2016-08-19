//
//  WFYCityWeatherAssembly.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherAssembly.h"

#import "WFYCityWeatherViewController.h"
#import "WFYCityWeatherInteractor.h"
#import "WFYCityWeatherPresenter.h"
#import "WFYCityWeatherRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>



@implementation WFYCityWeatherAssembly

- (WFYCityWeatherViewController *)viewWFYCityWeatherModule {
    return [TyphoonDefinition withClass:[WFYCityWeatherViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterWFYCityWeatherModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterWFYCityWeatherModule]];
                          }];
}

- (WFYCityWeatherInteractor *)interactorWFYCityWeatherModule {
    return [TyphoonDefinition withClass:[WFYCityWeatherInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterWFYCityWeatherModule]];
                              [definition injectProperty:@selector(daemon)
                                                    with:[self.servicesAssembly deamon]];
                              [definition injectProperty:@selector(imagesService)
                                                    with:[self.servicesAssembly imagesStorageService]];
                          }];
}

- (WFYCityWeatherPresenter *)presenterWFYCityWeatherModule {
    return [TyphoonDefinition withClass:[WFYCityWeatherPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                            definition.parent = [self.presenterAssembly basePresenter];
                              [definition injectProperty:@selector(view)
                                                    with:[self viewWFYCityWeatherModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorWFYCityWeatherModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerWFYCityWeatherModule]];
                          }];
}

- (WFYCityWeatherRouter *)routerWFYCityWeatherModule {
    return [TyphoonDefinition withClass:[WFYCityWeatherRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewWFYCityWeatherModule]];
                          }];
}

@end
