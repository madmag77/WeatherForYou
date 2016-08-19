
#import "BasePresenterAssembly.h"
#import "appSettings.h"

@implementation BasePresenterAssembly
- (BasePresenter *)basePresenter {
    return [TyphoonDefinition withClass:[BasePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(popup)
                                                    with:[appSettings getPopupObj]];
                              [definition injectProperty:@selector(wait)
                                                    with:[appSettings getWaitObj]];
                          }];
}

@end
