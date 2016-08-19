//
//  WFYChooseCityViewController.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "WFYChooseCityViewInput.h"
#import "RETableViewManager.h"

@protocol WFYChooseCityViewOutput;

@interface WFYChooseCityViewController : UIViewController <WFYChooseCityViewInput>

@property (nonatomic, strong) id<WFYChooseCityViewOutput> output;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RETableViewManager *tableManager;
@end
