//
//  WFYChooseCityPresenter.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityViewOutput.h"
#import "WFYChooseCityInteractorOutput.h"
#import "WFYChooseCityModuleInput.h"
#import "BasePresenter.h"

@protocol WFYChooseCityViewInput;
@protocol WFYChooseCityInteractorInput;
@protocol WFYChooseCityRouterInput;

@interface WFYChooseCityPresenter : BasePresenter <WFYChooseCityModuleInput, WFYChooseCityViewOutput, WFYChooseCityInteractorOutput>

@property (nonatomic, weak) id<WFYChooseCityViewInput> view;
@property (nonatomic, strong) id<WFYChooseCityInteractorInput> interactor;
@property (nonatomic, strong) id<WFYChooseCityRouterInput> router;

@end
