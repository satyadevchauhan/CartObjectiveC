//
//  ViewController.m
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#import "ProductListViewController.h"
#import "SCNetworkHandler.h"

#import "Category.h"
#import "Product.h"

#import "CategoryService.h"
#import "ProductService.h"

#import "ProductTableViewCell.h"
#import "ItemTableViewCell.h"
#import "ProductTableViewHeaderFooterView.h"
#import "ProductCollectionViewHeaderFooterView.h"

#import "ProductDetailViewController.h"

static NSString * const ProductTableViewCellIdentifier = @"ProductTableViewCell";
static NSString * const ItemTableViewCellIdentifier = @"ItemTableViewCell";
static NSString * const ProductCollectionViewHeaderFooterViewIdentifier = @"ProductCollectionViewHeaderFooterView";
static NSString * const ProductTableViewHeaderFooterViewIdentifier = @"ProductTableViewHeaderFooterView";

@interface ProductListViewController ()<UITableViewDelegate, UITableViewDataSource, ProductTableViewCellDelegate, ProductCollectionViewHeaderFooterViewDelegate, ProductTableViewHeaderFooterViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, strong) NSArray<Category *> *categories;
@property (nonatomic, assign) Boolean isCollectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Products";
    
    UIBarButtonItem *switchButton = [[UIBarButtonItem alloc] initWithTitle:@"Switch" style:UIBarButtonItemStyleDone target:self action:@selector(switchView:)];
    self.navigationItem.rightBarButtonItem = switchButton;
    
    self.isCollectionView = YES;    //Show default as Collection
    self.openSectionIndex = NSNotFound;
    
    /* Load the data from Server */
    [self loadCategory];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(pullToRefresh:) forControlEvents:UIControlEventValueChanged];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.refreshControl = self.refreshControl;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerNib:[UINib nibWithNibName:ProductTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:ProductTableViewCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:ItemTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:ItemTableViewCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:ProductCollectionViewHeaderFooterViewIdentifier bundle:nil] forHeaderFooterViewReuseIdentifier:ProductCollectionViewHeaderFooterViewIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:ProductTableViewHeaderFooterViewIdentifier bundle:nil] forHeaderFooterViewReuseIdentifier:ProductTableViewHeaderFooterViewIdentifier];
}

// Get the Category
- (void)loadCategory {
    
    self.refreshControl.selected = YES;
    self.openSectionIndex = NSNotFound;
    
    NSURL *categoryURL = [NSURL  URLWithString:SERVER_URL];
    CategoryService *categoryService = [[CategoryService alloc] init];
    [categoryService loadCategory:categoryURL success:^(NSArray * _Nonnull items) {
        self.categories = items;
        for (Category *category in self.categories) {
            [self loadProduct:category];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            self.refreshControl.selected = NO;
            [self.refreshControl endRefreshing];
        });
    } failure:^(SCError * _Nonnull error) {
        NSLog(@"Error code: %ld, Connection Error : %@", error.code, [error description]);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.refreshControl.selected = NO;
            [self.refreshControl endRefreshing];
        });
    }];
}

