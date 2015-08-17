//
//  ZXTabBarController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/15.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXTabBarController.h"
#import "ZXNavigationController.h"
#import "ZXEssenceViewController.h"
#import "ZXNewViewController.h"
#import "ZXFriendTrendsViewController.h"
#import "ZXMeViewController.h"
#import "ZXTabBar.h"

@interface ZXTabBarController ()

@end

@implementation ZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewController];
    
    [self setTabBarItemAttrs];
    
    [self setTabBarItem];

}

#pragma mark - 设置tabbar
- (void)setTabBarItem {
    [self setValue:[[ZXTabBar alloc] init] forKeyPath:@"tabBar"];
}

#pragma mark - 设置tabbar属性
- (void)setTabBarItemAttrs {
    // 通过appearance统一设置UITabBarItem的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    // 规律:后面带有UI_APPEARANCE_SELECTOR的方法,都可以通过appearance对象统一设置
    // 设置文字属性(UIControlStateNormal)
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    // 设置文字属性(UIControlStateSelected)
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

#pragma mark - 设置tabbar子控制器
- (void)setupChildViewController {
    [self setupChildViewController:[[ZXEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildViewController:[[ZXNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildViewController:[[ZXFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildViewController:[[ZXMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

- (void)setupChildViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    ZXNavigationController  *nav = [[ZXNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
    
    viewController.title = title; // 此处设置等价于同时设置了tabBarItem.title和navigationItem.title
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}

@end
