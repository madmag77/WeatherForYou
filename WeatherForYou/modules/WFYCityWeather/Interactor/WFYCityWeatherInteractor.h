//
//  WFYCityWeatherInteractor.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherInteractorInput.h"
#import "ServicesAssembly.h"

@protocol WFYCityWeatherInteractorOutput;

@interface WFYCityWeatherInteractor : NSObject <WFYCityWeatherInteractorInput>

@property (nonatomic, weak) id<WFYCityWeatherInteractorOutput> output;
@property WeatherDeamon *daemon;
@property ImageStorageService *imagesService;
@end
