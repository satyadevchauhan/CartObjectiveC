//
//  CategoryService.h
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface CategoryService : NSObject

-(void)loadCategory:(NSURL *)url success:(SuccessBlock)successBlock failure:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
