//
//  ItemCollectionViewCell.h
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Product;

@interface ItemCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) Product *product;

@end

NS_ASSUME_NONNULL_END
