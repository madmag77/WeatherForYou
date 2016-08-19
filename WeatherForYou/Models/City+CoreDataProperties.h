//
//  City+CoreDataProperties.h
//  
//
//  Created by Artem Goncharov on 06/08/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *locationLon;
@property (nullable, nonatomic, retain) NSNumber *locationLat;
@property (nullable, nonatomic, retain) NSNumber *currentLocation;
@property (nullable, nonatomic, retain) CurrentWeather *current;

@end

NS_ASSUME_NONNULL_END
