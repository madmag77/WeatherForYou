
#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import <UIKit/UIKit.h>
#import "BasePresenter.h"

/*
 Assembly to inject Base presenter in derived classes
 **/
@interface BasePresenterAssembly : TyphoonAssembly
- (BasePresenter *)basePresenter;

@end
