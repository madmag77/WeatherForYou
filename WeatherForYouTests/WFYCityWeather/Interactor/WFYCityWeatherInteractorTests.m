//
//  WFYCityWeatherInteractorTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYCityWeatherInteractor.h"

#import "WFYCityWeatherInteractorOutput.h"

@interface WFYCityWeatherInteractorTests : XCTestCase

@property (nonatomic, strong) WFYCityWeatherInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation WFYCityWeatherInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[WFYCityWeatherInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(WFYCityWeatherInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов WFYCityWeatherInteractorInput

@end
