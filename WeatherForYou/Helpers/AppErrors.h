
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WFYError) {
    WFYNoError = 0,
    
    WFYCommunicationErrors = 100, //Communication errors
    WFYConnectionError = 102,
    WFYNetworkError = 103,
    
    WFYServiceErrors = 200, //Service errors
    WFYJSONParseError = 201,
    WFYAuthFail = 210,
    
    WFYLocationErrors = 300,
    WFYLocationAuthRestricted = 301,
    WFYLocationErrorInProccess = 303,
    WFYLocationAuthNotDetermined = 305,
    WFYLocationNotAvailable = 310
    
};

/*
 Working with application errors
 **/
@interface AppErrors : NSObject
+ (NSString *) getErrorDescription:(WFYError)error;
@end
