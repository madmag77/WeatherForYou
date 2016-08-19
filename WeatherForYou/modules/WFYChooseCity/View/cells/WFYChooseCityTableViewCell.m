//
//  WFYChooseCityTableViewCell.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityTableViewCell.h"
#import "Functions.h"


@implementation WFYChooseCityTableViewCell
#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 60;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createViewElements];

}

- (void)cellWillAppear
{
    [super cellWillAppear];

    self.nameLab.text = [self.item getCityName];
    self.tempLab.text = [self.item getTemperature];
    self.tempEdIzmLab.text = [self.item getEdIzm];
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    
    self.nameLab = [UIFabric labelWithText:@"" andStyle:@"H2_w" andSuperView:self];
    self.nameLab.numberOfLines = 2;
    self.tempLab = [UIFabric labelWithText:@"" andStyle:@"H2_w" andSuperView:self];
    self.tempEdIzmLab = [UIFabric labelWithText:@"" andStyle:@"H2_w" andSuperView:self];
    
    
    [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(50);
        make.right.equalTo(self.tempLab).with.offset(-5);
        make.centerY.equalTo(self);
    }];
    
    [self.tempLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tempEdIzmLab.mas_left).with.offset(-5);
        make.centerY.equalTo(self);
    }];
    
    [self.tempEdIzmLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-50);
        make.centerY.equalTo(self);
    }];
    /*
    MGSwipeButton *del = [MGSwipeButton buttonWithTitle:WFYLocalize(@"delete") backgroundColor:[UIColor clearColor] callback:^BOOL(MGSwipeTableCell *sender) {
        //[self.item setFavorUser:self.item.model];
        return YES;
    }];
        
    self.rightButtons = @[del];
*/
}
@end
