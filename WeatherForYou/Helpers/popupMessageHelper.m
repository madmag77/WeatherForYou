
#import "popupMessageHelper.h"
#import "TWMessageBarManager.h"

@implementation popupMessageHelper

+(popupMessageHelper *) getSharedInstance {
    static popupMessageHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    if (!sharedInstance) {
        dispatch_once(&onceToken, ^{
            sharedInstance = [[popupMessageHelper alloc] init];
        });
    }
    return sharedInstance;
}

-(void)popupMessageWithTitle:(NSString *)title andDescription:(NSString *)descr andType:(PopupMessageType)mesType {
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:title description:descr type:(TWMessageBarMessageType)mesType];
}

@end
