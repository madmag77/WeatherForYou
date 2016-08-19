//
//  ARCommon.m
//  crypton
//
//  Created by Artem Goncharov on 27/07/16.
//  Copyright © 2016 crypton. All rights reserved.
//

#import "ARCommon.h"
#include <mach/mach_time.h>

bool ARCompareObjects(id obj1, id obj2)
{
    if (obj1 == nil && obj2 == nil)
        return true;
    
    return [obj1 isEqual:obj2];
}

bool ARCompareStrings(NSString *s1, NSString *s2)
{
    if (s1.length == 0 && s2.length == 0)
        return true;
    
    if ((s1 == nil) != (s2 == nil))
        return false;
    
    return s1 == nil || [s1 isEqualToString:s2];
}

NSTimeInterval TGCurrentSystemTime()
{
    static mach_timebase_info_data_t timebase;
    if (timebase.denom == 0)
        mach_timebase_info(&timebase);
    
    return ((double)mach_absolute_time()) * ((double)timebase.numer) / ((double)timebase.denom) / 1e9;
}

 void ARDispatchOnMainThread(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(), block);
}

 void ARDispatchAfter(double delay, dispatch_queue_t queue, dispatch_block_t block)
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay) * NSEC_PER_SEC)), queue, block);
}

 void ARDispatchOnMainThreadAfter(double delay, dispatch_block_t block)
{
    ARDispatchAfter(delay, dispatch_get_main_queue(), block);
}
