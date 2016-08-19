//
//  WFYChooseCityViewInput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WFYChooseCityViewInput <NSObject>

/**
 @author Artem

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (UIView *)getView;
@end
