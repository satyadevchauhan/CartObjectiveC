//
//  SCError.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "SCError.h"

NSString * const kSCErrorDomain = @"CartObjectiveC";

@implementation SCError

+ (SCError *)errorWithCode:(SCErrorCode)code description:(NSString *)description {
    
    NSString *errorType = nil;
    
    switch (code) {
        case kSCErrorInvalidRequest:
            errorType = @"InvalidRequestError";
            break;
        case kSCErrorNetworkError:
            errorType = @"NetworkError";
            break;
        case kSCErrorServerError:
            errorType = @"ServerError";
            break;
        case kSCErrorTimeout:
            errorType = @"TimeoutError";
            break;
        case kSCErrorInvalidResponse:
            errorType = @"InvalidResponseError";
            break;
        case kSCErrorRequestCancelled:
            errorType = @"RequestCancelledError";
            break;
        case kSCErrorInternalError:
            errorType = @"InternalError";
            break;
            
        default:
            break;
    }
    
    NSString *errorMessage = [NSString stringWithFormat:@"%@ : %@", errorType, description];
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(errorMessage, nil)};
    
    return [self errorWithDomain:kSCErrorDomain code:code userInfo:userInfo];
}

@end
