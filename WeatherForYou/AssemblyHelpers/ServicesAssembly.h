
#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import "GeoLocationService.h"
#import "WheatherDBService.h"
#import "WeatherDeamon.h"
#import "WeatherDataService.h"
#import "ImageStorageService.h"
/*
 Service locator
 One shhould use protocols instead of concreate services here, but for simplicity of this example I didn't do it.
 **/
@interface ServicesAssembly : TyphoonAssembly
- (GeoLocationService *)geoService;
- (WheatherDBService *)dbService;
- (WeatherDeamon *)deamon;
- (WeatherDataService *)weatherDataService;
- (ImageStorageService *)imagesStorageService;
@end
