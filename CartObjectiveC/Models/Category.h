//
//  Category.h
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Product, ProductTableViewHeaderFooterView;

@interface Category : NSObject

@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *nested_facets;

//UI
@property (nonatomic, strong) NSArray<Product *> *products;
@property (nonatomic, assign) NSInteger selectedFilter;
@property (getter = isExpanded, assign) BOOL expand;
@property (nonatomic, strong) ProductTableViewHeaderFooterView *sectionView;

-(instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