// Get the Product for Category
- (void)loadProduct:(Category *)category {
    
    ProductService *productService = [[ProductService alloc] init];
    [productService loadProductForCategory:category success:^(NSArray * _Nonnull items) {
        
        NSArray *categoryURL = [Category_URLs objectForKey:category.name.lowercaseString];
        for (Product *products in items) {
            products.imageUrl = categoryURL[arc4random_uniform(categoryURL.count)];
        }
        //Sort items with name
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self.name" ascending:YES];
        category.products = [items sortedArrayUsingDescriptors:@[sortDescriptor]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } failure:^(SCError * _Nonnull error) {
        NSLog(@"Error code: %ld, Connection Error : %@", error.code, [error description]);
    }];
}

-(IBAction)pullToRefresh:(id)sender {
    if (self.refreshControl.selected == NO) {
        [self loadCategory];
    }
}

// Helper to Change the View as List/Grid
-(IBAction)switchView:(id)sender {
    self.isCollectionView = !self.isCollectionView;
    [self.tableView reloadData];
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.isCollectionView) {
        
        return 1;
        
    } else {
        
        if (self.categories[section].isExpanded) {
            self.openSectionIndex = section;
        }
        
        return (self.categories[section].isExpanded) ? self.categories[section].products.count : 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Category *category = self.categories[indexPath.section];
    
    if (self.isCollectionView) {
        ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductTableViewCellIdentifier forIndexPath:indexPath];
        cell.products = category.products;
        cell.delegate = self;
        return cell;
    } else {
        ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ItemTableViewCellIdentifier forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        Product *product = category.products[indexPath.row];
        cell.titleLabel.text = product.name;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Category *category = self.categories[indexPath.section];
    if (category.products.count) {
        Product *product = category.products[indexPath.row];
        [self didSelectProduct:product];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isCollectionView) {
        return (tableView.bounds.size.width/numberOfColumns) * numberOfRows;
    } else {
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 46;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    Category *category = self.categories[section];
    
    if (self.isCollectionView) {
        ProductCollectionViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ProductCollectionViewHeaderFooterViewIdentifier];
        header.parentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        header.backgroundView.backgroundColor = [UIColor greenColor];
        header.filterSegment.selectedSegmentIndex = category.selectedFilter;
        header.section = section;
        header.delegate = self;
        header.title.text = [category.name capitalizedString];
        return header;
    } else {
        ProductTableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ProductTableViewHeaderFooterViewIdentifier];
        header.parentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        header.section = section;
        header.delegate = self;
        header.title.text = [category.name capitalizedString];
        header.discButton.selected = category.expand;
        category.sectionView = header;
        
        UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:header action:@selector(discButtonPressed:)];
        [header addGestureRecognizer:singleTapRecognizer];
        
        return header;
    }
}

#pragma mark <ProductTableViewCellDelegate>

-(void)didSelectProduct:(Product *) product {
    
    ProductDetailViewController *productDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    productDetailVC.product = product;
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.80];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    
    [self.navigationController pushViewController:productDetailVC animated:YES];
    [UIView commitAnimations];
    
    //productDetailVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:productDetailVC animated:YES completion:nil];
}

#pragma mark <ProductCollectionViewHeaderFooterViewDelegate>

-(void) filterChanged:(NSInteger) filterIndex atSection:(NSInteger)section {
    
    Category *category = self.categories[section];
    category.selectedFilter = filterIndex;
    
    NSSortDescriptor *sortDescriptor;
    
    if (filterIndex == 0) {
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self.name" ascending:YES];
    } else {
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self.cost" ascending:YES];
    }
    
    category.products = [category.products sortedArrayUsingDescriptors:@[sortDescriptor]];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark <ProductTableViewHeaderFooterViewDelegate>

-(void) sectionClosed:(NSInteger) section {
    
    /* Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view. */
    
    Category *category = self.categories[section];
    category.expand = NO;
    
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:section];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    
    self.openSectionIndex = NSNotFound;
}

-(void) sectionOpened:(NSInteger) section {
    
    /* Create an array of the index paths of the rows that has to be inserted and if previous section that has to be closed, then delete those rows from the table view. */
    
    Category *category = self.categories[section];
    category.expand = YES;
    
    NSMutableArray *indexPathToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < category.products.count; i++) {
        [indexPathToInsert addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    NSInteger previousOpenIndex = self.openSectionIndex;
    
    if (previousOpenIndex != NSNotFound) {
        Category *category = self.categories[previousOpenIndex];
        category.expand = NO;
        [category.sectionView toggleButtonPressed:NO];
    
        for (NSInteger i = 0; i < category.products.count; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenIndex]];
        }
    }
    
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenIndex == NSNotFound || section < previousOpenIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    } else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    
    self.openSectionIndex = section;
}

@end
