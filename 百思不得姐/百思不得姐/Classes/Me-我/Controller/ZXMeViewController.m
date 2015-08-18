//
//  ZXMeViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXMeViewController.h"
#import "ZXSettingViewController.h"

@interface ZXMeViewController ()

@end

@implementation ZXMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZXGlobalBg;
    
    // 设置导航栏右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithTarget:self action:@selector(settingClick) image:@"mine-setting-icon" highImage:@"mine-setting-icon-click"];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithTarget:self action:@selector(moonClick) image:@"mine-moon-icon" highImage:@"mine-moon-icon-click"];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)settingClick {
    ZXSettingViewController *setting = [[ZXSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)moonClick {
    ZXLogFunc;
}

@end
