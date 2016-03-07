//
//  IntegralService.h
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntegralService : NSObject

/**积分商城*/
+ (void)searchCouponShopWithPage:(NSInteger)page complete:(void(^)(BOOL success,id model))completeBlock;

/**兑换记录*/
+ (void)searchCouponRecordsWithPage:(NSInteger)page complete:(void(^)(BOOL success,id model))completeBlock;

@end
