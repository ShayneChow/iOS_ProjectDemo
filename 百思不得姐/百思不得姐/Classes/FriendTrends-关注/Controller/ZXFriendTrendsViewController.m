//
//  ZXFriendTrendsViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXFriendTrendsViewController.h"
#import "ZXLoginRegisterViewController.h"

@interface ZXFriendTrendsViewController ()

@end

@implementation ZXFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZXGlobalBg;
    // 设置导航栏中间的文字
    self.navigationItem.title = @"我的关注";
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendsRecommentClick) image:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click"];
}

- (void)friendsRecommentClick {
    ZXLogFunc;
}

// 跳转到登录/注册界面
- (IBAction)loginRegister {
    ZXLoginRegisterViewController *loginRegister = [[ZXLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegister animated:YES completion:nil];
}

@end
