//
//  UIFont+System.m
//  Test
//
//  Created by Tianjian on 15/12/25.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "UIFont+System.h"

NSString * const FontTypeNameRegular    = @"AppleSDGothicNeo-Regular";
NSString * const FontTypeNameLight      = @"AppleSDGothicNeo-Light";
NSString * const FontTypeNameThin       = @"AppleSDGothicNeo-Thin";
NSString * const FontTypeNameBord       = @"AppleSDGothicNeo-Bold";
NSString * const FontTypeNameUltraLight = @"AppleSDGothicNeo-UltraLight";
NSString * const FontTypeNameMedium     = @"AppleSDGothicNeo-Medium";
NSString * const FontTypeNameSemiBold   = @"AppleSDGothicNeo-Bold";

@implementation UIFont (System)

+ (nullable UIFont*)systemFontWithType:(FontType)type size:(CGFloat)size{
    switch (type) {
        case FontType_Regular:
            return [UIFont fontWithName:FontTypeNameRegular size:size];
            break;
        case FontType_Light:
            return [UIFont fontWithName:FontTypeNameLight   size:size];
            break;
        case FontType_Thin:
            return [UIFont fontWithName:FontTypeNameThin    size:size];
            break;
        case FontType_Bold:
            return [UIFont fontWithName:FontTypeNameBord    size:size];
            break;
        case FontType_Medium:
            return [UIFont fontWithName:FontTypeNameMedium  size:size];
            break;
        case FontType_UltraLight:
            return [UIFont fontWithName:FontTypeNameUltraLight size:size];
            break;
        case FontType_SemiBold:
            return [UIFont fontWithName:FontTypeNameSemiBold size:size];
            break;
        default:
            return [UIFont fontWithName:FontTypeNameRegular  size:size];
            break;
    }
    
    return [UIFont fontWithName:FontTypeNameRegular size:size];
}

@end
