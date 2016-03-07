//
//  PopAnimation.h
//  NatureProject
//
//  Created by Tianjian on 15/12/27.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopAnimation : NSObject

+ (void)showFromRect:(CGRect)fromRect toRect:(CGRect)toRect withView:(UIView*)conentView withBounciness:(CGFloat)bounciess withSpeed:(CGFloat)speed;
+ (void)hideFromRect:(CGRect)fromRect toRect:(CGRect)toRect withView:(UIView*)conentView withBounciness:(CGFloat)bounciess withSpeed:(CGFloat)speed;

@end
