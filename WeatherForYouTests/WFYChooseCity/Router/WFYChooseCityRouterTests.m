//
//  WFYChooseCityRouterTests.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "WFYChooseCityRouter.h"

@interface WFYChooseCityRouterTests : XCTestCase

@property (nonatomic, strong) WFYChooseCityRouter *router;

@end

@implementation WFYChooseCityRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[WFYChooseCityRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
