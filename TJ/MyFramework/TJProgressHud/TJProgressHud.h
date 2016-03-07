//
//  TJProgressHud.h
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>

@interface TJProgressHud : NSObject

+ (void)showProgressView:(NSString*)titile;
+ (void)showProgressView:(NSString*)titile withStatus:(SVProgressHUDMaskType)maskType;
+ (void)removeSVProgress;

@end
