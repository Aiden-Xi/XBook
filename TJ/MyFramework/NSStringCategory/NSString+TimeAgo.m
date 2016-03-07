//
//  NSString+TimeAgo.m
//  NatureProject
//
//  Created by Tianjian on 15/12/17.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSString+TimeAgo.h"

@implementation NSString (TimeAgo)


+ (NSString*)efFormatterSecondTimes:(NSString*)dateString{
    NSDate *currentDateTimes = [self _efFormartSystemTime:dateString];
    NSDate *currentSystemDate= [self _efCurrentSystemTimes];
    
    NSTimeInterval timeDev = [currentSystemDate timeIntervalSince1970] - [currentDateTimes timeIntervalSince1970];
    /**
     1~59分钟   显示 xx分钟前   timeDev < 60*60
     1～24小时  显示 xx小时前   timeDev >=60*60 && timeDev<24*60*60
     24～48小时  显示 昨天      timeDev >= 24*60*60 && timeDev < 48*60*60
     48～64小时  显示 前天      timeDev >= 48*60*60 && timeDev < 64*60*60
     大于64小时 显示  2015/12/13 timeDev>= 64*60*60
     
     */
    if (timeDev < 60*60) {
        return [NSString stringWithFormat:@"%.0f分钟前",timeDev/60];
    } else if (timeDev >=60*60 && timeDev<24*60*60) {
        return [NSString stringWithFormat:@"%.0f小时前",timeDev/(60*60)];
    } else if (timeDev >= 24*60*60 && timeDev < 48*60*60){
        return @"昨天";
    } else if (timeDev >= 48*60*60 && timeDev < 64*60*60){
        return @"前天";
    } else {
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:@"yyyy/MM/dd"];
        return [dataFormatter stringFromDate:currentDateTimes];
    }
    return nil;
}

+ (NSDate*)_efFormartSystemTime:(NSString*)dateString{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSDate *currentDate = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd mm:HH:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:currentDate];
    return [dateFormatter dateFromString:dateStr];
}

+ (NSDate*)_efCurrentSystemTimes{
    NSDate *currentSystemDate = [NSDate date];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd mm:HH:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:currentSystemDate];
    return [dateFormatter dateFromString:dateStr];
}

@end
