
#define DEFAULT_FONT @"SFUIDisplay" //if you send nil for font
#define ADOPT_FONTS 0 //change size of font proportional to screen height

#import "UIFabric.h"
#import "Functions.h"
#import "appSettings.h"

@implementation UIFabric

+(UILabel *) labelWithText:(NSString *)text andStyle:(NSString *)styleName andSuperView:(UIView *)parent {
    styleScheme *style = [styleScheme schemeWithName:styleName];
    UIColor *textColor = [colorScheme colorWithSchemeName:style.colorScheme];
    if (!textColor) textColor = [UIColor blackColor];
    if (style) {
        return [self labelWithText:text andTextColor:textColor andFontName:style.fontName andFontModificator:style.fontWeight andFontSize:style.fontSize andSuperView:parent];
    } else {
        return [self labelWithText:text andTextColor:textColor andFontName:nil andFontModificator:nil andFontSize:18.0 andSuperView:parent];
    }
}

+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andSuperView:(UIView *)parent {
    
    UILabel *lab = [UILabel new];
    [parent addSubview:lab];
    lab.text = text;
    lab.textColor = color;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    if (modif) lab.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else lab.font = [UIFont fontWithName:fontName size:fontSize];
    return lab;
}

+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontSize:(float)fontSize andSuperView:(UIView *)parent {
    
    UILabel *lab = [UILabel new];
    [parent addSubview:lab];
    lab.text = text;
    lab.textColor = color;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    lab.font = [UIFont fontWithName:fontName size:fontSize];
    return lab;
}

+(UIView *) viewWithBackgroundColor:(UIColor *)color andIsRoundCorner:(bool)corner andIsBorder:(bool)border  andSuperView:(UIView *)parent {
    
    UIView *v = [UIView new];
    [parent addSubview:v];
    v.backgroundColor = color;
    if (corner) {
        v.layer.cornerRadius = 3;
        v.clipsToBounds = YES;
    }
    if (border) {
        v.layer.borderWidth = 1;
        v.layer.borderColor = [[Functions colorWithRGBHex:0xeaeaea] CGColor];
    }
    return v;
}

+(UIImageView *) imageViewWithImageName:(NSString *)image andContentMode:(UIViewContentMode)contentMode iconMode:(bool)iconMode  andSuperView:(UIView *)parent {
    
    UIImageView *im = [[UIImageView alloc] init];
    [parent addSubview:im];
    if (image) [im setImage:[UIImage imageNamed:image]];
    im.contentMode = contentMode;
    
    if (iconMode) im.image = [im.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    return im;
}

+(UIImageView *) imageViewWithImage:(UIImage *)image andContentMode:(UIViewContentMode)contentMode iconMode:(bool)iconMode andSuperView:(UIView *)parent {
    
    UIImageView *im = [[UIImageView alloc] init];
    [parent addSubview:im];
    if (image) [im setImage:image];
    im.contentMode = contentMode;
    
    if (iconMode) im.image = [im.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return im;
    
}

+(UIButton *) buttonWithText:(NSString *)text andStyle:(NSString *)styleName andBackgroundColor:(UIColor *)bcolor  andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent {
    styleScheme *style = [styleScheme schemeWithName:styleName];
    UIColor *textColor = [colorScheme colorWithSchemeName:style.colorScheme];
    if (!textColor) textColor = [UIColor blackColor];
    if (style) {
        return [self buttonWithText:text andTextColor:textColor andFontName:style.fontName andFontModificator:style.fontWeight andFontSize:style.fontSize andBackgroundColor:bcolor andImage:nil andIsRoundCorner:corner andSuperView:parent];
    } else {
        return [self buttonWithText:text andTextColor:textColor andFontName:nil andFontModificator:nil andFontSize:18.0 andBackgroundColor:bcolor andImage:nil andIsRoundCorner:corner andSuperView:parent];
    }
    
}

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent {
    return [UIFabric buttonWithText:text andTextColor:color andFontName:fontName andFontModificator:nil andFontSize:fontSize andBackgroundColor:bcolor andImage:image andIsRoundCorner:corner andSuperView:parent];
}

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent {
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateNormal];
        if (!fontName) fontName = DEFAULT_FONT;
        if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
        
        if (modif) btn.titleLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else btn.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
    }
    btn.backgroundColor = bcolor;
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ON", image]] forState:UIControlStateHighlighted];
    }
    if (corner) {
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
    }
    return btn;
    
}

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andBackgroundImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent {
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateNormal];
        if (!fontName) fontName = DEFAULT_FONT;
        if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
        
        if (modif) btn.titleLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else btn.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
    }
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ON", image]] forState:UIControlStateHighlighted];
    }
    if (corner) {
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
    }
    return btn;
   
}

