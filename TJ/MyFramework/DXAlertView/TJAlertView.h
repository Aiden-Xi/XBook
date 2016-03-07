//
//  TJAlertView.h
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXAlertView.h"

typedef void (^evblcLeftOnClick)();
typedef void (^evblcRightOnClick)();

@interface TJAlertView : NSObject

+ (instancetype)shareConfiger;

- (void)alertWithTitle:(NSString*)title
               content:(NSString*)content
             leftTitle:(NSString *)leftTitle
            rightTitle:(NSString *)rigthTitle
             leftBlock:(evblcLeftOnClick)leftAction
            rightBlock:(evblcRightOnClick)rightAction;

+ (void)alertWithTitle:(NSString*)title
               content:(NSString*)content
             leftTitle:(NSString *)leftTitle
            rightTitle:(NSString *)rigthTitle
             leftBlock:(evblcLeftOnClick)leftAction
            rightBlock:(evblcRightOnClick)rightAction;


@end
