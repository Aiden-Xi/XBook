//
//  OrderIntegralCell.m
//  YaoYD
//
//  Created by Tianjian on 16/2/24.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "OrderIntegralCell.h"
#import "NSString+TJNSString.h"
#import "ImageMacro.h"
#import "UIImageView+WebCache.h"

@interface OrderIntegralCell ()
@property (weak, nonatomic) IBOutlet UIImageView *evimgHeader;
@property (weak, nonatomic) IBOutlet UILabel     *evlblName;
@property (weak, nonatomic) IBOutlet UILabel     *evlblSport;
@property (weak, nonatomic) IBOutlet UILabel     *evlblAddress;
@property (weak, nonatomic) IBOutlet UILabel     *evlblDate;
@property (weak, nonatomic) IBOutlet UILabel     *evlblAddMark;

@end

@implementation OrderIntegralCell

- (void)setModel:(OrdersIntegralSingleDTO *)model{
    _evlblName.text    = IsStrEmptyReplaceValue(model.stadium_name,@" ");
    _evlblSport.text   = IsStrEmptyReplaceValue(model.category_name,@" ");
    _evlblAddress.text = IsStrEmptyReplaceValue(model.stadium_address,@" ");
    _evlblAddMark.text = [NSString stringWithFormat:@"+%@",IsStrEmptyReplaceValue(model.integral, @"0")];
    _evlblDate.text    = [NSString changeDateToFormat:Date_Format_MMM_DD date:model.activity_time];
    [_evimgHeader  sd_setImageWithURL:[NSURL URLWithString:model.stadium_img]
                     placeholderImage:[UIImage imageNamed:imageIconStidumBig]];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
