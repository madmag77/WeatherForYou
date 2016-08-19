

#import "ServicesAssembly.h"
#import "appSettings.h"

@implementation ServicesAssembly

- (GeoLocationService *)geoService {
    return [TyphoonDefinition withClass:[GeoLocationService class]
                          configuration:^(TyphoonDefinition *definition) {
                          }];
}

- (WheatherDBService *)dbService {
    return [TyphoonDefinition withClass:[WheatherDBService class]
                          configuration:^(TyphoonDefinition *definition) {
                               definition.scope = TyphoonScopeSingleton;
                              [definition injectProperty:@selector(storeName)
                                                    with:@"WheaterStorage.sqlite"];
                          }];
    
}

- (WeatherDeamon *)deamon {
    return [TyphoonDefinition withClass:[WeatherDeamon class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeSingleton;
                              [definition injectProperty:@selector(dbService)
                                                    with:[self dbService]];
                              [definition injectProperty:@selector(geoService)
                                                    with:[self geoService]];
                              [definition injectProperty:@selector(weatherDataService)
                                                    with:[self weatherDataService]];
                              [definition injectProperty:@selector(imagesService)
                                                    with:[self imagesStorageService]];
                          }];
}

- (WeatherDataService *)weatherDataService {
    return [TyphoonDefinition withClass:[WeatherDataService class]
                          configuration:^(TyphoonDefinition *definition) {
                          }];
}

- (ImageStorageService *)imagesStorageService {
    return [TyphoonDefinition withClass:[ImageStorageService class]
                          configuration:^(TyphoonDefinition *definition) {
                          }];
    
}
@end
