//
//  ZXNewViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXNewViewController.h"

@interface ZXNewViewController ()

@end

@implementation ZXNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZXGlobalBg;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(tagSubClick) image:@"MainTagSubIcon" highImage:@"MainTagSubIconClick"];
}

- (void)tagSubClick {
    ZXLogFunc;
}

@end
