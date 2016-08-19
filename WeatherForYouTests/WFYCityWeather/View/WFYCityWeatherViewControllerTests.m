//
//  WFYCityWeatherViewControllerTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYCityWeatherViewController.h"

#import "WFYCityWeatherViewOutput.h"

@interface WFYCityWeatherViewControllerTests : XCTestCase

@property (nonatomic, strong) WFYCityWeatherViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation WFYCityWeatherViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[WFYCityWeatherViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(WFYCityWeatherViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов WFYCityWeatherViewInput

@end
