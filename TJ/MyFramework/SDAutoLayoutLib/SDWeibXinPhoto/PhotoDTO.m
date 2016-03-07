//
//  PhotoDTO.m
//  TestSDAutoLayout
//
//  Created by Tianjian on 15/12/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "PhotoDTO.h"

@implementation PhotoDTO

- (id)replacementObjectForCoder:(NSCoder *)aCoder{
    return @{@"ID":@"id"};
}

@end
