//
//  SCNetworkHandler.h
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ConnectionTimeOut 60.f

NS_ASSUME_NONNULL_BEGIN

@class SCError;

@interface SCNetworkHandler : NSObject

+ (id)shared;

- (NSURLSessionTask * )performRequest:(NSURLRequest *)request success:(void (^)(NSData *data, NSURLResponse *response))successBlock failure:(void (^)(SCError *error))failureBlock;

@end

NS_ASSUME_NONNULL_END
