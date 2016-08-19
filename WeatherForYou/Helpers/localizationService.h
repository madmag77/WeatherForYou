

#import <Foundation/Foundation.h>

#define WFYLocalize(key) [localizationService getStringForName:(key)]

/*
 Localization service
 **/
@interface localizationService : NSObject
+(NSString *)getStringForName:(NSString *)name;
@end
