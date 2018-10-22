//
//  SCNetworkHandler.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "SCNetworkHandler.h"
#import "SCError.h"

static SCNetworkHandler *shared = nil;

@interface SCNetworkHandler()
@property (nonatomic) NSURLSession *session;
@end

@implementation SCNetworkHandler

+ (id)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [SCNetworkHandler new];
    });
    
    return shared;
}

-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.URLCache = nil;
        config.timeoutIntervalForRequest = 10.0;
        config.URLCredentialStorage = nil;
        config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.session = [NSURLSession sessionWithConfiguration:config];
        config = nil;
        
    }
    return self;
}

- (NSURLSessionTask * )performRequest:(NSURLRequest *)request success:(void (^)(NSData *data, NSURLResponse *response))successBlock failure:(void (^)(SCError *error))failureBlock {
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            NSLog(@"Error code: %ld Description: %@", error.code, error.localizedDescription);
            
            SCError *scError = nil;
            NSString *errorMsg = error.localizedDescription;
            
            switch (error.code) {
                case NSURLErrorTimedOut:
                    scError = [SCError errorWithCode:kSCErrorTimeout description:errorMsg];
                    break;
                    
                case NSURLErrorCancelled:
                    scError = [SCError errorWithCode:kSCErrorRequestCancelled description:errorMsg];
                    break;
                    
                default:
                    scError = [SCError errorWithCode:kSCErrorNetworkError description:errorMsg];
                    break;
            }
            
            failureBlock(scError);
            
        } else {
            successBlock(data, response);
        }
    }];
    
    [dataTask resume];
    
    return dataTask;
}

@end
