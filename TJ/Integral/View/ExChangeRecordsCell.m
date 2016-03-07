//
//  ExChangeRecordsCell.m
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "ExChangeRecordsCell.h"

@interface ExChangeRecordsCell ()

@property (weak, nonatomic) IBOutlet UIView *evSubContent;
@property (weak, nonatomic) IBOutlet UIImageView *evimgLeft;
@property (weak, nonatomic) IBOutlet UILabel *evlblCouponValue;
@property (weak, nonatomic) IBOutlet UILabel *evlblIntegralValue;
@property (weak, nonatomic) IBOutlet UILabel *evlblOrderStatus;
@property (weak, nonatomic) IBOutlet UILabel *evlblSuccessData;
@property (weak, nonatomic) IBOutlet UILabel *evlblPrice;

@end

@implementation ExChangeRecordsCell

- (void)awakeFromNib {
    [_evSubContent setCornerWidthRadius:0 borderWidth:1 borderColor:color_Line];
}

- (void)setModel:(id)model{
    NSString *mark = [NSString stringWithFormat:@"¥%.0ld",random()%100+1];
    NSMutableAttributedString *attribtString = [[NSMutableAttributedString alloc]initWithString:mark];
    [attribtString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange(0, 1)];
    _evlblPrice.attributedText = attribtString;
    
    _evlblCouponValue.text   = [NSString stringWithFormat:@"%.0ld元优惠劵",random()%100+1];;
    _evlblIntegralValue.text = [NSString stringWithFormat:@"%.0ld",random()%100];
    
    NSInteger orderStatus = rand()%2;
    _evlblOrderStatus.text      = orderStatus?@"兑换成功":@"兑换失败";
    _evlblOrderStatus.textColor = orderStatus?HEX_RGB(0x219725):HEX_RGB(0xbd1e1e);
    _evlblSuccessData.text      = @"2016.02.04";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
