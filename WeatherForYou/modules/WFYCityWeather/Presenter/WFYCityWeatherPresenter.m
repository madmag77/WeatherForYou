//
//  WFYCityWeatherPresenter.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherPresenter.h"

#import "WFYCityWeatherViewInput.h"
#import "WFYCityWeatherInteractorInput.h"
#import "WFYCityWeatherRouterInput.h"

@implementation WFYCityWeatherPresenter {
    NSMutableDictionary *params;
}

#pragma mark - Методы WFYCityWeatherModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы WFYCityWeatherViewOutput
- (void) viewWillApear {
    if (!params) params = [NSMutableDictionary new];
    [self.interactor setCurrenCity:[params objectForKey:@"city"]];
}

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.view updateName:nil andCoordinates:WFYLocalize(@"refreshInProgress") andTemp:@"--" andTempEdIzm:@"--" andImage:nil];
    [self.interactor initWithTableViewManager:[self.view getTableViewManager]];
}


- (void)backBtnTap {
    [self.router goBack];
}

- (void) menuBtnTap {
    [self.router openChooseCityWithParams:params];
}
#pragma mark - Методы WFYCityWeatherInteractorOutput
-(void) progressShow {
    [self.wait showWaitBarModal:true];
}

-(void) progressDismiss {
    [self.wait dissmissWaitBar];
}

-(void)updateCurrentCityWithName:(NSString *)name andLongitude:(double)lon andLatitude:(float)lat andTemp:(NSNumber *)temp andTempEdIzm:(NSString *)edIzm andImage:(UIImage *)image {
    [self.view updateName:name andCoordinates:[NSString stringWithFormat:@"%.5f, %.5f", lat, lon] andTemp:[NSString stringWithFormat:@"%.1f", temp.floatValue] andTempEdIzm:edIzm andImage:image];
}
@end
