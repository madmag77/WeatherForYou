//
//  ImageStorageService.m
//  WeatherForYou
//
//  Created by Artem Goncharov on 06/08/16.
//  Copyright © 2016 DemoCompany. All rights reserved.
//

#import "ImageStorageService.h"

@implementation ImageStorageService
-(void)checkAndLoadImageWithName:(NSString *)name {
    if ([self chechImageWithName:name]) return;
   
    [self downloadAndSaveImageWithName:name];
}

-(void)downloadAndSaveImageWithName:(NSString *)name {
    if (!name) return;
    [self doGETImageOnABSURL:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", name] withParams:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable response) {
        //WFYLogVerbose(@"getWeatherDataForLatitude forecast %@",response);
        NSData *data = response;
        [self saveLocallyFile:data withName:name];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WFYLogError(@"doGETImageOnABSURL error %@", error.localizedDescription);
        
    }];
    
}

-(bool)chechImageWithName:(NSString *)name {
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *myPath    = [myPathList  objectAtIndex:0];
    myPath = [myPath stringByAppendingPathComponent:@"images"];
    myPath = [myPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
    return [[NSFileManager defaultManager] fileExistsAtPath:myPath];
}

-(UIImage *)getLocalImageWithName:(NSString *)name {
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *myPath    = [myPathList  objectAtIndex:0];
    myPath = [myPath stringByAppendingPathComponent:@"images"];
    myPath = [myPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
    if([[NSFileManager defaultManager] fileExistsAtPath:myPath]) {
        NSData *image = [NSData dataWithContentsOfFile:myPath];
        return [UIImage imageWithData:image];

    }
    [self downloadAndSaveImageWithName:name];
    return nil;
   
}

-(NSString *)saveLocallyFile:(NSData *)fileData withName:(NSString *)name {
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *myPath    = [myPathList  objectAtIndex:0];
    myPath = [myPath stringByAppendingPathComponent:@"images"];
    NSString *myImageDir = myPath;
    myPath = [myPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:myPath])
    {
        BOOL isDir = NO;
        NSError *error;
        if (! [[NSFileManager defaultManager] fileExistsAtPath:myImageDir isDirectory:&isDir]) {
            [[NSFileManager defaultManager]createDirectoryAtPath:myImageDir withIntermediateDirectories:YES attributes:nil error:&error];
            if (error) {
                WFYLogError(@"Can't saveLocallyFile with error %@", [error localizedDescription]); return nil;
            }
            
        }
        if (![fileData writeToFile:myPath atomically:YES]) {
            WFYLogError(@"Can't write image file with name %@", myPath);
            return nil;
        }
    }
    return myPath;
}

@end
