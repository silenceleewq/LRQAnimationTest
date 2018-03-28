//
//  LRQAnimationCubeViewController.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 24/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LRQAnimationCubeViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.1

@interface LRQAnimationCubeViewController ()
@property (strong, nonatomic) NSArray <UIView *> *faces;
@property (assign, nonatomic) CATransform3D perspective;
@end

@implementation LRQAnimationCubeViewController
@synthesize perspective = perspective;

- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    face.hidden = NO;
    [self.containerView addSubview:face];
    //center the face view within the container
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
    //apply lighting
    [self applyLightingToFace:face.layer];
    if (index != 2) {
        face.userInteractionEnabled = NO;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up the container sublayer transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
    //add cube face 1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    //add cube face 2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    perspective = self.containerView.layer.sublayerTransform;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
}

- (NSArray<UIView *> *)faces {
    if (!_faces) {
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:6];
        CGFloat width = 200;
        for (int i = 1; i < 7; ++i) {
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
            UIView *subView;
            if (i == 3) {
                subView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, width)];
                [(UIButton *)subView setTitle:@(i).stringValue forState:UIControlStateNormal];
                [(UIButton *)subView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [subView setBackgroundColor:[self randomColor]];
            } else {
                subView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, width)];
                [(UILabel *)subView setText:@(i).stringValue];
                [(UILabel *)subView setTextColor:[UIColor blackColor]];
                [(UILabel *)subView setTextAlignment:NSTextAlignmentCenter];
                [(UILabel *)subView setFont:[UIFont systemFontOfSize:50]];
                subView.backgroundColor = [self randomColor];
            }
//            v.backgroundColor = [UIColor whiteColor];
            v.userInteractionEnabled = YES;
            [v addSubview:subView];
            [self.view addSubview:v];
            [arrM addObject:v];
            [self randomColor];
        }
        _faces = arrM;
    }
    return _faces;
}



@end
