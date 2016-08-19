
#import "waitBarHelper.h"
#import "SVProgressHUD.h"

@implementation waitBarHelper
+(waitBarHelper *) getSharedInstance {
    static waitBarHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    if (!sharedInstance) {
        dispatch_once(&onceToken, ^{
            sharedInstance = [[waitBarHelper alloc] init];
        });
    }
    return sharedInstance;
}

-(void)showWaitBarModal:(bool)modal {
    [SVProgressHUD show];
}

-(void)dissmissWaitBar {
  [SVProgressHUD dismiss];
}


@end
