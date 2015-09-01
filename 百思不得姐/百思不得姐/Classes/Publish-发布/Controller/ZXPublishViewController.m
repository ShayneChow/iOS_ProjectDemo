//
//  ZXPublishViewController.m
//  百思不得姐
//
//  Created by Xiang on 15/8/27.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXPublishViewController.h"
#import "ZXPublishButton.h"
#import <POP.h>

@interface ZXPublishViewController ()

/** 标语 */
@property (nonatomic, weak) UIImageView *sloganView;
/** 按钮 */
@property (nonatomic, strong) NSMutableArray *buttons;
/** 动画时间 */
@property (nonatomic, strong) NSArray *times;

@end

@implementation ZXPublishViewController

/** 动画的弹性因素 */
static CGFloat const ZXSpringFactor = 10;
/** 每个动画之间的时间间隔 */
static CGFloat const ZXAnimationDelay = 0.1;

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSArray *)times {
    if (!_times) {
        _times = @[@(ZXAnimationDelay * 5),
                   @(ZXAnimationDelay * 3),
                   @(ZXAnimationDelay * 4),
                   @(ZXAnimationDelay * 2),
                   @(ZXAnimationDelay * 0),
                   @(ZXAnimationDelay * 1),
                   @(ZXAnimationDelay * 6)];
    }
    return _times;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加标语
    [self setupSlogan];
    
    // 添加按钮
    [self setupButton];
}

- (void)setupSlogan {
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    sloganView.centerX = ZXScreenW * 0.5;
    sloganView.y = ZXScreenH;
    [self.view addSubview:sloganView];
    self.sloganView = sloganView;
    
    // 添加动画
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(ZXScreenH * 0.15);
    // 设置弹性参数
    anim.springBounciness = ZXSpringFactor;
    anim.springSpeed = ZXSpringFactor;
    // 设置时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        // 恢复点击
        self.view.userInteractionEnabled = YES;
    }];
    [sloganView.layer pop_addAnimation:anim forKey:nil];
}

- (void)setupButton {
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    // 添加所有的按钮
    int totalColsCount = 3; // 一共有3列
    CGFloat buttonW = ZXScreenW / totalColsCount;
    CGFloat buttonH = buttonW;
    NSUInteger rows = (images.count + totalColsCount - 1) / totalColsCount;
    CGFloat buttonStarY = (ZXScreenH - rows * buttonH) * 0.5;
    for (int i = 0; i < images.count; i++) {
        ZXPublishButton *button = [[ZXPublishButton alloc] init];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [self.buttons addObject:button];
        
        // 设置数据
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        
        // 动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        // 设置frame值
        CGFloat buttonX = (i % totalColsCount) * buttonW;
        CGFloat buttonY = buttonStarY + (i / totalColsCount) * buttonH;
        CGFloat buttonFromY = buttonY - ZXScreenH;
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonFromY, buttonW, buttonH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        // 设置时间(CACurrentMediaTime()当前时间)
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        // 设置弹性参数
        anim.springBounciness = ZXSpringFactor;
        anim.springSpeed = ZXSpringFactor;
        [button pop_addAnimation:anim forKey:nil];
    }
}

- (IBAction)cancelButtonClick {
    [self closeWithTask:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self closeWithTask:nil];
}

/**
 *  关闭界面
 *
 *  @param task 关闭界面想做的事情
 */
- (void)closeWithTask:(void (^)())task {
    // 禁止点击
    self.view.userInteractionEnabled = NO;
    
    // 按钮动画
    for (int i = 0; i < self.buttons.count; i++) {
        ZXPublishButton *button = self.buttons[i];
        
        // 动画
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anim.toValue = @(ZXScreenH + button.height);
        // 设置时间(CACurrentMediaTime()当前时间)
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [button.layer pop_addAnimation:anim forKey:nil];
    }
    
    // slogan动画
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(ZXScreenH + self.sloganView.height);
    // 设置时间(CACurrentMediaTime()当前时间)
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        // 关闭控制器
        [self dismissViewControllerAnimated:NO completion:nil];
        
        // 执行一段动画完毕后的代码
        !task ? : task();
        
        //        if (task) task();
        
        //        if (task) {
        //            task();
        //        }
    }];
    [self.sloganView.layer pop_addAnimation:anim forKey:nil];
}

/**
 *  中间的按钮点击
 */
- (void)buttonClick:(ZXPublishButton *)button
{
    [self closeWithTask:^{
        if (button.tag == 2) { // 发段子
            UIViewController *temp = [[UIViewController alloc] init];
            temp.view.backgroundColor = ZXRandomColor;
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:temp animated:YES completion:nil];
        } else {
            ZXLog(@"点击了：%@", button.currentTitle);
        }
    }];
}

@end
