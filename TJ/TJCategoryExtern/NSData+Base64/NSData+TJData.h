//
//  NSData+TJData.h
//  YaoYD
//
//  Created by 陈胜华 on 15/7/10.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (TJData)

/**
 *  将NSString装换成 图片
 *
 *  @param imageStr 图片转换的字符串
 *
 *  @return image
 */
+ (UIImage*) stringToImage:(NSString*)imageStr;
/**
 *  将 图片 转换成 NSString
 *
 *  @param image image
 *
 *  @return imgeString
 */
+ (NSString*)imageToString:(UIImage*)image;
/**
 *  将 URL 转成 NSString
 *
 *  @param url url
 *
 *  @return str
 */
+ (NSString*)stringFromUrl:(NSURL*)url;
/**
 *  将 NSString 转成 url
 *
 *  @param string str
 *
 *  @return url
 */
+ (NSURL*)urlFromString:(NSString*)string;
/**
 *  计算UILabel的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return UILabel高度
 */
+ (CGFloat)calculateContentLabelHeight:(NSString *)text withFont:(UIFont *)font withWidth:(CGFloat)width;
/**
 *  替换字符串
 *
 *  @param charStr    如：*  号
 *  @param indexStart 开始位置
 *  @param indexEnd   结束位置
 *
 *  @return
 */
+ (NSString*)string:(NSString*)nomarlStr
        replaceWith:(NSString*)charStr
          FromIndex:(NSInteger)indexStart
            ToIndex:(NSInteger)indexEnd;

@end
