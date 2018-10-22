//
//  ProductDetailViewController.m
//  CartObjectiveC
//
//  Created by Satyadev on 21/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "Product.h"
#import "BFCropInterface.h"
#import "UIImageView+WebCache.h"

@interface ProductDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic, strong) BFCropInterface *cropper;
@property (nonatomic, assign) Boolean isCropperActive;
@property (nonatomic, strong) UIBarButtonItem *cropButton;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameLabel.text = self.product.name;
    self.priceLabel.text = [NSString stringWithFormat:@"₹ %ld", self.product.cost];
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:self.product.imageUrl] placeholderImage:[UIImage imageNamed:@"shopping-cart"]];
    self.productImageView.userInteractionEnabled = YES;
    
    self.cropButton = [[UIBarButtonItem alloc] initWithTitle:@"Crop" style:UIBarButtonItemStyleDone target:self action:@selector(cropPressed:)];
    self.navigationItem.rightBarButtonItem = self.cropButton;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showCropper {
    
    // allocate crop interface with frame and image being cropped
    self.cropper = [[BFCropInterface alloc] initWithFrame:self.productImageView.bounds andImage:self.productImageView.image nodeRadius:10];
    
    // this is the default color even if you don't set it
    self.cropper.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.60];
    // white is the default border color.
    self.cropper.borderColor = [UIColor whiteColor];
    self.cropper.borderWidth = 1.5;
    self.cropper.showNodes = YES;
    [self.cropper setCropViewPosition:50.0 y:100.0 width:150.0 height:200.0];
    
    // add interface to superview. here we are covering the main image view.
    [self.productImageView addSubview:self.cropper];
}

- (IBAction)cropPressed:(id)sender {
    
    self.isCropperActive = !self.isCropperActive;
    
    if (self.isCropperActive) {
        self.cropButton.title = @"Done";
        [self showCropper];
    } else {
        
        // crop image
        UIImage *croppedImage = [self.cropper getCroppedImage];
        
        // remove crop interface from superview
        [self.cropper removeFromSuperview];
        self.cropper = nil;
        
        // display new cropped image
        self.productImageView.image = croppedImage;
        
        self.cropButton.title = @"Crop";
    }
}

@end
