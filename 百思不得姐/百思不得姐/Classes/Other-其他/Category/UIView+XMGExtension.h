//
//  UIView+XMGExtension.h
//  2期-百思不得姐
//
//  Created by apple on 15/8/15.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMGExtension)
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@end

/**
 1.@property如果不是写在分类中, 会自动生成
 1> 属性的setter\getter声明和实现
 2> _下划线开头的成员变量
 
 2.@property如果是写在分类中, 仅仅会自动生成
 1> 属性的setter\getter声明
 */
