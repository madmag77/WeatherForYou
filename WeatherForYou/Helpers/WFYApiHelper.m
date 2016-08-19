
#import "WFYApiHelper.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

const NSString *appid = @"1b1c17d611ba200f94554ecf54858f0b";

#define DOMEN @"http://api.openweathermap.org/data/2.5/"

@implementation WFYApiHelper
-(NSString *)domen {
    return DOMEN;
}

-(void)doPOSTOnURL:(NSString * _Nonnull)url
        withParams:(NSDictionary * _Nullable)params
           success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
           failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    manager.securityPolicy = policy;

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"application/json"]];

    
    [manager POST:[NSString stringWithFormat:@"%@%@", self.domen, url]
       parameters:params progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              if (success) success(task, responseObject);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              if (failure) failure(task, error);
          }
     ];
}


-(void)doGETOnURL:(NSString * _Nonnull)url
       withParams:(NSDictionary * _Nullable)params
          success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
          failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    manager.securityPolicy = policy;
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"application/json"]];
    NSMutableDictionary *fullParams = [params mutableCopy];
    [fullParams setObject:appid forKey:@"appid"];
    NSString *fullUrl =[NSString stringWithFormat:@"%@%@", self.domen, url];
    
    [manager GET:fullUrl
      parameters:fullParams
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             if (success) success(task, responseObject);
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (failure) failure(task, error);
         }
     ];
}

-(void)doGETImageOnABSURL:(NSString * _Nonnull)url
                 withParams:(NSDictionary * _Nullable)params
                    success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                    failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    manager.securityPolicy = policy;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"image/*"]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:params  success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) success(task, responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(task, error);
    }];
    
}

@end

@implementation responseModel


@end
