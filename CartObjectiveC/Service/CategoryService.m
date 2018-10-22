//
//  CategoryService.m
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "CategoryService.h"
#import "SCNetworkHandler.h"
#import "Category.h"

@implementation CategoryService

-(void)loadCategory:(NSURL *)url success:(SuccessBlock)successBlock failure:(ErrorBlock)errorBlock {
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:ConnectionTimeOut];
    
    if(urlRequest){
        
        [[SCNetworkHandler shared] performRequest:urlRequest success:^(NSData *data, NSURLResponse *response) {
            
            SCError *error = checkForOKResponse(response);
            
            if (error) {
                errorBlock(error);
            } else {
                successBlock([self parseResponse:data]);
            }
            
        } failure:^(SCError *error) {
            errorBlock(error);
        }];
        
    } else {
        errorBlock([SCError errorWithCode:kSCErrorInternalError description:@"Failed to create this request."]);
    }
}

-(NSArray<Category *> *) parseResponse:(NSData *) data {
    
    NSString *respString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Response: \n%@", respString);
    
    @try {
        NSError *jsonError = nil;
        
        //Received response.
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:&jsonError];
        
        if (!jsonError && jsonResponse != nil && jsonResponse.count > 0) {
            
            NSDictionary *meta = [jsonResponse objectForKey:@"meta"];
            Boolean success = [[meta objectForKey:@"success"] boolValue];
            if (success) {
                
                NSDictionary *object = [jsonResponse objectForKey:@"objects"];
                
                NSArray *all = [object objectForKey:@"all"];
                
                NSMutableArray *categories = [NSMutableArray new];
                
                for (NSDictionary *dict in all) {
                    Category *category = [[Category alloc] initWithDictionary:dict];
                    [categories addObject:category];
                }
                
                return categories;
                
            } else {
                return nil;
            }
            
        } else {
            return nil;
        }
        
    } @catch(NSException *exception) {
        NSLog(@"%@", [exception reason]);
        return nil;
    }
}

@end
