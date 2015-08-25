//
//  ZXClearCacheCell.m
//  百思不得姐
//
//  Created by Xiang on 15/8/25.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXClearCacheCell.h"

@interface ZXClearCacheCell()

/** 圈圈 */
@property (nonatomic, weak) UIActivityIndicatorView *loadingView;

@end

@implementation ZXClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加圈圈
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        [self.contentView addSubview:loadingView];
        self.loadingView = loadingView;
        
        // 设置文字
        self.textLabel.text = @"清除缓存";
        
        // 设置箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // 获得缓存大小
        [self getCacheSize];
    }
    return self;
}

- (void)getCacheSize {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // SDWebImage缓存路径
        NSString *fileSize = [caches stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"].fileSizeString;
        NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", fileSize];
        //        if (fileSize >= 1000 * 1000 * 1000) { // fileSize >= 1GB
        //            text = [NSString stringWithFormat:@"清除缓存(%.1fGB)", fileSize/(1000.0 * 1000.0 * 1000.0)];
        //        } else if (fileSize >= 1000 * 1000) { // 1GB > fileSize >= 1MB
        //            text = [NSString stringWithFormat:@"清除缓存(%.1fMB)", fileSize/(1000.0 * 1000.0)];
        //        } else if (fileSize >= 1000) { // 1MB > fileSize >= 1KB
        //            text = [NSString stringWithFormat:@"清除缓存(%.1fKB)", fileSize/ 1000.0];
        //        } else { // 1KB > fileSize
        //            text = [NSString stringWithFormat:@"清除缓存(%zdB)", fileSize];
        //        }
        
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            // 设置文字
            self.textLabel.text = text;
            // 删除圈圈
            [self.loadingView removeFromSuperview];
        });
    });
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 计算文字尺寸
    [self.textLabel sizeToFit];
    self.textLabel.height = self.contentView.height;
    
    self.loadingView.x = CGRectGetMaxX(self.textLabel.frame) + ZXMargin;
    self.loadingView.centerY = self.contentView.height * 0.5;
}

- (void)reset {
    self.textLabel.text = @"清除缓存(0B)";
}

@end
