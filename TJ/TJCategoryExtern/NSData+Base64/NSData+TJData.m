//
//  NSData+TJData.m
//  YaoYD
//
//  Created by 陈胜华 on 15/7/10.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import "NSData+TJData.h"

@implementation NSData (TJData)

+ (NSString*) imageToString:(UIImage *)image
{
    NSData* pictureData = UIImageJPEGRepresentation(image, 0.3);//进行图片压缩从0.0到1.0（0.0表示最大压缩，质量最低);
    NSString* pictureDataString = [pictureData base64Encoding];//图片转码成为base64Encoding，
    
    return pictureDataString;
}

+(UIImage *)stringToImage:(NSString *)imageStr
{
    return [UIImage imageWithData:[NSData dataWithBase64EncodedString:imageStr]];
}

+ (NSString*)stringFromUrl:(NSURL*)url
{
    return [url absoluteString];//[NSString stringWithFormat:@"%@",url];
}
+ (NSURL*)urlFromString:(NSString*)string
{
    return [NSURL URLWithString:string];
}

#pragma mark 计算UILabel的高度
+ (CGFloat)calculateContentLabelHeight:(NSString *)text withFont:(UIFont *)font withWidth:(CGFloat)width{
    CGSize commentSize;
    commentSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:        NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
    return commentSize.height;
}

+ (NSString*)string:(NSString*)nomarlStr
        replaceWith:(NSString*)charStr
          FromIndex:(NSInteger)indexStart
            ToIndex:(NSInteger)indexEnd{
    
    NSString *str_Header = [nomarlStr substringToIndex:indexStart];
    NSString *str_Middle = @"";//[nomarlStr substringWithRange:NSMakeRange(indexStart, indexEnd-indexStart)];
    NSString *str_End    = [nomarlStr substringFromIndex:indexEnd];
    
    for (int i = 0; i < indexEnd - indexStart; i++) {
        str_Middle = [NSString stringWithFormat:@"%@%@",str_Middle,charStr];
    }
    
    return [NSString stringWithFormat:@"%@%@%@",str_Header,str_Middle,str_End];
}

@end
