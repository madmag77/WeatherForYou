



#import <Foundation/Foundation.h>
#import "waitBarHelper.h"
#import "popupMessageHelper.h"
#import <UIKit/UIKit.h>
#import "localizationService.h"

/*
    Usefull common functions exclusively for this application
 **/

extern NSString *kNotificationNewDataForCity;

@interface appSettings : NSObject
+(id<waitBarProtocol>) getWaitObj;
+(id<popupMessageProtocol>) getPopupObj;

+(void)setupNavigationController:(UINavigationController *)navContr andTitle:(NSString *) title andItem:(UINavigationItem *) navItem andLeftButton:(UIBarButtonItem*)leftBtn andRightButton:(UIBarButtonItem*)rightBtn;

+ (UIBarButtonItem*)setMoreButton:(id)target action:(SEL)action;
+ (UIBarButtonItem*)setBackButton:(id)target action:(SEL)action;
+ (UIBarButtonItem*)navBarButtonWithImage:(UIImage *)im andTarget:(id)target andAction:(SEL)action;


@end

/*
 Common colors in the application (color scheme)
 **/
@interface colorScheme : NSObject
+(UIColor *)backgroundColor;
+(UIColor *)navBarBackgroundColor;
+(UIColor *)colorWithSchemeName:(NSString *)schemeName;

@end

/*
 Text styles of the application
 **/
@interface styleScheme : NSObject
+(styleScheme *) schemeWithName:(NSString *)styleName;

@property NSString *colorScheme;
@property NSString *fontName;
@property NSString *fontWeight;
@property float fontSize;
@property NSTextAlignment textAlign;

@end