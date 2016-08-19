//
//  WFYChooseCityInteractorTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYChooseCityInteractor.h"

#import "WFYChooseCityInteractorOutput.h"

@interface WFYChooseCityInteractorTests : XCTestCase

@property (nonatomic, strong) WFYChooseCityInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation WFYChooseCityInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[WFYChooseCityInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(WFYChooseCityInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов WFYChooseCityInteractorInput

@end
