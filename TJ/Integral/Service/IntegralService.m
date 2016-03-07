//
//  IntegralService.m
//  YaoYD
//
//  Created by Tianjian on 16/3/2.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

#import "IntegralService.h"
#import "IntegralAPI.h"
#import "ErrorResponseDTO.h"

@implementation IntegralService

/**积分商城*/
+ (void)searchCouponShopWithPage:(NSInteger)page complete:(void(^)(BOOL success,id model))completeBlock{
    __block NSString *errmsg = @"错误信息";//....
    
    [IntegralAPI searchCouponShopWithPage:page success:^(id reponse) {
        BLOCK_EXEC(completeBlock,true,reponse);
    } failure:^(id reponse) {
        ErrorResponseDTO *model = [ErrorResponseDTO initWithErrorResponse:reponse withCustomErrInfoMsg:errmsg];
        BLOCK_EXEC(completeBlock,false,[model errText]);
    }];
}

/**兑换记录*/
+ (void)searchCouponRecordsWithPage:(NSInteger)page complete:(void(^)(BOOL success,id model))completeBlock{
    __block NSString *errmsg = @"错误信息";//....
    
    [IntegralAPI searchCouponRecordsWithPage:page success:^(id reponse) {
        BLOCK_EXEC(completeBlock,true,reponse);
    } failure:^(id reponse) {
        ErrorResponseDTO *model = [ErrorResponseDTO initWithErrorResponse:reponse withCustomErrInfoMsg:errmsg];
        BLOCK_EXEC(completeBlock,false,[model errText]);
    }];
}

@end
