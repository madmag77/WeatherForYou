//
//  WFYCityWeatherViewController.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "WFYCityWeatherViewInput.h"
#import "RETableViewManager.h"

@protocol WFYCityWeatherViewOutput;

@interface WFYCityWeatherViewController : UIViewController <WFYCityWeatherViewInput>

@property (nonatomic, strong) id<WFYCityWeatherViewOutput> output;

@property (weak, nonatomic) IBOutlet UILabel *coordLabel;
@property (weak, nonatomic) IBOutlet UILabel *coordValsLabel;

@property (weak, nonatomic) IBOutlet UIView *nowView;
@property (weak, nonatomic) IBOutlet UILabel *nowLabel;
@property (weak, nonatomic) IBOutlet UILabel *curTempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *curWeatherIm;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RETableViewManager *tableManager;

@end
