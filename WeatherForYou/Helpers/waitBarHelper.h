
#import <Foundation/Foundation.h>
#import "waitBarProtocol.h"

/*
 UI element designated to indicate long proccesses like network fetching
 **/
@interface waitBarHelper : NSObject <waitBarProtocol>
+(waitBarHelper *) getSharedInstance;

@end
