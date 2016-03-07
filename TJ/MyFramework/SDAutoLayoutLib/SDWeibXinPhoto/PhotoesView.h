//
//  PhotoesView.h
//  TestSDAutoLayout
//
//  Created by Tianjian on 15/12/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoDTO.h"

@interface PhotoesView : UIView

@property (assign,nonatomic) CGSize size;

@property (assign,nonatomic) CGFloat marginPadding;

@property (assign,nonatomic) NSInteger numberOfCount;

@property (strong,nonatomic) NSArray<PhotoDTO *> *photoItemArray;

@end

/** 基本用法:
 NSArray *srcStringArray = @[@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                             @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                             @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                             @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                             @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                             @"http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                             ];
 [srcStringArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 PhotoDTO *DTO = [[PhotoDTO alloc]init];
     DTO.url = obj;
     [[self arrList] addObject:DTO];
 }];
 PhotoesView *photoView = [[PhotoesView alloc]initWithFrame:CGRectZero];
 photoView.backgroundColor = [UIColor darkGrayColor];
 photoView.marginPadding = 10;
 photoView.size = CGSizeMake(80, 80);
 photoView.numberOfCount = 4;
 photoView.photoItemArray = [self arrList];
 [self.view addSubview:photoView];
 
 */
