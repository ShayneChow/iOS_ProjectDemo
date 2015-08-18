//
//  ZXLoginRegisterViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/19.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXLoginRegisterViewController.h"

@interface ZXLoginRegisterViewController ()

/** 登录框左边距 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation ZXLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 *  注册/登录切换
 */
- (IBAction)showLoginOrRegister:(UIButton *)button {
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) {
        self.leftMargin.constant = 0;
        button.selected = NO;
    } else {
        self.leftMargin.constant =  - self.view.width;
        button.selected = YES;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

/**
 *  状态栏的样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    // 白色状态栏
    return UIStatusBarStyleLightContent;
}

/**
 *  点击界面收起键盘
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
