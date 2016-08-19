

#import <Foundation/Foundation.h>

/*
 Common interface for UI wait element usage
 **/
@protocol waitBarProtocol <NSObject>
-(void)showWaitBarModal:(bool)modal;
-(void)dissmissWaitBar;
@end

