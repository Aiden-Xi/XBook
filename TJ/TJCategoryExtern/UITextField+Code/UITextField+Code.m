//
//  UITextField+Code.m
//  YaoYD
//
//  Created by Tianjian on 16/1/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "UITextField+Code.h"

@implementation UITextField (Code)

- (BOOL)textFieldWithCodeLeng:(NSInteger)codeLengh shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    static BOOL isHaveDian = NO;
    if ([self.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([string length] > 0) {
        
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.') {//数据格式正确
            if([self.text length] == 0){//首字母不能为0和小数点
                if(single == '.') {//第一个数字不能为小数点
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
                if (single == '0') {//第一个数字不能为0
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }

            //输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian){//text中还没有小数点
                    isHaveDian = YES;
                    return YES;
                    
                } else {//已经输入过小数点了
                    [self.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            } else {
                if (isHaveDian) {//存在小数点
                    //判断小数点的位数
                    NSRange ran = [self.text rangeOfString:@"."];
                    if (range.location - ran.location <= codeLengh) {
                        return YES;
                    } else {//最多输入 codeLengt 位小数
                        return NO;
                    }
                } else {
                    return YES;
                }
            }
        } else {//输入的数据格式不正确
            [self.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    } else {
        return YES;
    }
}

- (BOOL)textFieldWithNumberLeng:(NSInteger)numberLengh shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *textString = [self.text stringByReplacingCharactersInRange:range withString:string];
    if (textString.length>numberLengh) {
        return NO;
    }
    return YES;
}

@end
