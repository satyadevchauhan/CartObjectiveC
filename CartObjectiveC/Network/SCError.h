//
//  SCError.h
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    kSCErrorInvalidRequest = 1001,
    kSCErrorNetworkError,
    kSCErrorServerError,
    kSCErrorTimeout,
    kSCErrorInvalidResponse,
    kSCErrorRequestCancelled,
    kSCErrorInternalError
} SCErrorCode;

@interface SCError : NSError

+ (SCError *)errorWithCode:(SCErrorCode)code description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
