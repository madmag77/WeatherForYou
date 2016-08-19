

#import "AppErrors.h"
#import "localizationService.h"

@implementation AppErrors
+ (NSString *) getErrorDescription:(WFYError)error {
    switch (error) {
         case WFYAuthFail:
            return WFYLocalize(@"WFYAuthFail");
            break;
        case WFYNetworkError:
            return WFYLocalize(@"WFYNetworkError");
            break;
        case WFYConnectionError:
            return WFYLocalize(@"WFYConnectionError");
            break;
        case WFYServiceErrors:
            return WFYLocalize(@"WFYServiceErrors");
            break;
        case WFYJSONParseError:
            return WFYLocalize(@"WFYJSONParseError");
            break;
        default:
            return WFYLocalize(@"otherError");
            break;
    }
    return WFYLocalize(@"otherError");
}
@end
