//
//  TJDate.m
//  YaoYD
//
//  Created by 陈胜华 on 15/8/25.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import "TJDate.h"

@implementation TJDate
/*格式化日期描述*/
- (NSString *)formattedDateDescription
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    
    NSInteger timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
        return @"1分钟内";
    } else if (timeInterval < 3600) {//1小时内
        return [NSString stringWithFormat:@"%@分钟前", @(timeInterval / 60)];
    } else if (timeInterval < 21600) {//6小时内
        return [NSString stringWithFormat:@"%@小时前", @(timeInterval / 3600)];
    } else if ([theDay isEqualToString:currentDay]) {//当天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    } else {//以前
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [dateFormatter stringFromDate:self];
    }
}
@end
