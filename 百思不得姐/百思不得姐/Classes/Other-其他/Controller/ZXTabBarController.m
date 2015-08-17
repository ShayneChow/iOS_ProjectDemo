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

@interface ZXTabBarController ()

@end

@implementation ZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewController];
    
    [self setTabBArItemAttrs];

}

- (void)setTabBArItemAttrs {
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

- (void)setupChildViewController {
//    ZXEssenceViewController *essenceViewController = [[ZXEssenceViewController alloc] init];
//    ZXNavigationController  *nav = [[ZXNavigationController alloc] initWithRootViewController:essenceViewController];
//    [self addChildViewController:nav];
//    
//    essenceViewController.title = @"精华";
//    essenceViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
//    essenceViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
//    
//    ZXNewViewController *newViewController = [[ZXNewViewController alloc] init];
//    ZXNavigationController  *nav1 = [[ZXNavigationController alloc] initWithRootViewController:newViewController];
//    [self addChildViewController:nav1];
//    
//    newViewController.title = @"新帖";
//    newViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
//    newViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
//    
//    ZXFriendTrendsViewController *friendTrendsViewController = [[ZXFriendTrendsViewController alloc] init];
//    ZXNavigationController  *nav2 = [[ZXNavigationController alloc] initWithRootViewController:friendTrendsViewController];
//    [self addChildViewController:nav2];
//    
//    friendTrendsViewController.title = @"关注";
//    friendTrendsViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
//    friendTrendsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
//    
//    ZXMeViewController *meViewController = [[ZXMeViewController alloc] init];
//    ZXNavigationController  *nav3 = [[ZXNavigationController alloc] initWithRootViewController:meViewController];
//    [self addChildViewController:nav3];
//    
//    meViewController.title = @"关注";
//    meViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
//    meViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    
    [self setupChildViewController:[[ZXEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildViewController:[[ZXNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildViewController:[[ZXFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildViewController:[[ZXMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

- (void)setupChildViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    ZXNavigationController  *nav = [[ZXNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
    
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}

@end
