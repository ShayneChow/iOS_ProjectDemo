//
//  ZXLoginRegisterTextField.m
//  百思不得姐
//
//  Created by Xiang on 15/8/19.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXLoginRegisterTextField.h"
#import <objc/runtime.h>

#define XMGPlaceholderColor @"placeholderLabel.textColor"

@implementation ZXLoginRegisterTextField

- (void)awakeFromNib {
    // 设置TextField光标为白色
    self.tintColor = [UIColor whiteColor];
    
    // 设置输入框一键删除，在xib中可设置
    self.clearButtonMode = UITextFieldViewModeAlways;
    
    // 默认行为
    [self resignFirstResponder];
}

/**
 *  正在编辑
 */
- (BOOL)becomeFirstResponder {
    [self setValue:[UIColor whiteColor] forKeyPath:XMGPlaceholderColor];
    return [super becomeFirstResponder];
}

/**
 * 结束编辑
 */
- (BOOL)resignFirstResponder {
    [self setValue:[UIColor grayColor] forKeyPath:XMGPlaceholderColor];
    return [super resignFirstResponder];
}

@end
