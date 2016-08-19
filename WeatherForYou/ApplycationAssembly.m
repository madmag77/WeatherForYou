

#import "ApplycationAssembly.h"
#import "AppDelegate.h"

@interface ApplycationAssembly ()

@end

@implementation ApplycationAssembly
- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(firstViewController)
                                                    with:[self firstViewController]];
                              [definition injectProperty:@selector(daemon)
                                                    with:[self.servicesAssembly deamon]];
                        }];
}

- (UIViewController *) firstViewController {
    return [TyphoonFactoryDefinition withFactory:[self mainStoryboard]
                                        selector:@selector(instantiateViewControllerWithIdentifier:)
                                      parameters:^(TyphoonMethod *factoryMethod) {
                                          [factoryMethod injectParameterWith:@"WFYCityWeatherViewController"];
                                      } configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
}

- (UIStoryboard*)mainStoryboard {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(storyboardWithName:factory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@"Main"];
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:nil];
                                              }];
                          }];
}

@end
