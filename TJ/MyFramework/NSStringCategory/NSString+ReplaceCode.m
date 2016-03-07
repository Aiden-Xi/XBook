


//
//  NSString+ReplaceCode.m
//  YaoYD_New
//
//  Created by Tianjian on 15/11/30.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSString+ReplaceCode.h"
#import "UtilsMacro.h"

@implementation NSString (ReplaceCode)

+ (NSMutableString *)efSetWithString:(NSString *)content relplaceCharacter:(NSString *)charCode fromIndex:(NSInteger)index toIndex:(NSInteger)toIndex{
    NSMutableString *contentString = [[NSMutableString alloc] initWithString:content];
    NSString *codeString = charCode;
    for (int i = 0; i< toIndex - index; i++) {
        codeString = [codeString stringByAppendingString:charCode];
    }
    [contentString replaceCharactersInRange:NSMakeRange(index, toIndex - index + 1)  withString:codeString];
    return contentString;
}


@end