+(UIButton *) buttonWithImage:(NSString *)image andSuperView:(UIView *)parent andTarget:(id)target andSelector:(SEL)selector {
    
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UITextField *) textFieldWithPlaceholder:(NSString *)text  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andIsPassword:(bool)isPassword  andSuperView:(UIView *)parent {
    
    UITextField *inp = [UITextField new];
    [parent addSubview:inp];
    inp.placeholder = text;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    if (modif) inp.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else inp.font = [UIFont fontWithName:fontName size:fontSize];
    if (isPassword) inp.secureTextEntry = true;
    else inp.secureTextEntry = false;
    return inp;
 
}

+(UIButton *) wcRoundButtonWithText:(NSString *)text andBackgroundImage:(NSString *)bImage andOnBackgroundImage:(NSString *)bOnImage orImage:(NSString *)image andSuperView:(UIView *)parent{
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    float fontSize = 29;
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        NSString *fontName = DEFAULT_FONT;
        if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
        
        btn.titleLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, @"Medium"] size:fontSize];
        if (bImage) [btn setBackgroundImage:[UIImage imageNamed:bImage] forState:UIControlStateNormal];
        if (bOnImage) [btn setBackgroundImage:[UIImage imageNamed:bOnImage] forState:UIControlStateHighlighted];
    }
    btn.backgroundColor = [UIColor clearColor];
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        if (bOnImage) [btn setImage:[UIImage imageNamed:bOnImage] forState:UIControlStateHighlighted];
    }
    
    btn.clipsToBounds = YES;

    return btn;
    
}

+(UITextView *) textViewWithText:(NSString *)text andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andIsEditable:(bool)isEditable andSuperView:(UIView *)parent {

    UITextView *inp = [UITextView new];
    [parent addSubview:inp];
    inp.text = text;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    if (modif) inp.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else inp.font = [UIFont fontWithName:fontName size:fontSize];
    inp.editable = isEditable;
    return inp;
}



@end

@implementation UICustomElementWCInput
+(UICustomElementWCInput *) createElementWithName:(NSString *)name andIcon:(NSString *)iconName andPaceHolder:(NSString *)placeHolder andTextSize:(float)textSize andIsPassword:(bool)isPassword andParent:(UIView *)parent {
    UICustomElementWCInput *el = [UICustomElementWCInput new];
    
    el.v = [UIFabric viewWithBackgroundColor: [Functions colorWithRGBHex:0xFFFFFF] andIsRoundCorner:YES andIsBorder:YES andSuperView:parent];
    
     el.im = [UIFabric imageViewWithImageName:iconName andContentMode:UIViewContentModeScaleAspectFit iconMode:false  andSuperView:el.v];
    
    el.lab = [UIFabric labelWithText:name andTextColor:[Functions colorWithRGBHex:0x3c3c3c] andFontName:nil  andFontModificator:@"Light" andFontSize:textSize andSuperView:el.v];
    
    el.inp = [UIFabric textFieldWithPlaceholder:placeHolder andFontName:nil andFontModificator:@"Medium" andFontSize:textSize andIsPassword:isPassword andSuperView: el.v];
   
    return el;
}

-(void) updateConstraints {
    [self.im mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@18);
        make.height.equalTo(@18);
        make.centerY.equalTo(self.v);
        make.left.equalTo(self.v.mas_left).with.offset(15*[Functions koefX]);

    }];
    
    [self.lab mas_remakeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.v);
        make.left.equalTo(self.im.mas_right).with.offset(14*[Functions koefX]);
    }];
    
    [self.inp mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.v);
        make.left.equalTo(self.im.mas_right).with.offset(109*[Functions koefX]);
    }];
    
}

@end

@implementation UICustomSlider

+(UICustomSlider *) createElementWithHint:(NSString *)name andParent:(UIView *)parent {
    UICustomSlider *el = [UICustomSlider new];
    
    UIImageView *v = [UIImageView new];
    [parent addSubview:v];
    v.image = [UIImage imageNamed:@"swipe"];
    v.clipsToBounds = YES;
    el.v = v;
    v.contentMode = UIViewContentModeScaleAspectFit;
    
    el.im = [UIFabric imageViewWithImageName:@"swipe_slider" andContentMode:UIViewContentModeScaleAspectFit iconMode:false  andSuperView:el.v];
    
    el.lab = [UIFabric labelWithText:name andTextColor:[Functions colorWithRGBHex:0x333333] andFontName:nil  andFontModificator:@"Medium" andFontSize:18.0f andSuperView:el.v];
    
    return el;
    
}

-(void) updateConstraints {
    [self.im mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.v.mas_top).with.offset(1);
        make.bottom.equalTo(self.v.mas_bottom).with.offset(-1);
        make.width.equalTo(self.im.mas_height);
        make.left.equalTo(self.v.mas_left).with.offset(4.0*[Functions koefY]);
    }];
    
    [self.lab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.v);
        make.centerX.equalTo(self.v).with.offset(33*[Functions koefY]);
    }];
   
}


@end

