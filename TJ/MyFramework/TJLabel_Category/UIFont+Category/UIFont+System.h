//
//  UIFont+System.h
//  Test
//
//  Created by Tianjian on 15/12/25.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FontType_Regular,
    FontType_Light,
    FontType_Thin,
    FontType_UltraLight,
    FontType_Medium,
    FontType_SemiBold,
    FontType_Bold
} FontType;

@interface UIFont (System)

/**
 *  UIFont 设置字体
 *
 *  @param type 字体类型
 *  @param size 字体大小
 *
 *  @return UIFont对象
 */
+ (nullable UIFont*)systemFontWithType:(FontType)type size:(CGFloat)size;

@end
