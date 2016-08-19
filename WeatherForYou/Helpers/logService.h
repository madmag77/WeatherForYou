

#import <Foundation/Foundation.h>
#import "CocoaLumberjack.h"


static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

#define WFYLogError(frmt, ...)   LOG_MAYBE(NO,                LOG_LEVEL_DEF, DDLogFlagError,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define WFYLogWarn(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define WFYLogInfo(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define WFYLogDebug(frmt, ...)   LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define WFYLogVerbose(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)


/*
 Logging service (using Lamberjack at the moment)
 **/
@interface logService : NSObject
+(void)initLogger;
@end

@interface ShortFormatter : NSObject <DDLogFormatter> {
    NSDateFormatter *threadUnsafeDateFormatter;
}
@end

@interface DetailsFormatter : NSObject <DDLogFormatter> {
    NSDateFormatter *threadUnsafeDateFormatter;
}
@end