//
//  TJTextView.h
//  YaoYD
//
//  Created by 陈胜华 on 15/8/31.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJTextView : UITextView{
    NSString *placeholder;
    UIColor *placeholderColor;
@private
    UILabel *placeHolderLabel;
}
@property(nonatomic, retain) UILabel *placeHolderLabel;

@property(nonatomic, retain) NSString *placeholder;

@property(nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
