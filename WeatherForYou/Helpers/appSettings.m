

#import "appSettings.h"
#import "Functions.h"
#import "masonry.h"

NSString *kNotificationNewDataForCity = @"kNotificationNewDataForCity";

@implementation appSettings


+(id<waitBarProtocol>) getWaitObj {
    return [waitBarHelper getSharedInstance];
}

+(id<popupMessageProtocol>) getPopupObj {
    return [popupMessageHelper getSharedInstance];
}

+ (UIBarButtonItem*)navBarButtonWithImage:(UIImage *)im andTarget:(id)target andAction:(SEL)action {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:im forState:UIControlStateNormal];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 22, 22);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    return backButton;
    
}


+ (UIBarButtonItem*)setBackButton:(id)target action:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"MT_back"];
    //UIImage *backBtnImagePressed = [UIImage imageNamed:@"menu"];
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    //[backBtn setBackgroundImage:backBtnImagePressed forState:UIControlStateHighlighted];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 22, 22);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    
    return backButton;
}

+ (UIBarButtonItem*)setMoreButton:(id)target action:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"MT_set"];
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 22, 22);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    //backButtonView.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    return backButton;
}

+(void)setupNavigationController:(UINavigationController *)navContr andTitle:(NSString *) title andItem:(UINavigationItem *) navItem withSelf:(id)delegate andBackSelector:(SEL)backSelector andMoreSelector:(SEL)moreSelector {
    [appSettings setupNavigationController:navContr andTitle:title andItem:navItem andLeftButton:[appSettings setBackButton:delegate action:backSelector] andRightButton:[appSettings setMoreButton:delegate action:moreSelector]];
    
    
}

+(void)setupNavigationController:(UINavigationController *)navContr andTitle:(NSString *) title andItem:(UINavigationItem *) navItem andLeftButton:(UIBarButtonItem*)leftBtn andRightButton:(UIBarButtonItem*)rightBtn {
    navContr.navigationBar.hidden = false;
    navContr.navigationBar.backItem.title = @"";
    navContr.title = @"";
    navContr.navigationBar.barTintColor =  [colorScheme navBarBackgroundColor];
    navContr.navigationBar.backgroundColor = [colorScheme navBarBackgroundColor];
    navContr.navigationBar.translucent = NO;
    
    
    UILabel *titLabel = [navContr.navigationBar viewWithTag:11];
    if (titLabel == nil) {
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, navContr.navigationBar.frame.size.width, 40)];
        
        titleLab.text = title;
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
        titleLab.textColor = [Functions colorWithRGBHex:0xD7D7D7];
        titleLab.tag = 11;
        
        [navContr.navigationBar addSubview:titleLab];
        
    } else {
        titLabel.text = title;
    }
    navItem.leftBarButtonItem = leftBtn;
    navItem.rightBarButtonItem = rightBtn;

}

@end

@implementation colorScheme

+(NSDictionary *) getSchemes {
    static NSDictionary *schemes;
    if (!schemes) schemes = @{
                              @"backgroundActiveColor": @(0xF0F0F0),
                              @"headerColor": @(0x000000),
                              @"buttonTextColor": @(0xFFFFFF),
                              @"buttonColor": @(0x545C76),
                              @"cellHeaderColor": @(0x4A4A4A),
                              @"cellSubColor": @(0x9B9B9B),
                              @"callButtonTextColor": @(0xFFFFFF),
                              @"videoCaleeNameColor": @(0x4A4A4A),
                              @"A1": @(0x7ED321),
                              @"A2": @(0xF5A623),
                              @"A3": @(0xE23000),
                              @"A4": @(0x5B9AFF),
                              @"B1": @(0x09233C),
                              @"B2": @(0x545C76),
                              @"R1": @(0x4A4A4A),
                              @"R2": @(0x9B9B9B),
                              @"R3": @(0xD8D8D8),
                              @"R4": @(0xF4F4F4),
                              @"R5": @(0xFFFFFF),
                              };
    
    return schemes;
}


+(UIColor *)colorWithSchemeName:(NSString *)schemeName
{
    NSDictionary *schemes = [self getSchemes];
    NSNumber *colorNum = [schemes valueForKey:schemeName];
    return [Functions colorWithRGBHex:[colorNum longValue]];
}

+(UIColor *)backgroundColor {
    return [Functions colorWithRGBHex:0x09233C];
}

+(UIColor *)navBarBackgroundColor {
    return [Functions colorWithRGBHex:0x09233C];
}

@end

@implementation styleScheme

