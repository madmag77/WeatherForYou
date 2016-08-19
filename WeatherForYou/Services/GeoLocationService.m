//
//  GeoLocationService.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "GeoLocationService.h"

@implementation GeoLocationService

-(void)getCurrentLocation {
    if (!self.geocoder) self.geocoder = [[CLGeocoder alloc] init];
    if (!self.locationManager)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
        self.locationManager.delegate = self;
    }
    
    
    if (![CLLocationManager locationServicesEnabled]) {
        [self serviceError:WFYLocationNotAvailable];
    } else {
        if (CLLocationManager.authorizationStatus ==  kCLAuthorizationStatusRestricted || CLLocationManager.authorizationStatus ==  kCLAuthorizationStatusDenied) {
            [self serviceError:WFYLocationAuthRestricted];
        } else if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
            [self.locationManager  requestWhenInUseAuthorization];
        } else {
            [self.locationManager startUpdatingLocation];
        }
    }
}

-(void) serviceError:(WFYError)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(errorCatched:)]) {
        [self.delegate errorCatched:error];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations firstObject];
    [self.geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count] >0) {
            CLPlacemark* placemark = [placemarks firstObject];
            if (self.delegate) {
                [self.delegate gotCurrentLocationPoint:newLocation andPlacemark:placemark];
            }
            
        } else {
            WFYLogError(@"geocoder reverseGeocodeLocation %@", error.debugDescription);
            [self serviceError:WFYLocationErrorInProccess];
        }
    }];
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    WFYLogError(@"geocoder reverseGeocodeLocation %@", error.debugDescription);
    [self serviceError:WFYLocationErrorInProccess];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (CLLocationManager.authorizationStatus ==  kCLAuthorizationStatusRestricted || CLLocationManager.authorizationStatus ==  kCLAuthorizationStatusDenied) {
        [self serviceError:WFYLocationAuthRestricted];
    } else if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
       //do nothing
    } else {
        [self.locationManager startUpdatingLocation];
    }
   
}

@end
