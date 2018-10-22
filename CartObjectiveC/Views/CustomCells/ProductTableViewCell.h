//
//  ProductTableViewCell.h
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ProductTableViewCellDelegate <NSObject>

@optional
-(void)didSelectProduct:(Product *) product;

@end

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray<Product *> *products;
@property (nonatomic, assign) id<ProductTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
