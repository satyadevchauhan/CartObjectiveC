//
//  ProductCollectionViewHeaderFooterView.m
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ProductCollectionViewHeaderFooterView.h"

@implementation ProductCollectionViewHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)filterValueChanged:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(filterChanged:atSection:)]) {
        [self.delegate filterChanged:self.filterSegment.selectedSegmentIndex atSection:self.section];
    }
}

@end
