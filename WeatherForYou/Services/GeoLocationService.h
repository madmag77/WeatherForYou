//
//  GeoLocationService.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<CoreLocation/CoreLocation.h>

@protocol GeoLocationServiceProtocol <NSObject>
-(void)errorCatched:(WFYError)error;
-(void)gotCurrentLocationPoint:(CLLocation *)location andPlacemark:(CLPlacemark *)placemark;

@end

@interface GeoLocationService : NSObject <CLLocationManagerDelegate>
@property id<GeoLocationServiceProtocol> delegate;
@property CLGeocoder *geocoder;
@property CLLocationManager *locationManager;
-(void)getCurrentLocation;
@end
