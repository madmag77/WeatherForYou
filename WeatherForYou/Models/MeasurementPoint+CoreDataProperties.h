//
//  MeasurementPoint+CoreDataProperties.h
//  
//
//  Created by Artem Goncharov on 06/08/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MeasurementPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface MeasurementPoint (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSNumber *temperature;

@end

NS_ASSUME_NONNULL_END
