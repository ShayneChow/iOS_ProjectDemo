//
//  ZXNavigationController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXNavigationController.h"

#define ZXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface ZXNavigationController ()

@end

@implementation ZXNavigationController

+ (void)initialize {
    // 设置导航栏背景
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    // 设置导航栏中间的标题属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:attrs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 清空手势代理, 然后就会重新出现手势移除控制器的功能
    self.interactivePopGestureRecognizer.delegate = nil;
}

/**
 *  拦截导航控制器push进来的所有子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // viewController不是导航控制器的第1个子控制器
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置viewController左上角的按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:ZXColor(251, 32, 37) forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        // 相当于让按钮的内容往左边偏移20
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    // super的push方法最好放在最后面调用
    // 一旦调用pushViewController:animated:方法,就会开始创建viewController的view,也就是调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
