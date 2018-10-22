//
//  ProductCollectionViewHeaderFooterView.h
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProductCollectionViewHeaderFooterViewDelegate <NSObject>

-(void) filterChanged:(NSInteger) filterIndex atSection: (NSInteger) section;

@end

@interface ProductCollectionViewHeaderFooterView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UISegmentedControl *filterSegment;

@property (nonatomic, assign) id<ProductCollectionViewHeaderFooterViewDelegate> delegate;
@property (nonatomic, assign) NSInteger section;

@end

NS_ASSUME_NONNULL_END
