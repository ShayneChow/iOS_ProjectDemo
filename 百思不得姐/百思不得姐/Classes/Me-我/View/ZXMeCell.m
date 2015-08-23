//
//  ZXMeCell.m
//  百思不得姐
//
//  Created by Xiang on 15/8/23.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXMeCell.h"

@implementation ZXMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.textLabel.textColor = [UIColor grayColor];
        self.textLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    
    // 调整图片
    CGFloat imageWH = self.contentView.height - ZXMargin;
    self.imageView.width = imageWH;
    self.imageView.height = imageWH;
    self.imageView.centerY = self.contentView.height * 0.5;
    
    // 调整文字
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + ZXMargin;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
}

@end
