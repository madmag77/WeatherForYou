//
//  WFYChooseCityAssembly.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityAssembly.h"

#import "WFYChooseCityViewController.h"
#import "WFYChooseCityInteractor.h"
#import "WFYChooseCityPresenter.h"
#import "WFYChooseCityRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>



@implementation WFYChooseCityAssembly

- (WFYChooseCityViewController *)viewWFYChooseCityModule {
    return [TyphoonDefinition withClass:[WFYChooseCityViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterWFYChooseCityModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterWFYChooseCityModule]];
                          }];
}

- (WFYChooseCityInteractor *)interactorWFYChooseCityModule {
    return [TyphoonDefinition withClass:[WFYChooseCityInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterWFYChooseCityModule]];
                              [definition injectProperty:@selector(daemon)
                                                    with:[self.servicesAssembly deamon]];
                          }];
}

- (WFYChooseCityPresenter *)presenterWFYChooseCityModule {
    return [TyphoonDefinition withClass:[WFYChooseCityPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                           definition.parent = [self.presenterAssembly basePresenter];
                              [definition injectProperty:@selector(view)
                                                    with:[self viewWFYChooseCityModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorWFYChooseCityModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerWFYChooseCityModule]];

                          }];
}

- (WFYChooseCityRouter *)routerWFYChooseCityModule {
    return [TyphoonDefinition withClass:[WFYChooseCityRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewWFYChooseCityModule]];
                          }];
}

@end
