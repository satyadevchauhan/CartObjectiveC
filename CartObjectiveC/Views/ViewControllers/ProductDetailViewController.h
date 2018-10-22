//
//  ProductDetailViewController.h
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Product;

@interface ProductDetailViewController : UIViewController

@property (nonatomic, strong) Product *product;

@end

NS_ASSUME_NONNULL_END
