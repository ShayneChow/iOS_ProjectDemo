//
//  UIImageView+XMGExtension.m
//  2期-百思不得姐
//
//  Created by apple on 15/8/16.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "UIImageView+XMGExtension.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (XMGExtension)
- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image circleImage];
    }];
}
@end
