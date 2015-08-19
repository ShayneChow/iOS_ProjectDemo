//
//  ZXLoginRegisterButton.m
//  百思不得姐
//
//  Created by Xiang on 15/8/19.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXLoginRegisterButton.h"

@implementation ZXLoginRegisterButton

- (void)awakeFromNib {
    // 初始化视图，只加载一次
    self.titleLabel.textAlignment = NSTextAlignmentCenter; // button文字居中
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 重新布局layout
    // 图片
    self.imageView.centerX = self.width * 0.5;
    // self.imageView.x = 0;
    self.imageView.y = 0;
    
    // 文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

@end
