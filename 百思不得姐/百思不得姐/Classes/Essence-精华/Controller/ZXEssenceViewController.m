//
//  ZXEssenceViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/16.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXEssenceViewController.h"

@interface ZXEssenceViewController ()

@end

@implementation ZXEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
