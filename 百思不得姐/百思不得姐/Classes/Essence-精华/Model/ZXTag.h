//
//  ZXTag.h
//  百思不得姐
//
//  Created by Xiang on 15/8/18.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXTag : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 名字 */
@property (nonatomic, copy) NSString *theme_name;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;

@end
