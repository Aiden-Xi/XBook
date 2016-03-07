
//
//  TJProgressHud.m
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "TJProgressHud.h"

@implementation TJProgressHud

+ (void)showProgressView:(NSString*)titile{
    [SVProgressHUD showWithStatus:titile maskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setAnimationDelay:1];
}
+ (void)showProgressView:(NSString*)titile withStatus:(SVProgressHUDMaskType)maskType{
    [SVProgressHUD showWithStatus:titile maskType:maskType];
}
+ (void)removeSVProgress{
    [SVProgressHUD dismiss];
}


@end
