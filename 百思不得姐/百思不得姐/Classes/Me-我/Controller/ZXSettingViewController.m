//
//  ZXSettingViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/18.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXSettingViewController.h"
#import "ZXClearCacheCell.h"

@interface ZXSettingViewController ()

@end

@implementation ZXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.view.backgroundColor = ZXGlobalBg;
    self.tableView.contentInset = UIEdgeInsetsMake(ZXMargin - ZXGroupedTableViewTopMargin, 0, 0, 0);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"清除缓存";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 先取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 点击后清除缓存
    
}

@end
