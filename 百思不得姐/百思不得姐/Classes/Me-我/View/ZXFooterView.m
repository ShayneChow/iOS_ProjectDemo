//
//  ZXFooterView.m
//  百思不得姐
//
//  Created by Xiang on 15/8/24.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXFooterView.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <UIButton+WebCache.h>
#import "ZXSquare.h"
#import "ZXSquareButton.h"


@implementation ZXFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // 发送请求
        ZXWeakSelf;
        [[AFHTTPSessionManager manager] GET:ZXBaseURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            //[responseObject writeToFile:@"/Users/Xiang/Desktop/square.plist" atomically:YES];
            NSArray *squares = [ZXSquare objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [weakSelf createSquares:squares];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"加载【我】模块信息失败"];
        }];
    }
    return self;
}

- (void)createSquares:(NSArray *)squares {
    NSUInteger count = squares.count;
    int totalColCount = 4;
    CGFloat buttonW = ZXScreenW / totalColCount;
    CGFloat buttonH = buttonW;
    for (int i = 0; i < count; i++) {
        // 创建按钮
        ZXSquareButton *button = [ZXSquareButton buttonWithType:UIButtonTypeCustom];
        //        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        // 计算frame
        //        button.width = buttonW - 1;
        //        button.height = buttonH - 1;
        button.width = buttonW;
        button.height = buttonH;
        button.x = (i % totalColCount) * buttonW;
        button.y = (i / totalColCount) * buttonH;
        
        // 设置数据
        button.square = squares[i];
//        ZXSquare *square = squares[i];
//        [button setTitle:square.name forState:UIControlStateNormal];
//        // 下载图片
//        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal];
        
        // 设置高度
        self.height = CGRectGetMaxY(button.frame);
    }
}

- (void)buttonClick:(ZXSquareButton *)button {
    ZXLog(@"%s %@", __func__, button.square.name);
}

@end
