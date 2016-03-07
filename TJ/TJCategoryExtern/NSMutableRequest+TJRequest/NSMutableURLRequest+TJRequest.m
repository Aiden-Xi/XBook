//
//  NSMutableURLRequest+TJRequest.m
//  YaoYD
//
//  Created by YM on 15/12/14.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSMutableURLRequest+TJRequest.h"
#import "TJNetService.h"
@implementation NSMutableURLRequest (TJRequest)

- (void)addHeaderWithToken{
    [self setValue:[TJNetService shareInstance].headerToken forHTTPHeaderField:@"Authorization"];
}

- (void)startWithSuccess:(id)success failure:(id)failure{
    [[TJNetService shareInstance] baseRequest:self success:success failure:failure];
}

@end
