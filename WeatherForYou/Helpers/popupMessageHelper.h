

#import <Foundation/Foundation.h>
#import "popupMessageProtocol.h"

/*
 Popup non-modal messages in the top of screen 
 **/
@interface popupMessageHelper : NSObject <popupMessageProtocol>
+(popupMessageHelper *) getSharedInstance;
@end
