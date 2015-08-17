//
//  ZXTabBar.m
//  百思不得姐
//
//  Created by Xiang on 15/8/17.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXTabBar.h"
#import "UIView+XMGExtension.h"

@interface ZXTabBar()

/** 发布按钮 */
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation ZXTabBar

#pragma mark - lazy
- (UIButton *)publishButton {
    if (_publishButton == nil) {
        // 设置发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton sizeToFit];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

- (void)publishClick {
    // 发布按钮点击响应方法
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局子控件
    // 发布按钮
    self.publishButton.centerX = self.width * 0.5;
    self.publishButton.centerY = self.height * 0.5;
}

@end
