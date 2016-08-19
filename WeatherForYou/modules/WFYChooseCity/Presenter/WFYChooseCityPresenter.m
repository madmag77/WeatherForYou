//
//  WFYChooseCityPresenter.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityPresenter.h"

#import "WFYChooseCityViewInput.h"
#import "WFYChooseCityInteractorInput.h"
#import "WFYChooseCityRouterInput.h"
#import "RETableViewManager.h"
#import "ActionSheetStringPicker.h"


@implementation WFYChooseCityPresenter {
    NSMutableDictionary *params;
}

#pragma mark - Методы WFYChooseCityModuleInput

- (void)configureModule:(NSMutableDictionary *)paramsFromPrevious {
    params = paramsFromPrevious;
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы WFYChooseCityViewOutput

- (void) viewWillApear {
    [self.interactor updateTable];
}

- (void) setTableViewManager:(RETableViewManager*)manager {
    [self.interactor setTableViewManager:manager];
}

- (void) addBtnTap {    
    [ActionSheetStringPicker showPickerWithTitle:WFYLocalize(@"chooseCityToAdd") rows:[self.interactor getAvailableCities] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        [self.interactor addNewCityWithName:selectedValue];
    } cancelBlock:^(ActionSheetStringPicker *picker) {
        
    } origin:[self.view getView]];
   
}


- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)backBtnTap {
    [self.router goBack];
}
#pragma mark - Методы WFYChooseCityInteractorOutput
-(void) progressShow {
    [self.wait showWaitBarModal:true];
}

-(void) progressDismiss {
    [self.wait dissmissWaitBar];
}

-(void) choosedCity:(City *)city {
    __weak City *cityWeak = city;
    [params setObject:cityWeak forKey:@"city"];
    [self backBtnTap];
}
@end
