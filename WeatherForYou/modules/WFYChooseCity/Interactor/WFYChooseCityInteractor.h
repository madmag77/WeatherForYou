//
//  WFYChooseCityInteractor.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityInteractorInput.h"
#import "ServicesAssembly.h"


@protocol WFYChooseCityInteractorOutput;

@interface WFYChooseCityInteractor : NSObject <WFYChooseCityInteractorInput>

@property (nonatomic, weak) id<WFYChooseCityInteractorOutput> output;
@property WeatherDeamon *daemon;
@end
