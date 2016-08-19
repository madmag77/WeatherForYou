

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"

/*
 Fabric of UI elements 
 **/
@interface UIFabric : NSObject

+(UILabel *) labelWithText:(NSString *)text andStyle:(NSString *)styleName andSuperView:(UIView *)parent;

+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andSuperView:(UIView *)parent;

+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color andFontName:(NSString *)fontName andFontSize:(float)fontSize andSuperView:(UIView *)parent;

+(UIView *) viewWithBackgroundColor:(UIColor *)color andIsRoundCorner:(bool)corner andIsBorder:(bool)border  andSuperView:(UIView *)parent;

+(UIImageView *) imageViewWithImageName:(NSString *)image andContentMode:(UIViewContentMode)contentMode iconMode:(bool)iconMode andSuperView:(UIView *)parent;

+(UIImageView *) imageViewWithImage:(UIImage *)image andContentMode:(UIViewContentMode)contentMode iconMode:(bool)iconMode andSuperView:(UIView *)parent;

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent;

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent;

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andBackgroundImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent;

+(UIButton *) buttonWithText:(NSString *)text andStyle:(NSString *)styleName andBackgroundColor:(UIColor *)bcolor  andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent;

+(UIButton *) buttonWithImage:(NSString *)image andSuperView:(UIView *)parent andTarget:(id)target andSelector:(SEL)selector;

+(UITextField *) textFieldWithPlaceholder:(NSString *)text  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andIsPassword:(bool)isPassword andSuperView:(UIView *)parent;

+(UIButton *) wcRoundButtonWithText:(NSString *)text andBackgroundImage:(NSString *)bImage andOnBackgroundImage:(NSString *)bOnImage orImage:(NSString *)image andSuperView:(UIView *)parent;

+(UITextView *) textViewWithText:(NSString *)text andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andIsEditable:(bool)isEditable andSuperView:(UIView *)parent;


@end


@interface UICustomElementWCInput : NSObject
@property UIView *v;
@property UIImageView *im;
@property UILabel *lab;
@property UITextField *inp;

+(UICustomElementWCInput *) createElementWithName:(NSString *)name andIcon:(NSString *)iconName andPaceHolder:(NSString *)placeHolder andTextSize:(float)textSize andIsPassword:(bool)isPassword andParent:(UIView *)parent;

-(void) updateConstraints;

@end

@interface UICustomSlider : NSObject
@property UIImageView *v;
@property UIImageView *im;
@property UILabel *lab;

+(UICustomSlider *) createElementWithHint:(NSString *)name andParent:(UIView *)parent;

-(void) updateConstraints;

@end

