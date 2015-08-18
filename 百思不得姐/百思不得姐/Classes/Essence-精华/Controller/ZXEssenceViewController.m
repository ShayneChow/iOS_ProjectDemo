//
//  ZXEssenceViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXEssenceViewController.h"

@interface ZXEssenceViewController ()

@end

@implementation ZXEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZXGlobalBg;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 设置导航栏左边的按钮，此处使用的是UIButton的拓展分类（在pch中已定义）
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(tagSubClick) image:@"MainTagSubIcon" highImage:@"MainTagSubIconClick"];
}

- (void)tagSubClick {
    ZXLogFunc;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
