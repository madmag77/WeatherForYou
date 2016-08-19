//
//  ImageStorageService.h
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFYApiHelper.h"

@interface ImageStorageService : WFYApiHelper
-(void)checkAndLoadImageWithName:(NSString *)name;
-(UIImage *)getLocalImageWithName:(NSString *)name;
@end
