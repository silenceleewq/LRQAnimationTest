//
//  LRQReflectionView.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 25/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LRQReflectionView.h"

@implementation LRQReflectionView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (void)setup {
    //configure replicator
    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    
    layer.instanceCount = 2;
    //move reflection instance below original and flip vertically
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.bounds.size.height + 2;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    layer.instanceTransform = transform;
    layer.instanceAlphaOffset = -0.6;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

@end
























