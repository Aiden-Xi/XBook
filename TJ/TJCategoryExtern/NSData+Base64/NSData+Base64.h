//
//  NSData+Base64.h
//  YaoYD
//
//  Created by 陈胜华 on 15/7/10.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+ (id)dataWithBase64EncodedString:(NSString *)string;

- (NSString *)base64Encoding;

@end
