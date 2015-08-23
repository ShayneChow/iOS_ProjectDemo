//
//  ZXSquareButton.m
//  百思不得姐
//
//  Created by Xiang on 15/8/24.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXSquareButton.h"

@implementation ZXSquareButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 图片
    self.imageView.y = self.height * 0.1;
    self.imageView.height = self.height * 0.45;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * 0.5;
    
    // 文字
    self.titleLabel.width = self.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.height = self.height - self.titleLabel.y;
    self.titleLabel.x = 0;
}

@end
