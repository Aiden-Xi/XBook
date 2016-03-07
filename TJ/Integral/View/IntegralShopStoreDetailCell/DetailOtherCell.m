//
//  DetailOtherCell.m
//  YaoYD
//
//  Created by Tianjian on 16/3/3.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "DetailOtherCell.h"

@interface DetailOtherCell ()

@property (weak, nonatomic) IBOutlet UILabel *evlblTitle;
@property (weak, nonatomic) IBOutlet UILabel *evlblContent;

@end

@implementation DetailOtherCell

- (void)setModel:(id)model{
    _evlblTitle.text   = model[@"title"];
    _evlblContent.text = model[@"content"];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
