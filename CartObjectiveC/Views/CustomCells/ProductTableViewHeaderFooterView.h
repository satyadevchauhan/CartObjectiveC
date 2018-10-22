//
//  ProductTableViewHeaderFooterView.h
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProductTableViewHeaderFooterViewDelegate <NSObject>

@optional
-(void) sectionClosed:(NSInteger) section;
-(void) sectionOpened:(NSInteger) section;

@end

@interface ProductTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *discButton;

@property (nonatomic, assign) id<ProductTableViewHeaderFooterViewDelegate> delegate;
@property (nonatomic, assign) NSInteger section;

- (void) toggleButtonPressed:(BOOL) flag;

@end

NS_ASSUME_NONNULL_END
