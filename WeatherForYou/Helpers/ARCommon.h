//
//  ARCommon.h
//  crypton
//
//  Created by Artem Goncharov on 27/07/16.
//  Copyright © 2016 crypton. All rights reserved.
//


#import <Foundation/Foundation.h>

#define ARRestrictedToMainThread {if(![[NSThread currentThread] isMainThread]) CRNLogError(@"***** Warning: main thread-bound operation is running in background! *****");}

#ifdef __cplusplus
extern "C" {
#endif

bool ARCompareObjects(id obj1, id obj2);
bool ARCompareStrings(NSString *s1, NSString *s2);

    NSTimeInterval ARCurrentSystemTime();

    void ARDispatchOnMainThread(dispatch_block_t block);

    void ARDispatchAfter(double delay, dispatch_queue_t queue, dispatch_block_t block);

    void ARDispatchOnMainThreadAfter(double delay, dispatch_block_t block);

#ifdef __cplusplus
}
#endif
