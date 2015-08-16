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
    
    ZXEssenceViewController *essenceViewController = [[ZXEssenceViewController alloc] init];
    ZXNavigationController  *nav = [[ZXNavigationController alloc] initWithRootViewController:essenceViewController];
    [self addChildViewController:nav];
    
    essenceViewController.title = @"精华";
    essenceViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essenceViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    ZXNewViewController *newViewController = [[ZXNewViewController alloc] init];
    ZXNavigationController  *nav1 = [[ZXNavigationController alloc] initWithRootViewController:newViewController];
    [self addChildViewController:nav1];
    
    newViewController.title = @"新帖";
    newViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    newViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    
    ZXFriendTrendsViewController *friendTrendsViewController = [[ZXFriendTrendsViewController alloc] init];
    ZXNavigationController  *nav2 = [[ZXNavigationController alloc] initWithRootViewController:friendTrendsViewController];
    [self addChildViewController:nav2];
    
    friendTrendsViewController.title = @"关注";
    friendTrendsViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrendsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    
    ZXMeViewController *meViewController = [[ZXMeViewController alloc] init];
    ZXNavigationController  *nav3 = [[ZXNavigationController alloc] initWithRootViewController:meViewController];
    [self addChildViewController:nav3];
    
    meViewController.title = @"关注";
    meViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    meViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
}

@end
