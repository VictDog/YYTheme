//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  UIView+YYExtension.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIView+YYExtension.h"

@implementation UIView (YYExtension)

- (void)setYy_x:(CGFloat)yy_x
{
    CGRect frame = self.frame;
    frame.origin.x = yy_x;
    self.frame = frame;
}

- (CGFloat)yy_x
{
    return self.yy_origin.x;
}

- (void)setYy_centerX:(CGFloat)yy_centerX
{
    CGPoint center = self.center;
    center.x = yy_centerX;
    self.center = center;
}

- (CGFloat)yy_centerX
{
    return self.center.x;
}

-(void)setYy_centerY:(CGFloat)yy_centerY
{
    CGPoint center = self.center;
    center.y = yy_centerY;
    self.center = center;
}

- (CGFloat)yy_centerY
{
    return self.center.y;
}

- (void)setYy_y:(CGFloat)yy_y
{
    CGRect frame = self.frame;
    frame.origin.y = yy_y;
    self.frame = frame;
}

- (CGFloat)yy_y
{
    return self.frame.origin.y;
}

- (void)setYy_size:(CGSize)yy_size
{
    CGRect frame = self.frame;
    frame.size = yy_size;
    self.frame = frame;
    
}

- (CGSize)yy_size
{
    return self.frame.size;
}

- (void)setYy_height:(CGFloat)yy_height
{
    CGRect frame = self.frame;
    frame.size.height = yy_height;
    self.frame = frame;
}

- (CGFloat)yy_height
{
    return self.frame.size.height;
}

- (void)setYy_width:(CGFloat)yy_width
{
    CGRect frame = self.frame;
    frame.size.width = yy_width;
    self.frame = frame;
    
}
- (CGFloat)yy_width
{
    return self.frame.size.width;
}

- (void)setYy_origin:(CGPoint)yy_origin
{
    CGRect frame = self.frame;
    frame.origin = yy_origin;
    self.frame = frame;
}

- (CGPoint)yy_origin
{
    return self.frame.origin;
}

@end
