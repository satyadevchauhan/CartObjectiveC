//
//  Product.h
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject

@property  (nonatomic, assign) NSInteger sku;
@property  (nonatomic, strong) NSString *name;
@property  (nonatomic, assign) NSInteger cost;
@property  (nonatomic, strong) NSString *imageUrl;

-(instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
