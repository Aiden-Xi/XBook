//
//  DetailHeaderCell.m
//  YaoYD
//
//  Created by Tianjian on 16/3/3.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "DetailHeaderCell.h"
#import "UIImageView+WebCache.h"
#import "ImageMacro.h"

@interface DetailHeaderCell ()

@property (weak, nonatomic) IBOutlet UIImageView *evimgHeader;

@end

@implementation DetailHeaderCell

- (void)awakeFromNib {
}

- (void)setImageUrl:(NSString *)imageUrl{
    [_evimgHeader sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:imageIconCoupoDetai]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
