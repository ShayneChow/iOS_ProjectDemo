//
//  UIBarButtonItem+XMGExtension.h
//  2期-百思不得姐
//
//  Created by apple on 15/8/15.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XMGExtension)
+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
