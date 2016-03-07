//
//  NSString+TJNSString.h
//  YaoYDCoach_Person
//
//  Created by 陈胜华 on 15/7/9.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const Date_Format_YYYY_MM_HH_MM_SS       = @"yyyy-MM-dd HH:mm:ss"    ;  //e.g. 1990-07-24 15:23:10
static NSString *const Date_Format_YYYY_MM_DD             = @"yyyy-MM-dd"             ;  //e.g. 1990-07-24
static NSString *const Date_Format_DD_MM_YYYY             = @"dd-MM-yyyy"             ;  //e.g. 24-07-1990
static NSString *const Date_Format_DD_MMM_YYYY            = @"dd-MMM-yyyy"            ;  //e.g. 24-Jul-1990
static NSString *const Date_Format_DD_MM_YYYY_HH_MM_12H   = @"dd-MM-yyyy hh:mm a"     ;  //e.g. 24-07-1990 05:20 AM
static NSString *const Date_Format_DD_MM_YYYY_HH_MM_SS    = @"dd-MM-yyyy HH:mm:ss"    ;  //e.g. 24-07-1990 15:20
static NSString *const Date_Format_DD_MM_YYYY_HH_MM_SS_12H= @"dd-MM-yyyy hh:mm:ss a"  ;  //e.g. 24-07-1990 05:20 AM

static NSString *const Date_Format_MM_DD_YYYY             = @"MM-dd-yyyy"             ;  //e.g. 07-24-1990
static NSString *const Date_Format_MMM_DD_YYYY            = @"MMM dd, yyyy"           ;  //e.g. Jul 24, 1990
static NSString *const Date_Format_MMMM_DD                = @"MMMM dd"                ;  //e.g. July 24
static NSString *const Date_Format_MMMM                   = @"MMMM"                   ;  //e.g. July, November
static NSString *const Date_Format_MMM_DD_YYYY_HH_MM_SS   = @"MMM dd, yyyy hh:mm:ss a";  //e.g. Jul 24, 2014 05:20:50 AM
static NSString *const Date_Format_MMM_DD_YYYY_HH_MM_12H  = @"MMM dd, yyyy hh:mm a"   ;   //e.g. Jul 24, 2014 05:20 AM
static NSString *const Date_Format_MMM_DD                 = @"MM-dd"                  ;   //e.g. 02-22

static NSString *const Date_Format_HH_MM_SS               = @"HH:mm:ss"               ;  //e.g. 15:20:50
static NSString *const Date_Format_E                      = @"E"                      ;  //e.g. Tue
static NSString *const Date_Format_EEEE                   = @"EEEE"                   ;  //e.g. Tuesday

static NSString *const Date_Format_QQQ                    = @"QQQ"                    ;  //e.g. Q1,Q2,Q3,Q4
static NSString *const Date_Format_QQQQ                   = @"QQQQ"                   ;  //e.g. 4th quarter

@interface NSString (TJNSString)
/**
 *  获取系统时间
 *
 *  @return string
 */
+ (NSString*)systemTimeInfo;

/*!
 @method
 @abstract   获取当前时间
 @discussion NSString 类别,获取当前时间格式化后数据
 @result     NSString  @"yyyy'-'MM'-'dd HH:mm:ss"
 */
+ (NSString*)getFormatTimeString;

/*!
 @method
 @abstract   获取当前日期
 @discussion NSString 类别,获取当前时间格式化后数据
 @result     NSString  @"yyyy'-'MM'-'dd "
 */
+ (NSString*)getFormatDateString;

/*!
 @method
 @abstract   获取当前时间戳
 @discussion NSString 类别,获取当前时间戳
 @result     NSString 当前时间戳带有小数点后6位数的字符串
 */
+ (NSString*)getFormatTimeStampString;
/*!
 @method
 @abstract   创建当前系统时间之后的时间
 @discussion afertDate 2015-XX-XX  => 2015-XX+(afertDate)-XX
 @result     NSString  @"yyyy'-'MM'-'dd "
 */
+ (NSString*)createDataFromToday:(NSInteger)afertDate;
/**
 2014-01-08T21:21:22.737+05:30 时间相减
 */
+ (CGFloat)changeOneTimeSubEndTime:(NSString*)endTime;
/**
 2014-01-08T21:21:22.737+05:30 转成2014-01-08
 */
+ (NSString*)changeDateString:(NSString*)dateString;
/**
 2014-01-08T21:21:22.737+05:30 转成指定格式
 */
+ (NSString*)changeDateToFormat:(NSString*)dataFormat date:(NSString*)date;
/**将 2015-09-12 转成 周六*/
+ (NSString*)changeToWeekDayFromStringDate:(NSString*)dateString;
/**将 2015-09-12 转成 星期六*/
+ (NSString*)changeToWeekDayFromStringDate_:(NSString*)dateString;
/**将2015-09-12 转成 09/12 */
+ (NSString*)changeToFormatterFromStringDate:(NSString*)dateString;
/**将2015-09-12 转成 09月12日 */
+ (NSString*)changeToFormatterFromStringDate_:(NSString *)dateString;

/**
 *  判断字符串是否未nil Null [NSNull class]
 *
 *  @param string string
 *
 *  @return YES or NO
 */
+ (BOOL)isBlankString:(NSString *)string;
//=======================================================//
/**邮箱*/
+ (BOOL)validateEmail:(NSString *)email;
/**手机号码验证*/
+ (BOOL)validateMobile:(NSString *)mobile;
/**车牌号验证*/
+ (BOOL)validateCarNo:(NSString *)carNo;
/**车型*/
+ (BOOL)validateCarType:(NSString *)CarType;
/**用户名*/
+ (BOOL)validateUserName:(NSString *)name;
/**密码*/
+ (BOOL)validatePassword:(NSString *)passWord;
/**昵称*/
+ (BOOL)validateNickname:(NSString *)nickname;
/**身份证号*/
+ (BOOL)validateIdentityCard: (NSString *)identityCard;
//=======================================================//
@end
