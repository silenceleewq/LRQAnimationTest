//
//  LayerLabel.m
//  LRQAnimationTest
//
//  Created by lirenqiang on 24/03/2018.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "LayerLabel.h"

@implementation LayerLabel

+ (Class)layerClass {
    return [CATextLayer class];
}

- (CATextLayer *)textLayer {
    return (CATextLayer *)self.layer;
}

- (void)setup {
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;
    [self.layer display];
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

- (void)setText:(NSString *)text {
    super.text = text;
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor {
    [super setTextColor:textColor];
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    super.font = font;
    // set layer font
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);
}

@end
























