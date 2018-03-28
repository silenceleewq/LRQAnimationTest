//
//  LRQPresentationLayerViewController.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 28/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LRQPresentationLayerViewController.h"

@interface LRQPresentationLayerViewController ()
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation LRQPresentationLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.colorLayer = [CALayer layer];
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(150, 150);
    [self.containerView.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        self.colorLayer.backgroundColor = [self randomColor].CGColor;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}



@end
