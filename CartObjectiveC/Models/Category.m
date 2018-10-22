//
//  Category.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "Category.h"
#import "Product.h"

@implementation Category

-(instancetype) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    if (self && dictionary) {
        //[self setValuesForKeysWithDictionary:dictionary];
        
        //self.description = [dictionary objectForKey:@"description"];
        self.name = [dictionary objectForKey:@"name"];
        self.priority = [[dictionary objectForKey:@"priority"] integerValue];
        //self.nested_facets = [dictionary objectForKey:@"nested_facets"];
        
    }
    
    return self;
}

@end
