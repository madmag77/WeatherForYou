//
//  WFYCityWeatherViewController.m
//  WeatherForYou
//
//  Created by Artem on 06/08/2016.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "WFYCityWeatherViewController.h"
#import "Functions.h"
#import "appSettings.h"
#import "WFYCityWeatherViewOutput.h"

@implementation WFYCityWeatherViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNavigationControllerWithName:WFYLocalize(@"WFYCityWeatherTitle")];
    
    [self.output viewWillApear];  
}

-(void) setupNavigationControllerWithName:(NSString *)name {
    [appSettings setupNavigationController:self.navigationController andTitle:name andItem:self.navigationItem andLeftButton:nil andRightButton:[appSettings navBarButtonWithImage:[UIImage imageNamed:@"icon_menu"] andTarget:self andAction:@selector(openCities)]];
    
}

- (void)updateViewConstraints {
    
    [self.nowView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(44));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(10);
    }];
    [self.nowLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nowView);
        make.centerY.equalTo(self.nowView);
    }];
    [self.curTempLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nowLabel.mas_right).with.offset(10);
        make.baseline.equalTo(self.nowLabel);
    }];
    [self.curWeatherIm mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.curTempLabel.mas_right).with.offset(10);
        make.centerY.equalTo(self.nowView);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
        make.right.equalTo(self.nowView);
    }];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nowView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.coordLabel.mas_top).with.offset(-10);;
    }];
    
    [self.coordLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-10);
        make.left.equalTo(self.view).with.offset(15);
        
    }];
    
    [self.coordValsLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(self.coordLabel);
        make.left.equalTo(self.coordLabel.mas_right).with.offset(5);
    }];


    [super updateViewConstraints];
}

#pragma mark - Методы обработки событий от визуальных элементов
-(void)backBtnTap {
    [self.output backBtnTap];
}

-(void)openCities {
    [self.output menuBtnTap];
}

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.view.backgroundColor = [colorScheme colorWithSchemeName:@"B2"];
 

    
    self.coordLabel = [UIFabric labelWithText:WFYLocalize(@"coordinates") andStyle:@"C1_w" andSuperView:self.view];
    self.coordValsLabel = [UIFabric labelWithText:@"" andStyle:@"C1_w" andSuperView:self.view];

    self.nowView = [UIFabric viewWithBackgroundColor:[UIColor clearColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:self.view];
    
    self.nowLabel = [UIFabric labelWithText:WFYLocalize(@"today") andStyle:@"H2_w" andSuperView:self.nowView];
    self.curTempLabel = [UIFabric labelWithText:WFYLocalize(@"today") andStyle:@"H2_w" andSuperView:self.nowView];
    self.curWeatherIm = [UIFabric imageViewWithImageName:@"" andContentMode:UIViewContentModeScaleAspectFit iconMode:NO andSuperView:self.nowView];
    
    UITableView *tv = [[UITableView alloc] init];
    self.tableView = tv;
    [self.view addSubview:tv];
    tv.backgroundColor = [UIColor clearColor];
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    RETableViewSection *tomorrow = [RETableViewSection sectionWithHeaderTitle:WFYLocalize(@"tomorrow")];
    [self.tableManager addSection:tomorrow];
    RETableViewSection *afterTomorrow = [RETableViewSection sectionWithHeaderTitle:WFYLocalize(@"afterTomorrow")];
    [self.tableManager addSection:afterTomorrow];

    self.tableManager[@"WFYMeasurementCellPresenter"] = @"WFYMeasurementCell";
}
#pragma mark - Методы WFYCityWeatherViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    
    [[NSNotificationCenter defaultCenter] addObserver:self.output
                                             selector:@selector(viewWillApear)
                                                 name:UIApplicationWillEnterForegroundNotification object:nil];

    [self createViewElements];
}

-(void)updateName:(NSString *)name andCoordinates:(NSString *)coords andTemp:(NSString *)temp andTempEdIzm:(NSString *)edIzm andImage:(UIImage *)image {
    if (name) [self setupNavigationControllerWithName:name];
    self.coordValsLabel.text = coords;
    self.curTempLabel.text = [NSString stringWithFormat:@"%@ %@", temp, edIzm];
    self.curWeatherIm.image = image;
}

-(RETableViewManager *)getTableViewManager {
    return self.tableManager;
}

@end
