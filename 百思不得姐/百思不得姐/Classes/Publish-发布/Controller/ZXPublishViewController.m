//
//  ZXPublishViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/27.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXPublishViewController.h"
#import "ZXPublishButton.h"

@interface ZXPublishViewController ()

@end

@implementation ZXPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加标语
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    sloganView.centerX = ZXScreenW * 0.5;
    sloganView.y = ZXScreenH * 0.15;
    [self.view addSubview:sloganView];
    
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    // 添加所有的按钮
    int totalColsCount = 3; // 一共有3列
    CGFloat buttonW = ZXScreenW / totalColsCount;
    CGFloat buttonH = buttonW;
    CGFloat buttonY = (ZXScreenH - 2 * buttonH) * 0.5;
    for (int i = 0; i < 6; i++) {
        ZXPublishButton *button = [[ZXPublishButton alloc] init];
        button.width = buttonW;
        button.height = buttonH;
        button.x = (i % totalColsCount) * buttonW;
        button.y = buttonY + (i / totalColsCount) * buttonH;
        [self.view addSubview:button];
        
        // 设置数据
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
    }
}
- (IBAction)cancelButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
