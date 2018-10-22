//
//  SCConstants.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "SCConstants.h"

/// Function to check the correctness of status code
SCError * checkForOKResponse(NSURLResponse *response) {
    
    NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *)response;
    
    if(httpResponse.statusCode >= 500 && httpResponse.statusCode < 600 ){
        return [SCError errorWithCode:kSCErrorServerError description:[NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]];
    }
    
    if (httpResponse.statusCode != 200 || httpResponse.statusCode != 204){
        return [SCError errorWithCode:kSCErrorNetworkError description:[NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]];
    }
    
    return nil;
}
