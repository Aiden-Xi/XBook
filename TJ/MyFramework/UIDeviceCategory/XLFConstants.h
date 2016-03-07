
#import <Foundation/Foundation.h>

#define XLFLoadCategory(UNIQUE_NAME) @interface FORCELOAD_##UNIQUE_NAME :NSObject @end @implementation FORCELOAD_##UNIQUE_NAME @end

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - 常用计算
#define select(condition,vTrue,vFalse)                         ((condition)?(vTrue):(vFalse))

/**
 *  操作系统版本号
 */
#define IOS_VERSION                                         [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  是否iPhone
 */
#define IS_IPHONE                                           UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone




