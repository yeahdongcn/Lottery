//
//  RSView.m
//  RSLottery
//
//  Created by R0CKSTAR on 14-1-11.
//  Copyright (c) 2014年 P.D.Q. All rights reserved.
//

#import "RSView.h"

@implementation RSView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingNone;
        self.layer.cornerRadius = 5;
        
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.imageView.layer.cornerRadius = 5;
        self.imageView.layer.borderWidth = 1;
        [self addSubview:self.imageView];
        
        self.view = [[UIView alloc] initWithFrame:self.bounds];
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.view.layer.cornerRadius = 5;
        self.view.layer.borderWidth = 1;
        [self addSubview:self.view];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.font = [UIFont boldSystemFontOfSize:30];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.text = @"Label";
        [self.label sizeToFit];
        self.label.frame = CGRectMake(0, (self.view.bounds.size.height - self.label.bounds.size.height) / 2.0f, self.view.bounds.size.width, self.label.bounds.size.height);
        [self.view addSubview:self.label];
    }
    return self;
}

@end
