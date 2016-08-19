
#import <Foundation/Foundation.h>
#import "JSONModel.h"

/*
 Common functions for working with HTTP requests (using AFNetwork under the hood at the moment)
 **/
@interface WFYApiHelper : NSObject

typedef void ( ^ apiSuccessCompletionBlock) ( NSURLSessionDataTask * _Nonnull, id _Nullable);
typedef void ( ^ apiFailureCompletionBlock) (NSURLSessionDataTask * _Nullable, NSError * _Nonnull);

-(void)doGETImageOnABSURL:(NSString * _Nonnull)url
                 withParams:(NSDictionary * _Nullable)params
                    success:(nullable apiSuccessCompletionBlock)success
                    failure:(nullable apiFailureCompletionBlock)failure;

/**
 Simple GET request
 */
-(void)doGETOnURL:(NSString * _Nonnull)url
       withParams:(NSDictionary * _Nullable)params
          success:(nullable apiSuccessCompletionBlock)success
          failure:(nullable apiFailureCompletionBlock)failure;

/**
 Simple POST request in x-www-form
 */
-(void)doPOSTOnURL:(NSString * _Nonnull)url
        withParams:(NSDictionary * _Nullable)params
           success:(nullable apiSuccessCompletionBlock)success
           failure:(nullable apiFailureCompletionBlock)failure;


/**
 Basic part of URL
 */
@property (readonly) NSString * _Nonnull domen;

@end

@interface responseModel : JSONModel
    @property NSString * _Nonnull code;
    @property id<Optional> _Nullable data;
    @property NSArray<Optional> * _Nullable errors;
@end
