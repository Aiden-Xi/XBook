//
//  NSString+ReplaceCode.h
//  YaoYD_New
//
//  Created by Tianjian on 15/11/30.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ReplaceCode)

/**
 使用方法：
 charCode 需要替代的字符
 index = 3 起始位置
 toIndex = 4 结束位置
 如：15270554147 --> 152****4147
 */
+ (NSMutableString*)efSetWithString:(NSString *)content relplaceCharacter:(NSString*)charCode fromIndex:(NSInteger)index toIndex:(NSInteger)toIndex;

@end
