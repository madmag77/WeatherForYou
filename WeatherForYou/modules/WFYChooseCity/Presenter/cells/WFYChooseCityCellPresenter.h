//
//  WFYChooseCityCellPresenter.h
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "City.h"

@interface WFYChooseCityCellPresenter : RETableViewItem
@property (readwrite, nonatomic) City *model;
-(NSString *) getCityName;
-(NSString *) getTemperature;
-(NSString *) getEdIzm;
@end
