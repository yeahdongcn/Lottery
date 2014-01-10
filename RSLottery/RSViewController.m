//
//  RSViewController.m
//  RSLottery
//
//  Created by R0CKSTAR on 1/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#import "RSViewController.h"

@interface RSViewController ()

@property (nonatomic, strong) NSMutableArray *unselectedViews;

@end

@implementation RSViewController

static const int kNumberOfRows    = 8;
static const int kNumberOfColumns = 12;

- (void)__handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint tapPoint = [tapGestureRecognizer locationInView:self.view];
    UIView *selectedView = nil;
    for (UIView *view in self.unselectedViews) {
        if (CGRectContainsPoint(view.frame, tapPoint)) {
            selectedView = view;
            break;
        }
    }
    
    if (selectedView) {
        [self.unselectedViews removeObject:selectedView];
        
        [UIView animateWithDuration:0.6 animations:^{
            selectedView.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_2, 0, 1, 0);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.6 animations:^{
                selectedView.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI, 0, 1, 0);
            } completion:^(BOOL finished) {
            }];
        }];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.unselectedViews = [[NSMutableArray alloc] initWithCapacity:(kNumberOfRows * kNumberOfColumns)];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    CGSize size = self.view.bounds.size;
    if (size.width <= size.height) {
        CGFloat width = size.height;
        size.height = size.width;
        size.width = width;
    }
    
    CGSize itemSize = CGSizeMake(size.width / kNumberOfColumns, size.height / kNumberOfRows);
    
    for (int row = 0; row < kNumberOfRows; row++) {
        for (int column = 0; column < kNumberOfColumns; column++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(column * itemSize.width, row * itemSize.height, itemSize.width, itemSize.height)];
            view.layer.borderWidth = 1;
            [self.view addSubview:view];
            [self.unselectedViews addObject:view];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleTapGesture:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
