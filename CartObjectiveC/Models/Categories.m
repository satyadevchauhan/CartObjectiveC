//
//  Categories.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "Categories.h"

@implementation Categories

-(instancetype) initWithDictionary:(NSDictionary *) dictionary {
    
    self = [super init];
    
    if (self != nil && ![self isKindOfClass:[NSNull class]]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

@end
