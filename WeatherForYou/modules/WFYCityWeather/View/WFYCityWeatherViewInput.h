//
//  WFYCityWeatherViewInput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;

@protocol WFYCityWeatherViewInput <NSObject>

/**
 @author Artem

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
-(void)updateName:(NSString *)name andCoordinates:(NSString *)coords andTemp:(NSString *)temp andTempEdIzm:(NSString *)edIzm andImage:(UIImage *)image;
-(RETableViewManager *)getTableViewManager;
@end
