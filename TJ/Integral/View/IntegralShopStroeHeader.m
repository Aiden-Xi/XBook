//
//  IntegralShopStroeHeader.m
//  YaoYD
//
//  Created by Tianjian on 16/3/3.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "IntegralShopStroeHeader.h"

@interface IntegralShopStroeHeader ()
@property (weak, nonatomic) IBOutlet UILabel *evlblNumberOfIntegral;

@end

@implementation IntegralShopStroeHeader

- (void)awakeFromNib {
}

- (void)setNumberOfIntegral:(NSString *)numberOfIntegral{
    NSString *mark = numberOfIntegral==nil?@"0 积分":[NSString stringWithFormat:@"%@ 积分",numberOfIntegral];
    
    NSRange range = [mark rangeOfString:@" 积分"];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:mark];
    [attrString setAttributes:@{NSForegroundColorAttributeName:color_NavBarBg} range:NSMakeRange(0, range.location)];
    _evlblNumberOfIntegral.attributedText = attrString;
}
- (IBAction)_efOnClickGotoRecords:(id)sender {
    NSLog(@"兑换记录");
    [TJNotificationCenter postNotificationName:kNotificationPushIntegralRecord object:nil];
}

@end
