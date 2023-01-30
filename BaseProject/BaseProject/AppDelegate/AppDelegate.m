//
//  AppDelegate.m
//  BaseProject
//
//  Created by dongchao on 2022/3/20.
//

#import "AppDelegate.h"
#import "LaunchManager.h"
#import "MainVC.h"

@interface AppDelegate ()

@property (nonatomic, assign)UIBackgroundTaskIdentifier backgroundTaskIdentifier;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSThread sleepForTimeInterval:1];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    if (@available(iOS 13.0, *)) {
        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    } else {
        // Fallback on earlier versions
    }
    self.window.backgroundColor = kFFFFFFFF;
    
    // 初始化UI
    [[LaunchManager sharedInstance] launchInWindow:self.window];
//    self.window.rootViewController = [[MainVC alloc]init];
//    [self.window makeKeyAndVisible];
    
    // 判断是否更新
    
    // 初始化第三方SDK
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    
    
    return YES;
}


#pragma mark 获取deviceToken
// 获取deviceToken成功
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken API_AVAILABLE(ios(3.0)){
    
}

// 获取deviceToken失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error API_AVAILABLE(ios(3.0)){
    
}

// app进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application{
//    self.backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        // 只保活3分钟
//        [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
//        self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
//    }];
}

// app将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application{
    
}

- (void)applicationWillTerminate:(UIApplication *)application{
    [DCSaveData clearTmpDirectory];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"inspectNum"];
}


@end
