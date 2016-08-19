

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 Usefull UI functions 
 **/
@interface Functions : NSObject
+ (UIColor *)colorWithRGBHex:(long)hex;
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;
+ (UIImage *)imageFromColor:(UIColor *)color withFrame:(CGRect)frame;
+ (BOOL)IsIPhone4;
+ (BOOL)IsIPhone5;
+ (BOOL)IsIPhone6;

+(float)koefY;
+(float)koefX;
@end
