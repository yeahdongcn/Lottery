//
//  RSViewController.m
//  RSLottery
//
//  Created by R0CKSTAR on 1/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#import "RSViewController.h"

#import "RSView.h"

@interface RSViewController ()

@property (nonatomic, strong) RSView *selectedView;

@property (nonatomic) CGRect selectedViewFrame;

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation RSViewController

static const int kNumberOfRows    = 8;
static const int kNumberOfColumns = 12;

- (void)__handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    if (!self.selectedView.hidden) {
        tapGestureRecognizer.enabled = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.selectedView.alpha = 0;
        } completion:^(BOOL finished) {
            RSView *view = (RSView *)[self.view viewWithTag:self.selectedView.tag];
            [view.view removeFromSuperview];
            view.view = nil;
            view.imageView.image = self.selectedView.imageView.image;
            
            self.selectedView.hidden = YES;
            self.selectedView.alpha = 1;
            self.selectedView.view.layer.transform = CATransform3DIdentity;
            
            self.selectedView.view.layer.anchorPoint = CGPointMake(.5, .5);
            self.selectedView.view.center = CGPointMake(self.selectedView.view.center.x + self.selectedView.view.bounds.size.width / 2.0f, self.selectedView.view.center.y);
            
            tapGestureRecognizer.enabled = YES;
        }];
        return;
    }
    
    CGPoint tapPoint = [tapGestureRecognizer locationInView:self.view];
    RSView *selectedView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[RSView class]]) {
            if (CGRectContainsPoint(view.frame, tapPoint)) {
                selectedView = (RSView *)view;
                break;
            }
        }
    }
    
    if (selectedView && selectedView.view) {
        tapGestureRecognizer.enabled = NO;
        
        self.selectedView.frame = selectedView.frame;
        self.selectedView.view.backgroundColor = selectedView.view.backgroundColor;
        self.selectedView.label.text = selectedView.label.text;
        self.selectedView.tag = selectedView.tag;
        self.selectedView.hidden = NO;
        
        int index = arc4random() % self.list.count;
        NSString *imageName = [NSString stringWithFormat:@"%@%@", [self.list objectAtIndex:index], @".jpg"];
        UIImage *image = [UIImage imageNamed:imageName];
        self.selectedView.imageView.image = image;
        [self.list removeObjectAtIndex:index];
        
        [UIView animateWithDuration:.5 animations:^{
            self.selectedView.frame = self.selectedViewFrame;
        } completion:^(BOOL finished) {
            self.selectedView.view.layer.anchorPoint = CGPointMake(0, .5);
            self.selectedView.view.center = CGPointMake(self.selectedView.view.center.x - self.selectedView.view.bounds.size.width / 2.0f, self.selectedView.view.center.y);
            
            [UIView animateWithDuration:.8 animations:^{
                CATransform3D transform = CATransform3DMakeRotation(3.141f / 2.0f, 0.0f, -1.0f, 0.0f);
                transform.m34 = 0.001f;
                transform.m14 = -0.0015f;
                self.selectedView.view.layer.transform = transform;
            } completion:^(BOOL finished){
                tapGestureRecognizer.enabled = YES;
            }];
        }];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.list = [[NSMutableArray alloc] initWithObjects:
                     @"雅诗兰黛 Esteelauder限量完美彩妆礼盒套装",
                     @"雅诗兰黛 Esteelauder圣诞快乐派对限量完美彩妆礼盒套装",
                     @"雅诗兰黛 Esteelauder圣诞快乐派对限量完美彩妆礼盒套装",
                     @"雅诗兰黛 Esteelauder圣诞快乐派对限量完美彩妆礼盒套装",
                     @"雅诗兰黛 Esteelauder圣诞快乐派对限量完美彩妆礼盒套装",
                     @"雅诗兰黛 Esteelauder圣诞快乐派对限量完美彩妆礼盒套装",
                     @"ESTEE LAUDER雅诗兰黛 13圣诞限量折叠彩妆盘",
                     @"ESTEE LAUDER雅诗兰黛 13圣诞限量折叠彩妆盘",
                     @"ESTEE LAUDER雅诗兰黛 13圣诞限量折叠彩妆盘",
                     @"ESTEE LAUDER雅诗兰黛 13圣诞限量折叠彩妆盘",
                     @"ESTEE LAUDER雅诗兰黛 13圣诞限量折叠彩妆盘",
                     @"兰蔻 抗皱紧肤套装",
                     @"兰蔻 抗皱紧肤套装",
                     @"兰蔻 抗皱紧肤套装",
                     @"兰蔻 抗皱紧肤套装",
                     @"兰蔻 抗皱紧肤套装",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"艾美特（airmate）欧式快热电暖炉",
                     @"飞利浦迷你组合音响",
                     @"飞利浦迷你组合音响",
                     @"联想20英寸一体电脑",
                     @"联想20英寸一体电脑",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"飞利浦多功能电饭煲",
                     @"LG空气净化器",
                     @"LG空气净化器",
                     @"飞利浦台式微型音响",
                     @"飞利浦台式微型音响",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"JBL iPhone5 音乐底座",
                     @"TCL42英寸 超窄边智能液晶电视",
                     @"TCL42英寸 超窄边智能液晶电视",
                     @"TCL42英寸 超窄边智能液晶电视",
                     @"TCL42英寸 超窄边智能液晶电视",
                     @"WEEKENDER度假系列拉杆箱",
                     @"WEEKENDER度假系列拉杆箱",
                     @"WEEKENDER度假系列拉杆箱",
                     @"BURBERRY 巴宝莉女表",
                     @"BURBERRY 巴宝莉女表",
                     @"阿玛尼 ARMANI男表",
                     @"阿玛尼 ARMANI男表",
                     @"海鸥SeaGull自动机械情侣对表女款",
                     @"海鸥SeaGull自动机械情侣对表男款",
                     @"COACH 蔻驰 女士玫红色皮革小号手提肩背斜挎包",
                     @"COACH（蔻驰） 女士手提肩背包",
                     @"BALLY 巴利 男式棕色牛皮斜挎包",
                     @"APPLE iPhone 5s",
                     @"三星 Galaxy Note 3 N9006 3G手机",
                     @"ipad mini2",
                     @"ipad mini2",
                     @"ipad mini2",
                     @"ipad mini2",
                     @"飞利浦5L电脑型多功能电压力煲",
                     @"飞利浦5L电脑型多功能电压力煲",
                     @"飞利浦5L电脑型多功能电压力煲",
                     @"飞利浦5L电脑型多功能电压力煲",
                     @"飞利浦5L电脑型多功能电压力煲",
                     nil];
        
        NSAssert(self.list.count == kNumberOfColumns * kNumberOfRows, @"Make sure items and views are match.");
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    CGSize contentSize = self.view.bounds.size;;
    if (contentSize.width <= contentSize.height) {
        CGFloat width = contentSize.height;
        contentSize.height = contentSize.width;
        contentSize.width = width;
    }
    
    CGSize itemSize = CGSizeMake(contentSize.width / kNumberOfColumns, contentSize.height / kNumberOfRows);
    
    for (int row = 0; row < kNumberOfRows; row++) {
        for (int column = 0; column < kNumberOfColumns; column++) {
            RSView *view = [[RSView alloc] initWithFrame:CGRectMake(column * itemSize.width, row * itemSize.height, itemSize.width, itemSize.height)];
            view.tag = 0xcafe + kNumberOfColumns * row + column;
            view.label.text = [NSString stringWithFormat:@"%d", kNumberOfColumns * row + column + 1];
            view.view.backgroundColor = [UIColor colorWithRed:(arc4random() % 257) / 256. green:(arc4random() % 257) / 256. blue:(arc4random() % 257) / 256. alpha:1];
            [self.view addSubview:view];
        }
    }
    
    self.selectedView = [[RSView alloc] initWithFrame:CGRectMake(0, 0, itemSize.width, itemSize.height)];
    self.selectedView.hidden = YES;
    [self.view addSubview:self.selectedView];
    
    self.selectedViewFrame = CGRectMake(itemSize.width * 3, itemSize.height, itemSize.width * 6, itemSize.height * 6);
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
