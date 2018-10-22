//
//  ProductService.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ProductService.h"
#import "SCNetworkHandler.h"
#import "Category.h"
#import "Product.h"

@implementation ProductService

-(void)loadProductForCategory:(Category *)category success:(SuccessBlock)successBlock failure:(ErrorBlock)errorBlock {
    
    NSString *categoryName = category.name.lowercaseString;
    NSURL *productURL = [NSURL  URLWithString:[NSString stringWithFormat:SERVER_URL_PARAM, categoryName]];
    
    [self loadProduct:productURL success:successBlock failure:errorBlock];
}

-(void)loadProduct:(NSURL *)url success:(SuccessBlock)successBlock failure:(ErrorBlock)errorBlock {
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:ConnectionTimeOut];
    
    if (urlRequest) {
        
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

-(NSArray<Product *> *) parseResponse:(NSData *) data {
    
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
                
                NSArray *objects = [jsonResponse objectForKey:@"objects"];
                
                NSMutableArray *products = [NSMutableArray new];
                
                for (NSDictionary *dict in objects) {
                    Product *product = [[Product alloc] initWithDictionary:dict];
                    [products addObject:product];
                }
                
                return products;
                
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
