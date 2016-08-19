//
//  WFYChooseCityViewControllerTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYChooseCityViewController.h"

#import "WFYChooseCityViewOutput.h"

@interface WFYChooseCityViewControllerTests : XCTestCase

@property (nonatomic, strong) WFYChooseCityViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation WFYChooseCityViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[WFYChooseCityViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(WFYChooseCityViewOutput));

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

#pragma mark - Тестирование методов WFYChooseCityViewInput

@end
