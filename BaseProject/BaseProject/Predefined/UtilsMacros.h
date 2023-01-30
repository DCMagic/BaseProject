//
//  UtilsMacros.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

/**
 *  获取屏幕尺寸，注：此尺寸为相对尺寸，在屏幕发生旋转后，宽高会调换
 */
#define MainScreen_Height [UIScreen mainScreen].bounds.size.height
#define MainScreen_Width [UIScreen mainScreen].bounds.size.width

/**
 *  获取屏幕尺寸，注：此尺寸为固定尺寸，在屏幕发生旋转后，依然为竖屏的的宽高
 */
#define PhoneScreen_WIDTH (MainScreen_Width == 568 ? MainScreen_Height : (MainScreen_Width == 667 ? MainScreen_Height : (MainScreen_Width == 736 ? MainScreen_Height : (MainScreen_Width == 812 ? MainScreen_Height : (MainScreen_Width == 896 ? MainScreen_Height : MainScreen_Width)))))

#define PhoneScreen_HEIGHT (MainScreen_Width == 568 ? MainScreen_Width : (MainScreen_Width == 667 ? MainScreen_Width : (MainScreen_Width == 736 ? MainScreen_Width : (MainScreen_Width == 812 ? MainScreen_Width : (MainScreen_Width == 896 ? MainScreen_Width : MainScreen_Height)))))

#define     SAFEAREA_INSETS     \
({   \
UIEdgeInsets edgeInsets = UIEdgeInsetsZero; \
if (@available(iOS 11.0, *)) {      \
edgeInsets = [UIApplication sharedApplication].keyWindow.safeAreaInsets;     \
}   \
edgeInsets;  \
})\

#define     SAFEAREA_INSETS_BOTTOM      (SAFEAREA_INSETS.bottom)

/**
 *  适配iphonex
 */
// 是否是X，YES是，NO不是
//#define IS_IPHONEX (PhoneScreen_HEIGHT == 812.0f || PhoneScreen_HEIGHT == 896.0f) ? YES : NO
//#define IS_IPHONEX (SAFEAREA_INSETS_BOTTOM == 34.0f) ? YES : NO
#define IS_IPHONEX (SAFEAREA_INSETS_BOTTOM > 0.0f) ? YES : NO
// 导航栏高度
#define Height_NavContentBar 44.0f
// X状态栏多出来的高度
//#define Height_StatusBarRedundant 24.0f
#define Height_StatusBarRedundant ((SAFEAREA_INSETS_BOTTOM == 34.0f) ? 24.0f : 21.0f)
// 状态栏高度
#define Height_HasStatusBar ((IS_IPHONEX == YES) ? 20.0f : 0)
// 状态栏高度
#define Height_StatusBar ((IS_IPHONEX == YES) ? 44.0f : 20.0f)
//#define Height_StatusBar ((IS_IPHONEX == YES) ? 20.0f + Height_StatusBarRedundant : 20.0f)
// 导航栏+状态栏高度
//#define Height_NavBar ((IS_IPHONEX == YES) ?  88.0f : 64.0f)
#define Height_NavBar ((IS_IPHONEX == YES) ?  64.0f + Height_StatusBarRedundant : 64.0f)
// TabBar高度
#define Height_TabBar ((IS_IPHONEX == YES) ? 83.0f : 49.0f)
//#define Height_TabBar ((IS_IPHONEX == YES) ? 49.0f + SAFEAREA_INSETS_BOTTOM : 49.0f)
// X底部按钮高度
#define Height_Bottom ((IS_IPHONEX == YES) ? SAFEAREA_INSETS_BOTTOM : 0)
// 状态栏高度
#define kStatusBar_Height CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)

/**
 *  适配不同尺寸的屏幕,已6的屏幕为基准宽度
 */
#define Adaptation_6(WidthOrHeight) (PhoneScreen_WIDTH / 375.0 * (WidthOrHeight))

/**
 *  防止循环引用
 */
#define kWeakSelf(obj)  __weak typeof(self)weakSelf = self;
#define kStrongSelf(obj) __strong typeof(weakSelf)strongSelf = weakSelf;
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = weak##o


