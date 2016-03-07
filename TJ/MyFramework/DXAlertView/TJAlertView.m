//
//  TJAlertView.m
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "TJAlertView.h"

@implementation TJAlertView{
    DXAlertView *evAlert ;
}

+ (instancetype)shareConfiger{
    static TJAlertView *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[TJAlertView alloc] init];
    });
    return config;
}

- (void)alertWithTitle:(NSString*)title
               content:(NSString*)content
             leftTitle:(NSString *)leftTitle
            rightTitle:(NSString *)rigthTitle
             leftBlock:(evblcLeftOnClick)leftAction
            rightBlock:(evblcRightOnClick)rightAction;{
    if (evAlert == nil) {
        evAlert = [[DXAlertView alloc]initWithTitle:title contentText:content leftButtonTitle:leftTitle rightButtonTitle:rigthTitle];
    } else {
        [evAlert setLeftTitle:leftTitle];
        [evAlert setRightTitle:rigthTitle];
        [evAlert setTitle:title];
        [evAlert setContent:content];
    }
    evAlert.leftBlock = ^(){
        leftAction();
    };
    evAlert.rightBlock = ^(){
        rightAction();
    };
    [evAlert show];
}


+ (void)alertWithTitle:(NSString*)title
                 content:(NSString*)content
               leftTitle:(NSString *)leftTitle
              rightTitle:(NSString *)rigthTitle
               leftBlock:(evblcLeftOnClick)leftAction
              rightBlock:(evblcRightOnClick)rightAction;{
    DXAlertView *alertView = [[DXAlertView alloc]initWithTitle:title contentText:content leftButtonTitle:leftTitle rightButtonTitle:rigthTitle];
    alertView.leftBlock = ^(){
        leftAction();
    };
    alertView.rightBlock = ^(){
        rightAction();
    };
    [alertView show];
}


@end
