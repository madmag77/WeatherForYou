//
//  WFYCityWeatherInteractorOutput.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WFYCityWeatherInteractorOutput <NSObject>
-(void) progressShow;
-(void) progressDismiss;
-(void)updateCurrentCityWithName:(NSString *)name andLongitude:(double)lon andLatitude:(float)lat andTemp:(NSNumber *)temp andTempEdIzm:(NSString *)edIzm andImage:(UIImage *)image;
@end
