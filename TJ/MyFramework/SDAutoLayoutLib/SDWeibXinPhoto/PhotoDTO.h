//
//  PhotoDTO.h
//  TestSDAutoLayout
//
//  Created by Tianjian on 15/12/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoDTO : NSObject

/**标识*/
@property (copy,nonatomic ) NSString *ID;
/**图片 URL 地址*/
@property (copy,nonatomic ) NSString *url;
/**图片宽度*/
@property (copy,nonatomic ) NSString *width;
/**图片高度*/
@property (copy,nonatomic ) NSString *height;
/**图片上传时间*/
@property (copy,nonatomic ) NSString *createdAt;


@end
