//
//  ProductTableViewHeaderFooterView.m
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ProductTableViewHeaderFooterView.h"

@implementation ProductTableViewHeaderFooterView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void) addGesture {
    //initialize my subviews
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(discButtonPressed:)];
    singleTapRecognizer.numberOfTouchesRequired = 1;
    singleTapRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleTapRecognizer];
}

- (IBAction)discButtonPressed:(id)sender {
    [self toggleButtonPressed:YES];
}

- (void) toggleButtonPressed:(BOOL) flag {
    
    self.discButton.selected = !self.discButton.selected;
    
    if (flag) {
        
        if (self.discButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionOpened:)]) {
                [self.delegate sectionOpened:self.section];
            }
        } else {
            if ([self.delegate respondsToSelector:@selector(sectionClosed:)]) {
                [self.delegate sectionClosed:self.section];
            }
        }
    }
}

@end
