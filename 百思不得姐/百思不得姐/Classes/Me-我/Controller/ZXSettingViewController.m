//
//  ZXSettingViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/18.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXSettingViewController.h"
#import "ZXClearCacheCell.h"
#import <SDImageCache.h>
#import <SVProgressHUD.h>

@interface ZXSettingViewController ()

@end

@implementation ZXSettingViewController

static NSString * const ZXClearCacheId = @"clearCache";
static NSString * const ZXOtherId = @"other";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.view.backgroundColor = ZXGlobalBg;
    // cell顶部间距设置
    self.tableView.contentInset = UIEdgeInsetsMake(ZXMargin - ZXGroupedTableViewTopMargin, 0, 0, 0);
    // 各section间的间距设置
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 0;
    
    // 注册cell
    [self.tableView registerClass:[ZXClearCacheCell class] forCellReuseIdentifier:ZXClearCacheId];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ZXOtherId];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [tableView dequeueReusableCellWithIdentifier:ZXClearCacheId];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZXOtherId];
    cell.textLabel.text = [NSString stringWithFormat:@"other - %zd - %zd", indexPath.section, indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 先取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 点击后清除缓存
    if (indexPath.section) return;
    
    // 清除缓存
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    // 清除SDWebImage的所有缓存图片
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        // 关闭弹框
        [SVProgressHUD showSuccessWithStatus:@"清除缓存成功"];
        
        // 设置cell的文字
        ZXClearCacheCell *cell = (ZXClearCacheCell *)[tableView cellForRowAtIndexPath:indexPath];
        [cell reset];
    }];
}

@end
