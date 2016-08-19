//
//  WFYChooseCityTableViewCell.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "WFYChooseCityCellPresenter.h"

@interface WFYChooseCityTableViewCell : RETableViewCell

@property (strong, readwrite, nonatomic) WFYChooseCityCellPresenter *item;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *tempLab;
@property (weak, nonatomic) IBOutlet UILabel *tempEdIzmLab;

@end
