//
//  ProductService.h
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCConstants.h"

NS_ASSUME_NONNULL_BEGIN

@class Product, Category;

@interface ProductService : NSObject

-(void)loadProductForCategory:(Category *)category success:(SuccessBlock)successBlock failure:(ErrorBlock)errorBlock;
-(void)loadProduct:(NSURL *)url success:(SuccessBlock)successBlock failure:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
