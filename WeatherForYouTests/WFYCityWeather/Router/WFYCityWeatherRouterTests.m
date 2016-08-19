//
//  WFYCityWeatherRouterTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYCityWeatherRouter.h"

@interface WFYCityWeatherRouterTests : XCTestCase

@property (nonatomic, strong) WFYCityWeatherRouter *router;

@end

@implementation WFYCityWeatherRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[WFYCityWeatherRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
