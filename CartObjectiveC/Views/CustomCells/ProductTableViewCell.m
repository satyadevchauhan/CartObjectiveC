//
//  ProductTableViewCell.m
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "ItemCollectionViewCell.h"
#import "SCConstants.h"
#import "UIImageView+WebCache.h"

static NSString * const ItemCollectionViewCellIdentifier = @"ItemCollectionViewCell";

@interface ProductTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *nodataLabel;
@end


@implementation ProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initialiseView];
}

-(void) initialiseView {
    
    // Set up view
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:ItemCollectionViewCellIdentifier];
    self.nodataLabel = [[UILabel alloc] initWithFrame:self.collectionView.bounds];
    self.nodataLabel.text = @"No products to display";
    self.nodataLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addObserver:self forKeyPath:@"products" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"products"]) {
        NSLog(@"Products changed.");
        [self.collectionView reloadData];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionViewDataSource

// Set the number of item rows
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.products.count == 0) {
        collectionView.backgroundView = self.nodataLabel;
    } else {
        collectionView.backgroundView = nil;
        [collectionView flashScrollIndicators];
    }
    
    return self.products.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    Product *product = self.products[indexPath.row];
    
    ItemCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:ItemCollectionViewCellIdentifier forIndexPath:indexPath];
    //collectionCell.backgroundColor = [UIColor redColor];
    collectionCell.product = product;
    [collectionCell.itemImageView sd_setImageWithURL:[NSURL URLWithString:product.imageUrl] placeholderImage:[UIImage imageNamed:@"shopping-cart"]];
    return collectionCell;
}

// Set the number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// Set width and height for Cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((collectionView.bounds.size.width/numberOfColumns)-5, (collectionView.bounds.size.height/numberOfRows)-5);
}

// Item Selected
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(didSelectProduct:)]) {
        Product *product = self.products[indexPath.row];
        [self.delegate didSelectProduct:product];
    }
}

@end