#pragma mark - # 系统方法简写
/// 广播中心
#define     kNotificationCenter        [NSNotificationCenter defaultCenter]
/// 用户自定义数据
#define     kUserDefaults              [NSUserDefaults standardUserDefaults]
/// URL
#define     kURL(urlString)            [NSURL URLWithString:urlString]
/// 图片
#define     kImage(imageName)          [UIImage imageNamed:imageName]
#define     kPNG(X)                    [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@"png"]]
#define     kJPG(X)                    [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@"jpg"]]
/// 字符串
#define     kNoNilString(str)          (str.length > 0 ? str : @"")
/// 方法名
#define     kStirngFormSelector(s)     [[NSString alloc] initWithUTF8String:sel_getName(s)]


//#pragma mark - # 打印部分
////如果想要在release下显示打印，注释下面宏定义即可
//#ifdef DEBUG // 处于开发阶段
//#define NSLog(frmt,...) LOG_OBJC_MAYBE(frmt, ##__VA_ARGS__)
//#else        // 处于发布阶段
//#define NSLog(...)
//#endif

#pragma mark - # 快捷方法
/// PushVC
#define     PushVC(vc)                  {\
[vc setHidesBottomBarWhenPushed:YES];\
[self.navigationController pushViewController:vc animated:YES];\
}

#define     WeakPushVC(vc)                  {\
[vc setHidesBottomBarWhenPushed:YES];\
[selfWeak.navigationController pushViewController:vc animated:YES];\
}

#define     TT_CHAINAPI_TYPE            @property (nonatomic, copy, readonly)

#define LAUNCH_MANAGER [LaunchManager sharedInstance]

/// 方法交换
#define     kExchangeMethod(oldSEL, newSEL) {\
Method oldMethod = class_getInstanceMethod(self, oldSEL);\
Method newMethod = class_getInstanceMethod(self, newSEL);\
method_exchangeImplementations(oldMethod, newMethod);\
}\

#pragma mark - # 多线程
#define     kBackThread(block)         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define     kMainThread(block)         dispatch_async(dispatch_get_main_queue(), block)
#define     kMainBarrier(block)        dispatch_barrier_async(dispatch_get_main_queue(), block)
#define     kMainAfter(x, block)       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(x * NSEC_PER_SEC)), dispatch_get_main_queue(), block);


#pragma mark - # 系统版本
#define     SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define     SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define     SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define     SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define mark - # Default
// 默认头像
#define     DEFAULT_AVATAR_PATH         @"mine_head_test"

// 验证码倒计时
#define kVerificationCodeCountdown 120

// 点赞btn的左右间距
#define kGiveLikeBtnLeftAndRightSpacing 18

// 缴党费地址，正式环境
#define kPayPartyPath @"https://beste.bankcomm.com/pay/bsy/payLogin.html?appid=wx87427c283f489e44&app=1"

// 缴党费地址2.0，测试环境(链接外网)
//#define kPayPartyPathToOther @"https://wepay.test.bankcomm.com/bfsp-dev/pay/bsy/payLogin.html?"
// 缴党费地址2.0，正式环境(链接外网)
#define kPayPartyPathToOther @"https://beste.bankcomm.com/pay/bsy/payLogin.html?appid=wx87427c283f489e44&app=1&"
//#define kPayPartyPathToOther @"https://beste.bankcomm.com/pay/bsy/qryOweInfo.html?appid=wx87427c283f489e44&app=1&"

// 缴党费地址，测试环境
//#define kPayPartyPath @"https://wepay.test.bankcomm.com/bfsp-dev/pay/bsy/payLogin.html?appid=wx87427c283f489e44&app=1"

// 缴党费地址，正式环境
#define kPayPartyPath2_0 @"/rbac/membershipDues/payCost"


// 切换网络环境btn的tag值
#define DebugMenuTag 1009


//字符串高度/长度计算
#import "NSString+StringSize.h"
//时间分类
#import "NSDate+Format.h"
//运行时添加data属性
#import "NSObject+data.h"
//字符串是否为空
#import "NSString+isBlank.h"
//字符串首字母，用于索引
#import "NSString+firstChar.h"

#endif /* UtilsMacros_h */
