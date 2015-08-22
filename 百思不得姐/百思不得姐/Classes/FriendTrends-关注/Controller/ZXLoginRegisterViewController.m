//
//  ZXLoginRegisterViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/19.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXLoginRegisterViewController.h"
#import "ZXLoginRegisterTextField.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface ZXLoginRegisterViewController ()

/** 登录框左边距 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@property (weak, nonatomic) IBOutlet ZXLoginRegisterTextField *loginPhoneTextField;
@property (weak, nonatomic) IBOutlet ZXLoginRegisterTextField *loginPasswordTextField;

@property (nonatomic, strong) NSString *loginPhone;
@property (nonatomic, strong) NSString *loginPassword;

/** AFN管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

@end

@implementation ZXLoginRegisterViewController

#pragma mark - lazy
- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 *  注册/登录切换
 */
- (IBAction)showLoginOrRegister:(UIButton *)button {
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) {
        self.leftMargin.constant = 0;
        button.selected = NO;
    } else {
        self.leftMargin.constant =  - self.view.width;
        button.selected = YES;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

/**
 *  状态栏的样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    // 白色状态栏
    return UIStatusBarStyleLightContent;
}

/**
 *  点击界面收起键盘
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    
    // 关闭弹框
    [SVProgressHUD dismiss];
    
    // 取消请求
    [self.manager invalidateSessionCancelingTasks:YES]; // 直接弄死Seesion, 取消所有任务
    
}

- (IBAction)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginToServer {
    
    [self.view endEditing:YES];
    // 弹窗，提示正在加载
    [SVProgressHUD show];
    
    // 0.获取输入表单内容
    _loginPhone = self.loginPhoneTextField.text;
    _loginPassword = self.loginPasswordTextField.text;
    
    // ZXWeakSelf;
    // 1.创建网络管理者
    //AFHTTPSessionManager 基于NSURLSession
    // AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.利用网络管理者发送post请求
    NSDictionary *parameters = @{
                                 @"username":_loginPhone,
                                 @"pwd":_loginPassword
                                 };
    // http://120.25.226.186:32812/login?username=520it&pwd=520it
    [self.manager POST:@"http://account.calvin.wifi.gift/api/v1/user/login" parameters:parameters success:^ void(NSURLSessionDataTask * task, id responseObject) {
        // 关闭弹框
        [SVProgressHUD dismiss];
        NSLog(@"请求成功 %@", [responseObject class]);
    } failure:^ void(NSURLSessionDataTask * operation, NSError * error) {
        NSLog(@"请求失败 %@", error);
        [SVProgressHUD showErrorWithStatus:@"登录失败"];
    }];
}

- (void)dealloc {
    // 关闭弹框
    [SVProgressHUD dismiss];
    
    // 取消请求
    [self.manager invalidateSessionCancelingTasks:YES]; // 直接弄死Seesion, 取消所有任务
}

@end
