//
//  WFYChooseCityViewController.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYChooseCityViewController.h"
#import "Functions.h"
#import "WFYChooseCityTableViewCell.h"
#import "WFYChooseCityViewOutput.h"

@implementation WFYChooseCityViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [appSettings setupNavigationController:self.navigationController andTitle:WFYLocalize(@"WFYChooseCityTitle") andItem:self.navigationItem andLeftButton:[appSettings navBarButtonWithImage:[UIImage imageNamed:@"MT_back"] andTarget:self andAction:@selector(backBtnTap)] andRightButton:[appSettings navBarButtonWithImage:[UIImage imageNamed:@"MT_add"] andTarget:self andAction:@selector(addBtnTap)] ];
    
    
    [self.output viewWillApear];   
}

- (void)updateViewConstraints {
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

#pragma mark - Методы обработки событий от визуальных элементов
-(void)backBtnTap {
    [self.output backBtnTap];
}

-(void)addBtnTap {
    [self.output addBtnTap];
}

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    self.view.backgroundColor = [colorScheme colorWithSchemeName:@"B2"];
   

    UITableView *tv = [[UITableView alloc] init];
    self.tableView = tv;
    [self.view addSubview:tv];
    tv.backgroundColor = [UIColor clearColor];
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    RETableViewSection *dumbSection = [RETableViewSection sectionWithHeaderTitle:@""];
    [self.tableManager addSection:dumbSection];
    self.tableManager[@"WFYChooseCityCellPresenter"] = @"WFYChooseCityTableViewCell";
    [self.output setTableViewManager:self.tableManager];
}
#pragma mark - Методы WFYChooseCityViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    [self createViewElements];
}

-(UIView *)getView {
    return self.view;
}


@end
