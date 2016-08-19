

#import "localizationService.h"

@implementation localizationService
+(NSString *)getStringForName:(NSString *)name {
    return NSLocalizedString(name, @"local");
}
@end
