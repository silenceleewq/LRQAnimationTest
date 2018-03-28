//
//  LRQBaseViewController.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 24/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LRQBaseViewController.h"

@interface LRQBaseViewController ()

@end

@implementation LRQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.containerView = [UIView new];
    self.containerView.frame = self.view.bounds;
    self.containerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.containerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end
