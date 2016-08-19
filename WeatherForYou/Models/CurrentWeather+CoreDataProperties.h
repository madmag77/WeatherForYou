//
//  CurrentWeather+CoreDataProperties.h
//  
//
//  Created by Artem Goncharov on 06/08/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CurrentWeather.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurrentWeather (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *icon;
@property (nullable, nonatomic, retain) City *city;
@property (nullable, nonatomic, retain) NSSet<MeasurementPoint *> *measures;
@property (nullable, nonatomic, retain) MeasurementPoint *currentMeasure;

@end

@interface CurrentWeather (CoreDataGeneratedAccessors)

- (void)addMeasuresObject:(MeasurementPoint *)value;
- (void)removeMeasuresObject:(MeasurementPoint *)value;
- (void)addMeasures:(NSSet<MeasurementPoint *> *)values;
- (void)removeMeasures:(NSSet<MeasurementPoint *> *)values;

@end

NS_ASSUME_NONNULL_END
