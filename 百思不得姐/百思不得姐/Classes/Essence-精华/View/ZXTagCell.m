//
//  ZXTagCell.m
//  百思不得姐
//
//  Created by Xiang on 15/8/18.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXTagCell.h"
#import "ZXTag.h"
#import "UIImageView+WebCache.h"

@interface ZXTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageListView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation ZXTagCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  重写setFrame:方法的目的 : 拦截设置cell的frame的过程
 */
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    //    frame.origin.x = 10;
    //    frame.size.width -= 20;
    
    [super setFrame:frame];
}

- (void)setTagModel:(ZXTag *)tagModel {
    _tagModel = tagModel;
    
    self.themeNameLabel.text = tagModel.theme_name;
    if (tagModel.sub_number < 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅", tagModel.sub_number];
    } else {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅", tagModel.sub_number / 10000.0];
    }
    // 设置头像
    [self.imageListView setHeader:tagModel.image_list];
}

@end
