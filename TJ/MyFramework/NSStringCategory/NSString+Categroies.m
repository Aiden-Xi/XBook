
//
//  NSString+Categroies.m
//  YaoYD
//
//  Created by Tianjian on 15/9/30.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSString+Categroies.h"

@implementation NSString (Categroies)

/**调用系统电话*/
+ (void)openSystemTelPhoneNumber:(NSString*)telPhoneNumber{
    NSString *urlStr=[NSString stringWithFormat:@"tel://%@",telPhoneNumber];//这种方式会直接拨打电话
    //NSString *url=[NSString stringWithFormat:@"telprompt://%@",self.mobile];//这种方式会提示用户确认是否拨打电话
    NSURL *url=[NSURL URLWithString:urlStr];
    UIApplication *application=[UIApplication sharedApplication];
    if(![application canOpenURL:url]){
        NSLog(@"无法打开\"%@\"，请确保此应用已经正确安装.",url);
        return;
    }
    [[UIApplication sharedApplication] openURL:url];
}

/**
 *  有限宽度计算文本高度
 *
 *  @param font   字体
 *  @param height 宽度
 *
 *  @return 高度
 */

+ (CGFloat)heightWithContent:(NSString*)text Font:(UIFont*)font forWidth:(CGFloat)width{
    CGSize contentSize;
    contentSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:
                   NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil].size;
    return contentSize.height;
}

/**
 *  有限高度计算文本宽度
 *
 *  @param font   字体
 *  @param height 高度
 *
 *  @return 宽度
 */
/*
+ (CGFloat)efWidthWithFont:(UIFont*)font forHeight:(CGFloat)height;{
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        
        return [self boundingRectWithSize:CGSizeMake(NSIntegerMax, height)
                                  options:NSStringDrawingTruncatesLastVisibleLine|
                NSStringDrawingUsesLineFragmentOrigin|
                NSStringDrawingUsesFontLeading
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size.width;
    }
    return [self sizeWithFont:font constrainedToSize:CGSizeMake(NSIntegerMax, height)].width;
}*/

@end
