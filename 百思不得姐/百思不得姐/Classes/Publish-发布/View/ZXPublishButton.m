//
//  ZXPublishButton.m
//  百思不得姐
//
//  Created by Xiang on 15/8/28.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXPublishButton.h"

@implementation ZXPublishButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentCenter; // button文字居中
    }
    return self;
}

@end
