//
//  IntegralAPI.h
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntegralAPI : NSObject

/**积分商城*/
+ (void)searchCouponShopWithPage:(NSInteger)page success:(void(^)(id reponse))success failure:(void(^)(id reponse))failure;

/**兑换记录*/
+ (void)searchCouponRecordsWithPage:(NSInteger)page success:(void (^)(id reponse))success failure:(void (^)(id reponse))failure;

@end
