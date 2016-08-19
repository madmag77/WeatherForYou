

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import "BasePresenterAssembly.h"
#import "ServicesAssembly.h"

/*
 Base Assembly where it is easy to accumulate common features like service locator (ServiceAssembly), BasePresenter and may be other Base Assembly classes if it will be needed in future
 **/
@interface BaseModuleAssembly : TyphoonAssembly
@property (strong, nonatomic, readonly) BasePresenterAssembly *presenterAssembly;
@property (strong, nonatomic, readonly) ServicesAssembly *servicesAssembly;

@end
