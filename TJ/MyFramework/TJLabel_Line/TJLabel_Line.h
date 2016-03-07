//
//  TJLabel_Line.h
//  YaoYD
//
//  Created by 陈胜华 on 15/7/20.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LineType) {
    LineTypeNone,//没有画线
    LineTypeUp ,// 上边画线
    LineTypeMiddle,//中间画线
    LineTypeDown,//下边画线
};


@interface TJLabel_Line : UILabel

@property (assign, nonatomic) LineType lineType;
@property (assign, nonatomic) UIColor * lineColor;

@end
