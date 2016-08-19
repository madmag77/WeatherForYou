//
//  WFYCityWeatherPresenterTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYCityWeatherPresenter.h"

#import "WFYCityWeatherViewInput.h"
#import "WFYCityWeatherInteractorInput.h"
#import "WFYCityWeatherRouterInput.h"

@interface WFYCityWeatherPresenterTests : XCTestCase

@property (nonatomic, strong) WFYCityWeatherPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation WFYCityWeatherPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[WFYCityWeatherPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(WFYCityWeatherInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(WFYCityWeatherRouterInput));
    self.mockView = OCMProtocolMock(@protocol(WFYCityWeatherViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов WFYCityWeatherModuleInput

#pragma mark - Тестирование методов WFYCityWeatherViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов WFYCityWeatherInteractorOutput

@end
