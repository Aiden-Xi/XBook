//
//  UITextField+Code.h
//  YaoYD
//
//  Created by Tianjian on 16/1/7.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Code)

/**
 *  限制输入的小数点位数
 *
 *  @param codeLengh 小数点位数
 *  @param range     range
 *  @param string    string
 *
 *  @return YES or NO
 */
- (BOOL)textFieldWithCodeLeng:(NSInteger)codeLengh shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;


/**
 *  限制输入数字位数
 *
 *  @param numberLengh 数字长度
 *  @param range     range
 *  @param string    string
 *
 *  @return YES or No
 */
- (BOOL)textFieldWithNumberLeng:(NSInteger)numberLengh shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
