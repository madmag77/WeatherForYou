//
//  CurrentWeather+CoreDataProperties.m
//  
//
//  Created by Artem Goncharov on 06/08/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CurrentWeather+CoreDataProperties.h"

@implementation CurrentWeather (CoreDataProperties)

@dynamic name;
@dynamic date;
@dynamic icon;
@dynamic city;
@dynamic measures;
@dynamic currentMeasure;

@end
