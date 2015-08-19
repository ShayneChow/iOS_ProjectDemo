//
//  ZXTagViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/18.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXTagViewController.h"
#import "ZXTag.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import "ZXTagCell.h"

@interface ZXTagViewController ()

/** 标签数组（存放ZXTag模型） */
@property (nonatomic, strong) NSArray *tags;

/** AFN管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

@end

@implementation ZXTagViewController

static NSString * const ZXTagId = @"tag";

#pragma mark - lazy
- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setuptableView];
    
    [self loadTags];
}

- (void)setuptableView {
    self.title = @"推荐标签";
    self.tableView.backgroundColor = ZXGlobalBg;
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXTagCell class]) bundle:nil] forCellReuseIdentifier:ZXTagId];
}

- (void)loadTags {
    // 弹窗，提示正在加载
    [SVProgressHUD show];
    
    // 设置请求参数，按照官方API设置
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    // 发送请求（使用AFN）
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        // 关闭弹框
        [SVProgressHUD dismiss];
        
        // 解析数据
        // responseObject[字典数组，里面存放的是NSDictionary对象]
        // self.tags[模型数组，里面存放的是XMGTag对象]
        self.tags = [ZXTag objectArrayWithKeyValuesArray:responseObject];
        
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载标签信息失败"];
    }];
}

- (void)dealloc {
    // 关闭弹框
    [SVProgressHUD dismiss];
    
    // 取消请求
    //    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    [self.manager invalidateSessionCancelingTasks:YES]; // 直接弄死Seesion, 取消所有任务
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ZXTagId];
    
    cell.tagModel = self.tags[indexPath.row];
    
    return cell;
}

@end
