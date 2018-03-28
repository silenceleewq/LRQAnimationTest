//
//  LRQTransactionViewController.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 26/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LRQTransactionViewController.h"

@interface LRQTransactionViewController ()
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation LRQTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    layer.position = self.view.center;
    self.colorLayer = layer;
    [self.containerView.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.colorLayer.backgroundColor = [self randomColor].CGColor;
    CGRect rect = self.colorLayer.frame;
    rect.size.width += 20;
    self.colorLayer.frame = rect;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
