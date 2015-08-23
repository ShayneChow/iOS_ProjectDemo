//
//  ZXMeViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXMeViewController.h"
#import "ZXSettingViewController.h"
#import "ZXMeCell.h"
#import "ZXFooterView.h"

@interface ZXMeViewController ()

@end

@implementation ZXMeViewController

static NSString * const ZXMeId = @"me";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigtion];
    
    [self setupTableView];
    
}

- (void)setupNavigtion {
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

- (void)setupTableView {
    self.tableView.backgroundColor = ZXGlobalBg;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[ZXMeCell class] forCellReuseIdentifier:ZXMeId];
    self.tableView.contentInset = UIEdgeInsetsMake(ZXMargin - 35, 0, 0, 0);
    
    // 设置每一组header和footer的高度
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = ZXMargin;
    
    // 设置底部放置按钮视图
    self.tableView.tableFooterView = [[ZXFooterView alloc] init];
}

#pragma mark - UITableViewControllerDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXMeCell *cell = [tableView dequeueReusableCellWithIdentifier:ZXMeId];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"mine_icon_nearby"];
    } else {
        cell.textLabel.text = @"离线下载";
    }
    return cell;
}

@end
