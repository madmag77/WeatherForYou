

#import <Foundation/Foundation.h>
#import "popupMessageProtocol.h"
#import "waitBarProtocol.h"

/*
 Base presenter where it is convinient to add common presenting functions like popup interface and waiting bars
 **/
@interface BasePresenter : NSObject
@property (nonatomic, weak) id<popupMessageProtocol> popup;
@property (nonatomic, weak) id<waitBarProtocol> wait;
@end
