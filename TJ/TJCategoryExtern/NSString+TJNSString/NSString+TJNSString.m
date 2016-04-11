//
//  NSString+TJNSString.m
//  YaoYDCoach_Person
//
//  Created by 陈胜华 on 15/7/9.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import "NSString+TJNSString.h"

@implementation NSString (TJNSString)

/**
 *  获取系统时间
 *
 *  @return string
 */
+ (NSString*)systemTimeInfo
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//yyyy-MM-dd HH:mm:ss
    NSString *currentDateString = [dateFormatter stringFromDate:[NSDate date]];
    return currentDateString;
}

/*!
 @method
 @abstract   获取当前时间
 @discussion NSString 类别,获取当前时间格式化后数据
 @result     NSString  @"yyyy'-'MM'-'dd HH:mm:ss"
 */
+ (NSString*)getFormatTimeString{
    NSDate *timeNow = [NSDate date];
    NSDateFormatter *formmater = [[NSDateFormatter alloc]init];
    [formmater setLocale:[NSLocale currentLocale]];
    [formmater setDateFormat:@"yyyy'-'MM'-'dd HH:mm:ss"];
    NSString *timeStr = [formmater stringFromDate:timeNow];
    return timeStr;
}

/*!
 @method
 @abstract   获取当前日期
 @discussion NSString 类别,获取当前时间格式化后数据
 @result     NSString  @"yyyy'-'MM'-'dd "
 */
+ (NSString*)getFormatDateString{
    NSDate *timeNow = [NSDate date];
    NSDateFormatter *formmater = [[NSDateFormatter alloc]init];
    [formmater setLocale:[NSLocale currentLocale]];
    [formmater setDateFormat:@"yyyy'-'MM'-'dd"];
    NSString *timeStr = [formmater stringFromDate:timeNow];
    return timeStr;
}

/*!
 @method
 @abstract   获取当前时间戳
 @discussion NSString 类别,获取当前时间戳
 @result     NSString 当前时间戳带有小数点后6位数的字符串
 */
+ (NSString*)getFormatTimeStampString{
    
    NSDate *timeNow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%f",
                        [timeNow timeIntervalSince1970]];
    return timeSp;
}
+ (NSString*)createDataFromToday:(NSInteger)afertDate{
    NSTimeInterval a_day = 24*60*60*afertDate;
    NSDate *date = [NSDate date];
    NSDate *tomorrow = [date dateByAddingTimeInterval:a_day];//[date addTimeInterval:a_day];
    NSDateFormatter *formmater = [[NSDateFormatter alloc]init];
    [formmater setDateFormat:@"yyyy'-'MM'-'dd"];
    return [formmater stringFromDate:tomorrow];
}

/**
 2014-01-08T21:21:22.737+05:30 时间相减
 */
+ (CGFloat)changeOneTimeSubEndTime:(NSString*)endTime {
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSString *currentTimeString = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentTimeString];
    NSDate *endTime_   = [dateFormatter dateFromString:endTime];
    NSTimeInterval second = [endTime_ timeIntervalSinceDate:currentDate];
    return second;
}

/**
 2014-01-08T21:21:22.737+05:30 转成2014-01-08
 */
+ (NSString*)changeDateString:(NSString*)dateString{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSDate *currentDate = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:currentDate];
}

+ (NSString*)changeDateToFormat:(NSString*)dataFormat date:(NSString*)date{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSDate *currentDate = [dateFormatter dateFromString:date];
    [dateFormatter setDateFormat:dataFormat];
    if (dataFormat == nil||dataFormat.length == 0) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return [dateFormatter stringFromDate:currentDate];
}

/**
 将 2015-09-12 转成 周六
 */
+ (NSString*)changeToWeekDayFromStringDate:(NSString*)dateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT", nil];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:NSLocalizedString(@"eee", nil)];
    //[dateFormatter setDateFormat:NSLocalizedString(@"YYYY.MM.dd.eee", nil)];
    [dateFormatter setShortWeekdaySymbols:weekdayAry];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    
    NSString *strWeekDay = [dateFormatter stringFromDate:date];
    
    if ([strWeekDay isEqualToString:@"SUN"]) {
        return @"周日";
    } else if ([strWeekDay isEqualToString:@"MON"]){
        return @"周一";
    } else if ([strWeekDay isEqualToString:@"TUE"]){
        return @"周二";
    } else if ([strWeekDay isEqualToString:@"WED"]){
        return @"周三";
    } else if ([strWeekDay isEqualToString:@"THU"]){
        return @"周四";
    } else if ([strWeekDay isEqualToString:@"FRI"]){
        return @"周五";
    } else{
        return @"周六";
    }
}
/**
 将 2015-09-12 转成 星期六
 */
+ (NSString*)changeToWeekDayFromStringDate_:(NSString*)dateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT", nil];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:NSLocalizedString(@"eee", nil)];
    //[dateFormatter setDateFormat:NSLocalizedString(@"YYYY.MM.dd.eee", nil)];
    [dateFormatter setShortWeekdaySymbols:weekdayAry];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    
    NSString *strWeekDay = [dateFormatter stringFromDate:date];
    
    if ([strWeekDay isEqualToString:@"SUN"]) {
        return @"星期天";
    } else if ([strWeekDay isEqualToString:@"MON"]){
        return @"星期一";
    } else if ([strWeekDay isEqualToString:@"TUE"]){
        return @"星期二";
    } else if ([strWeekDay isEqualToString:@"WED"]){
        return @"星期三";
    } else if ([strWeekDay isEqualToString:@"THU"]){
        return @"星期四";
    } else if ([strWeekDay isEqualToString:@"FRI"]){
        return @"星期五";
    } else{
        return @"星期六";
    }
}
/**将2015-09-12 转成 09/12 */
+ (NSString*)changeToFormatterFromStringDate:(NSString*)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
/**将2015-09-12 转成 09月12日 */
+ (NSString*)changeToFormatterFromStringDate_:(NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;

}
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//邮箱
+ (BOOL)validateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile{
    /*
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];*/
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    //NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    //NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    //NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    //NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    //NSString *CT_17 = @"^1(7[0-9])\\d{8}$";
    
    NSString *CT_1_ = @"^1([0-9])\\d{9}$";
    
    //NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    //NSPredicate *regextestct_17 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_17];
    NSPredicate *regextestct_1_ = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_1_];
    
    /**
     ([regextestmobile evaluateWithObject:mobile] == YES)
     || ([regextestcm evaluateWithObject:mobile] == YES)
     || ([regextestct evaluateWithObject:mobile] == YES)
     || ([regextestcu evaluateWithObject:mobile] == YES)
     || ([regextestct_17 evaluateWithObject:mobile]== YES)
     ||
     */
    if (([regextestct_1_ evaluateWithObject:mobile] == YES)){
        return YES;
    } else{
        return NO;
    }
}


//车牌号验证
+ (BOOL)validateCarNo:(NSString *)carNo{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


//车型
+ (BOOL)validateCarType:(NSString *)CarType{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}


//用户名
+ (BOOL)validateUserName:(NSString *)name{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


//密码
+ (BOOL)validatePassword:(NSString *)passWord{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//昵称
+ (BOOL)validateNickname:(NSString *)nickname{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}


//身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}



@end
