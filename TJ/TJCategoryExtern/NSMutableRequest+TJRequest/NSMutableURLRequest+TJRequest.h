//
//  NSMutableURLRequest+TJRequest.h
//  YaoYD
//
//  Created by YM on 15/12/14.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (TJRequest)

/***  添加token请求头*/
- (void)addHeaderWithToken;

/***  发送请求 */
- (void)startWithSuccess:(id)success failure:(id)failure;


@end
