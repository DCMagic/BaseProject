//
//  LaunchManager.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import <Foundation/Foundation.h>
#import "LoginVC.h"
#import "MainVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface LaunchManager : NSObject

/// 当前根控制器
@property (nonatomic, strong, readonly) __kindof UIViewController *curRootVC;

/// 根ViewController
@property (nonatomic, strong) MainVC *mainVC;

/// 登录控制器
@property (nonatomic, strong, readonly) LoginVC *loginViewController;

// 单例
+ (LaunchManager *)sharedInstance;

/**
 *  启动，初始化
 */
- (void)launchInWindow:(UIWindow *)window;

// 当前显示界面
- (void)showLaunch;
- (void)loginOut;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;


@end

NS_ASSUME_NONNULL_END
