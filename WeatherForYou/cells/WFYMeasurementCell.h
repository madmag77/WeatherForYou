//
//  WFYMeasurementCell.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "WFYMeasurementCellPresenter.h"

@interface WFYMeasurementCell : RETableViewCell
@property (strong, readwrite, nonatomic) WFYMeasurementCellPresenter *item;
@property (weak, nonatomic) IBOutlet UIView *measView;
@property (weak, nonatomic) IBOutlet UILabel *measTime;
@property (weak, nonatomic) IBOutlet UILabel *measVal;
@end
