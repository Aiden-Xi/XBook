//
//  IntegralShopStroeCell.m
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "IntegralShopStroeCell.h"
#import "UIView+TJUIView.h"
#import "ImageMacro.h"
#import "UIImageView+WebCache.h"

@interface IntegralShopStroeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *evimgHeader;
@property (weak, nonatomic) IBOutlet UILabel *evlblPrice;   //$ 50
@property (weak, nonatomic) IBOutlet UILabel *evlblTitle;   //我要运动1000运动豆
@property (weak, nonatomic) IBOutlet UILabel *evlblIntegral;//300积分



@end

@implementation IntegralShopStroeCell

- (void)awakeFromNib {

}

- (void)setModel:(id)model{
    NSString *mark = [NSString stringWithFormat:@"¥ %.0ld",random()%100+1];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:mark];
    [attrString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} range:NSMakeRange(0, 2)];
    

    _evlblTitle.text           = [NSString stringWithFormat:@"我要运动%.0ld运动豆",random()%100];
    _evlblIntegral.text        = [NSString stringWithFormat:@"%.0ld",random()%50];
    _evlblPrice.attributedText = attrString;
    [_evimgHeader sd_setImageWithURL:[NSURL URLWithString:@""]
                    placeholderImage:[UIImage imageNamed:imageIconGoupon]];
}

@end
