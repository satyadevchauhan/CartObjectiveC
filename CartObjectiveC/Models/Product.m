//
//  Product.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype) initWithDictionary:(NSDictionary *) dictionary {
    
    self = [super init];
    
    if (self && dictionary) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

@end
