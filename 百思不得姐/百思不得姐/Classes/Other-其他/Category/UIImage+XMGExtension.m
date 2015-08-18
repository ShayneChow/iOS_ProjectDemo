//
//  UIImage+XMGExtension.m
//  2期-百思不得姐
//
//  Created by apple on 15/8/16.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "UIImage+XMGExtension.h"

@implementation UIImage (XMGExtension)
- (instancetype)circleImage
{
    // 开启上下文
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 画圆
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGRect rect = {{0, 0}, {self.size.width, self.size.height}};
    CGRect rect = {CGPointZero, self.size};
    CGContextAddEllipseInRect(context, rect);
    
    // 裁剪
    CGContextClip(context);
    
    // 将下载好的图片画到圆上
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end
