//
//  ItemCollectionViewCell.m
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "Product.h"

@implementation ItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initialiseView];
}

-(void) initialiseView {
    // Set up view
}

- (void)prepareForReuse {
    self.itemImageView.image = nil;
    self.titleLabel.text = @"";
    self.priceLabel.text = @"";
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.text = self.product.name;
    self.priceLabel.text = [NSString stringWithFormat:@"₹ %ld", self.product.cost];
    
    if (self.product.imageUrl) {
        
    } else {
        self.itemImageView.image = [UIImage imageNamed:@"shopping-cart"];
    }
}

@end
