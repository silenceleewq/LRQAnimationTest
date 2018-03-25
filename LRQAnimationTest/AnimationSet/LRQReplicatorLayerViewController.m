//
//  LRQReplicatorLayerViewController.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 24/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LRQReplicatorLayerViewController.h"
#import "LRQReflectionView.h"
@interface LRQReplicatorLayerViewController ()
@end

@implementation LRQReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LRQReflectionView *reflection = [[LRQReflectionView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:reflection];
    reflection.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Square"].CGImage);
}
///CAReplicatorLayer Demo
- (void)replicatorLayerDemo {
    //create a replicator layer and add it to our view
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.bounds = CGRectMake(0, 0, 300, 300);
    replicator.position = CGPointMake(self.containerView.layer.position.x, self.containerView.layer.position.y);
    [self.containerView.layer addSublayer:replicator];
    UIView *blue = [[UIView alloc] initWithFrame:replicator.frame];
    blue.backgroundColor = [UIColor blueColor];
    [self.view insertSubview:blue atIndex:0];
    // configure the replicator
    replicator.instanceCount = 10;
    
    //apply a transform for each instance
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI/5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    
    replicator.instanceTransform = transform;
    
    //apply a color shift for each instance
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100.0, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
}

@end
























