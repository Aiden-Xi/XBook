//
//  DetailFirstCell.m
//  YaoYD
//
//  Created by Tianjian on 16/3/3.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "DetailFirstCell.h"

@interface DetailFirstCell ()

@property (weak, nonatomic) IBOutlet UILabel *evlblSportBean;

@property (weak, nonatomic) IBOutlet UILabel *evlblIntegral;

@property (weak, nonatomic) IBOutlet UILabel *evlblValidityDate;

@end

@implementation DetailFirstCell

- (void)setModel:(id)model{
    _evlblSportBean.text    = [NSString stringWithFormat:@"我要运动%.0d运动豆",rand()%11+1];
    _evlblIntegral.text     = [NSString stringWithFormat:@"%.0d",rand()%100+1];
    _evlblValidityDate.text = [NSString stringWithFormat:@"%@-%@",@"2015.11.12",@"2016.12.21"];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
