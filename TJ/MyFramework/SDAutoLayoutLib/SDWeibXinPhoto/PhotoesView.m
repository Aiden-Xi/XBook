//
//  PhotoesView.m
//  TestSDAutoLayout
//
//  Created by Tianjian on 15/12/29.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "PhotoesView.h"
#import "UIButton+WebCache.h"

#import "SDPhotoBrowser.h"

@interface PhotoesView ()<SDPhotoBrowserDelegate>

@property (strong,nonatomic) NSMutableArray *arrList;
@property (strong,nonatomic) NSMutableArray *arrButtons;

@end

#define SDPhotoGroupImageMargin 15

static CGFloat const defalutWith = 70;
static CGFloat const defalutheigt= 70;
static CGFloat const defalutPadding = 10;
static NSInteger const defalutNumberOfCount = 3;

@implementation PhotoesView

#pragma mark -Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //清理缓存
        [[SDWebImageManager sharedManager].imageCache clearDisk];
    }
    return self;
}

-  (void)setPhotoItemArray:(NSArray *)photoItemArray{
    [[self arrList] addObjectsFromArray:photoItemArray];
    [self initBaseDataInfo];
}

#pragma mark -initMethod
- (void)initBaseDataInfo{
    CGSize size = (self.size.width == 0||self.size.height == 0)?CGSizeMake(defalutWith, defalutheigt):self.size;
    CGFloat marginPadding = (self.marginPadding == 0)?defalutPadding:self.marginPadding;
    NSInteger numberOfCount= (self.numberOfCount == 0)?defalutNumberOfCount:self.numberOfCount;
    NSInteger imageCount = [self arrList].count;
    
    NSLog(@"marginPadding = %@,numberOfCount = %@, imageCount = %@",@(marginPadding),@(numberOfCount),@(imageCount));
    
    __block CGRect tempFrame ;
    [[self arrList] enumerateObjectsUsingBlock:^(PhotoDTO* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(marginPadding+(size.width+marginPadding)*(idx%numberOfCount), marginPadding+(size.height+marginPadding)*(idx/numberOfCount), size.width, size.height);
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:obj.url] forState:UIControlStateNormal];
        btn.tag = idx;
        [btn addTarget:self action:@selector(_efOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (obj == [[self arrList]lastObject]) {
            tempFrame = btn.frame;
        }

        [[self arrButtons] addObject:btn];
    }];
    
    CGRect frame = self.frame;
    //self.frame = CGRectMake(frame.origin.x, frame.origin.y, numberOfCount*(size.width +marginPadding)+marginPadding,(imageCount/numberOfCount+1)*(size.height+marginPadding)+marginPadding);
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, numberOfCount*(size.width +marginPadding)+marginPadding,tempFrame.origin.y+CGRectGetHeight(tempFrame)+marginPadding);
    [self layoutIfNeeded];
}
#pragma mark -Action Respone
- (void)_efOnClick:(UIButton*)button{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self; // 原图的父控件
    browser.imageCount = [self arrList].count; // 图片总数
    browser.currentImageIndex = button.tag;
    browser.delegate = self;
    [browser show];
}
#pragma mark -Delegate 代理
#pragma mark - photobrowser代理方法
// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{
    UIButton *button = [self arrButtons][index];
    UIImage *image = button.currentBackgroundImage;
    return image;
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    PhotoDTO *DTO = [self arrList][index];
    NSString *urlStr = [DTO.url stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
    return [NSURL URLWithString:urlStr];
}
#pragma mark -Getters and Setters
- (NSMutableArray *)arrList{
    if (_arrList == nil) {
        _arrList = [NSMutableArray array];
    }
    return _arrList;
}
- (NSMutableArray *)arrButtons{
    if (_arrButtons == nil) {
        _arrButtons = [NSMutableArray array];
    }
    return _arrButtons;
}



@end
