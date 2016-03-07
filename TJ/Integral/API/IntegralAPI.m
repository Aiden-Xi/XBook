//
//  IntegralAPI.m
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "IntegralAPI.h"
#import <AFNetworking.h>
#import "NSMutableURLRequest+TJRequest.h"

@implementation IntegralAPI

/**积分商城*/
+ (void)searchCouponShopWithPage:(NSInteger)page success:(void(^)(id reponse))success failure:(void(^)(id reponse))failure{
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseUrl_UserAndOrder,kAPI_CouponShop];
    
    NSDictionary *parm = @{@"size":@"10",
                           @"page":@(page)};
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:kRequestType_GET //.............
                                                                                 URLString:url
                                                                                parameters:parm
                                                                                     error:nil];
    [request addHeaderWithToken];
    [request startWithSuccess:success failure:failure];
}

/**兑换记录*/
+ (void)searchCouponRecordsWithPage:(NSInteger)page success:(void (^)(id reponse))success failure:(void (^)(id reponse))failure{
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseUrl_UserAndOrder,kAPI_CouponRecords];
    
    NSDictionary *parm = @{@"size":@"10",
                           @"page":@(page)};
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:kRequestType_GET //.............
                                                                                 URLString:url
                                                                                parameters:parm
                                                                                     error:nil];
    [request addHeaderWithToken];
    [request startWithSuccess:success failure:failure];
}

@end
