//
//  WFYMeasurementCell.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYMeasurementCell.h"

@implementation WFYMeasurementCell
#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 44;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createViewElements];
    
}

- (void)cellWillAppear
{
    //[super cellWillAppear];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
   
    self.measTime.text = [dateFormatter stringFromDate:[self.item getDate]];
    
    self.measVal.text = [NSString stringWithFormat:@"%.1f %@", [self.item getTemperature].floatValue, [self.item getTemperatureEdIzm]];
    
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    
    self.measView = [UIFabric viewWithBackgroundColor:[UIColor lightGrayColor] andIsRoundCorner:YES andIsBorder:NO andSuperView:self];
    self.measView.layer.cornerRadius = 5;
    
    self.measTime = [UIFabric labelWithText:@"" andStyle:@"P2_b" andSuperView:self.measView];
    self.measVal = [UIFabric labelWithText:@"" andStyle:@"P2_b" andSuperView:self.measView];
    
    [self.measView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(30);
        make.right.equalTo(self).with.offset(-30);
        make.top.equalTo(self).with.offset(10);
        make.bottom.equalTo(self).with.offset(-5);
    }];
    
    [self.measTime mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.measView.mas_left).with.offset(50);
        make.centerY.equalTo(self.measView);
    }];
    
    [self.measVal mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.measView.mas_right).with.offset(-50);
        make.centerY.equalTo(self.measView);
    }];
    
}

@end
