//
//  NSString+ZXFileSize.h
//  百思不得姐
//
//  Created by Xiang on 15/8/26.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZXFileSize)

- (NSInteger)fileSize;
/**
 *  获得文件大小（18.7GB\10.9MB）
 *
 *  @return 获得字符串形式的文件大小
 */
- (NSString *)fileSizeString;

@end