+(NSDictionary *) getSchemes {
    static NSDictionary *schemes;
    if (!schemes) schemes = @{
                              @"pageName": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Light", @"fontSize":@(20.0), @"fontColor":@"headerColor", @"fontAlign":@(1)},
                              @"CellH1": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Medium", @"fontSize":@(16.0), @"fontColor":@"cellHeaderColor", @"fontAlign":@(0)},
                              @"CellSub": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(10.0), @"fontColor":@"cellSubColor", @"fontAlign":@(0)},
                              @"buttonText": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(18.0), @"fontColor":@"buttonTextColor", @"fontAlign":@(1)},
                              @"callButtons": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(14.0), @"fontColor":@"callButtonTextColor", @"fontAlign":@(0)},
                              @"videoCaleeName": @{@"fontName":@"Helvetica-Neue", @"fontWeight":@"Medium", @"fontSize":@(12.0), @"fontColor":@"videoCaleeNameColor", @"fontAlign":@(1)},
                              @"CallName": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(18.0), @"fontColor":@"R5", @"fontAlign":@(0)},
                              @"Comment2": @{@"fontName":@"SFUIText", @"fontWeight":@"Regular", @"fontSize":@(12.0), @"fontColor":@"R5", @"fontAlign":@(0)},
                              @"NavLabel": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(18.0), @"fontColor":@"R5", @"fontAlign":@(1)},
                              
                              @"H0_w": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Semibold", @"fontSize":@(30.0), @"fontColor":@"R5", @"fontAlign":@(1)},
                              @"H2_w": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(18.0), @"fontColor":@"R5", @"fontAlign":@(1)},
                              @"H2_w1": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(18.0), @"fontColor":@"R5", @"fontAlign":@(0)},
                              @"P3_w": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(12.0), @"fontColor":@"R5", @"fontAlign":@(1)},
                              @"C1_w": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(8.0), @"fontColor":@"R5", @"fontAlign":@(1)},
                              
                              @"P2_lg": @{@"fontName":@"SFUIText", @"fontWeight":@"Regular", @"fontSize":@(14.0), @"fontColor":@"R2", @"fontAlign":@(1)},
                              @"P3_lg": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(12.0), @"fontColor":@"R2", @"fontAlign":@(1)},
                              @"C1_lg": @{@"fontName":@"SFUIText", @"fontWeight":@"Semibold", @"fontSize":@(10.0), @"fontColor":@"R2", @"fontAlign":@(1)},
                              @"C1a_lg": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(10.0), @"fontColor":@"R2", @"fontAlign":@(1)},

                              @"P1_g": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(16.0), @"fontColor":@"R1", @"fontAlign":@(1)},
                              @"P1_g1": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(16.0), @"fontColor":@"R1", @"fontAlign":@(0)},
                              @"P3_g": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Medium", @"fontSize":@(12.0), @"fontColor":@"R1", @"fontAlign":@(1)},
                              @"P3_g1": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(12.0), @"fontColor":@"R1", @"fontAlign":@(0)},
                              @"C1_g": @{@"fontName":@"SFUIText", @"fontWeight":@"Regular", @"fontSize":@(10.0), @"fontColor":@"R1", @"fontAlign":@(1)},

                              @"H1_b": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Light", @"fontSize":@(20.0), @"fontColor":@"B1", @"fontAlign":@(1)},
                              @"H2_b": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Medium", @"fontSize":@(18.0), @"fontColor":@"B1", @"fontAlign":@(1)},
                              @"P2_b": @{@"fontName":@"SFUIText", @"fontWeight":@"Regular", @"fontSize":@(14.0), @"fontColor":@"B1", @"fontAlign":@(1)},
                              @"P2a_b": @{@"fontName":@"SFUIDisplay", @"fontWeight":@"Regular", @"fontSize":@(14.0), @"fontColor":@"B1", @"fontAlign":@(1)},
                              @"P2_b1": @{@"fontName":@"SFUIText", @"fontWeight":@"Medium", @"fontSize":@(14.0), @"fontColor":@"B1", @"fontAlign":@(1)},
                             
                              
                              };
    
    return schemes;
}

+(void) load {

}


+(styleScheme *) schemeWithName:(NSString *)styleName {
    NSDictionary *schemes = [self getSchemes];
    styleScheme *res = [styleScheme new];
    res.colorScheme = [[schemes valueForKey:styleName] valueForKey:@"fontColor"];
    res.fontName = [[schemes valueForKey:styleName] valueForKey:@"fontName"];
    res.fontWeight = [[schemes valueForKey:styleName] valueForKey:@"fontWeight"];
    res.fontSize = [[[schemes valueForKey:styleName] valueForKey:@"fontSize"] floatValue];
    res.textAlign = [[[schemes valueForKey:styleName] valueForKey:@"fontAlign"] intValue];
    return res;
}


@end