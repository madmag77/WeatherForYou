//
//  WFYChooseCityPresenterTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYChooseCityPresenter.h"

#import "WFYChooseCityViewInput.h"
#import "WFYChooseCityInteractorInput.h"
#import "WFYChooseCityRouterInput.h"

@interface WFYChooseCityPresenterTests : XCTestCase

@property (nonatomic, strong) WFYChooseCityPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation WFYChooseCityPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[WFYChooseCityPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(WFYChooseCityInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(WFYChooseCityRouterInput));
    self.mockView = OCMProtocolMock(@protocol(WFYChooseCityViewInput));

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

#pragma mark - Тестирование методов WFYChooseCityModuleInput

#pragma mark - Тестирование методов WFYChooseCityViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов WFYChooseCityInteractorOutput

@end
