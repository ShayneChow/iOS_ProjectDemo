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
    NSLog(@"发布新消息，弹出消息发布视图");
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局子控件
    // 发布按钮
    self.publishButton.centerX = self.width * 0.5;
    self.publishButton.centerY = self.height * 0.5;
    
    // 处理其他按钮
    CGFloat buttonW = self.width / 5;
    CGFloat i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if (![NSStringFromClass(tabBarButton.class) isEqualToString:@"UITabBarButton"]) continue;
        
        tabBarButton.width = buttonW;
        tabBarButton.x = i * buttonW;
        if (i > 1) tabBarButton.x += buttonW;
        
        i++;
    }
}

@end
