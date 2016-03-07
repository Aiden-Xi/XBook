//
//  PopAnimation.m
//  NatureProject
//
//  Created by Tianjian on 15/12/27.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "PopAnimation.h"
#import <POP.h>

@implementation PopAnimation

+ (void)showFromRect:(CGRect)fromRect toRect:(CGRect)toRect withView:(UIView*)conentView withBounciness:(CGFloat)bounciess withSpeed:(CGFloat)speed{
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:fromRect];
    positionAnimation.toValue = [NSValue valueWithCGRect:toRect];
    positionAnimation.springBounciness = bounciess;
    positionAnimation.springSpeed = speed;
    [conentView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
}
+ (void)hideFromRect:(CGRect)fromRect toRect:(CGRect)toRect withView:(UIView*)conentView withBounciness:(CGFloat)bounciess withSpeed:(CGFloat)speed{
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:fromRect];
    positionAnimation.toValue = [NSValue valueWithCGRect:toRect];
    [conentView pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
}

@end
