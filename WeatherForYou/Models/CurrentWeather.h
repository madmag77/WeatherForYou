//
//  CurrentWeather.h
//  
//
//  Created by Artem Goncharov on 06/08/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class City, MeasurementPoint;

NS_ASSUME_NONNULL_BEGIN

@interface CurrentWeather : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "CurrentWeather+CoreDataProperties.h"
