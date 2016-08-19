//
//  WFYChooseCityViewOutput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;

@protocol WFYChooseCityViewOutput <NSObject>

/**
 @author Artem

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;
- (void)backBtnTap;
- (void) setTableViewManager:(RETableViewManager*)manager;
- (void) viewWillApear;
- (void) addBtnTap;
@end
