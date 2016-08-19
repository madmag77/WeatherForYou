

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PopupMessageType) {
    PopupMessageTypeError,
    PopupMessageTypeSuccess,
    PopupMessageTypeInfo
};

/*
 Interface for popup messages in application
 **/
@protocol popupMessageProtocol <NSObject>
-(void)popupMessageWithTitle:(NSString *)title andDescription:(NSString *)descr andType:(PopupMessageType)mesType;

@end
