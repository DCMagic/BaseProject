//
//  LaunchManager.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "LaunchManager.h"
#import "BaseNavigationViewController.h"
#import "BaseTabBarViewController.h"

@interface LaunchManager ()

@property (nonatomic, weak) UIWindow *window;

@property (nonatomic, strong) UINavigationController *loginNavViewController;

@property (nonatomic, strong) BaseTabBarViewController *MainTabBarController;

@property (nonatomic, strong) BaseNavigationViewController *MainNavViewController;

@property (nonatomic, strong) UINavigationController *guidePageNavViewController;


@end

@implementation LaunchManager

static NSString *kFirstAppName = @"kFirstAppName";

@synthesize loginViewController = _loginViewController;

+ (LaunchManager *)sharedInstance{
    static LaunchManager *_rootVCManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _rootVCManager = [[self alloc] init];
    });
    return _rootVCManager;
}

- (void)launchInWindow:(UIWindow *)window{
    
    self.window = window;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self showLaunch];
}

- (void)showLaunch {
    
    // 第一次进入
//    BOOL isFirstApp = [[NSUserDefaults standardUserDefaults] boolForKey:kFirstAppName];
//    if (!isFirstApp) {
//        // 第一次进入 设置引导页
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kFirstAppName];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        [self setCurRootVC:self.guidePageNavViewController];
//        return;
//    }
    
//    暂时去掉登录判断
    kWeakSelf(self)
//    [weakSelf setCurRootVC:weakSelf.MainTabBarController];
//    return;
    
    
    //  已登录
    if ([PBUserInfo shareManager].token.length > 0) {
        if(!weakSelf.curRootVC){
            [weakSelf setCurRootVC:weakSelf.MainTabBarController];
            [weakSelf loginSuccess];

        }else if (weakSelf.curRootVC == weakSelf.MainTabBarController) {
            // 当前根控制器为MainNavC
            return;

        }else if (weakSelf.curRootVC == weakSelf.loginNavViewController) {
            // 当前根控制器为 loginViewController
            [weakSelf dismissAnim:kCATransitionFromLeft];
            weakSelf.MainNavViewController = nil;
            [weakSelf setCurRootVC:weakSelf.MainTabBarController];
            [weakSelf loginSuccess];
        }else{
            [weakSelf setCurRootVC:weakSelf.MainTabBarController];
            [weakSelf loginSuccess];
        }
    }else{
    // 未登录
        if (!weakSelf.curRootVC) {
            [weakSelf setCurRootVC:weakSelf.loginNavViewController];
            [weakSelf loginOut];
        }else if (weakSelf.curRootVC == weakSelf.MainTabBarController) {
                // 当前根控制器为tabBar 和 当前显示 的不是login 则去登录页
            [weakSelf dismissAnim:kCATransitionFromRight];
            [weakSelf setCurRootVC:weakSelf.loginNavViewController];
            [weakSelf loginOut];

        }else if(weakSelf.curRootVC == weakSelf.loginNavViewController) {
            return;
        }else{
            [weakSelf setCurRootVC:weakSelf.loginNavViewController];
            [weakSelf loginOut];
        }
    }
}

// 动画
- (void)dismissAnim:(NSString *)subtype {
    
    CATransition *animation = [CATransition animation];
    
    animation.duration = 0.35;
    
    animation.type = kCATransitionPush;
    
    animation.subtype = subtype;
    
    [self.window.layer addAnimation:animation forKey:nil];
    
}


- (void)loginSuccess{
    
}

#pragma mark 退出登录，清除数据
-(void)loginOut{
    if (self.window) {
        [self.window.rootViewController removeFromParentViewController];
        [self setCurRootVC:self.loginNavViewController];
    }
    
}

- (void)setCurRootVC:(__kindof UIViewController *)curRootVC{
    
    _curRootVC = curRootVC;
    UIWindow *window = self.window ? self.window : [UIApplication sharedApplication].keyWindow;
//    if (@available(iOS 13.0, *)) {
//        [curRootVC setOverrideUserInterfaceStyle:UIUserInterfaceStyleLight];
//    } else {
//        // Fallback on earlier versions
//    }
    [window setRootViewController:curRootVC];
    [window addSubview:curRootVC.view];
    [window makeKeyAndVisible];
}

#pragma mark - # Getters


- (UINavigationController *)loginNavViewController
{
    if (!_loginNavViewController) {
        _loginNavViewController = [[UINavigationController alloc] initWithRootViewController:self.loginViewController];
        _loginNavViewController.navigationBarHidden = YES;
    }
    return _loginNavViewController;
}

- (BaseTabBarViewController *)MainTabBarController{
    if (!_MainTabBarController) {
        _MainTabBarController = [[BaseTabBarViewController alloc] init];
    }
    return _MainTabBarController;
}

- (BaseNavigationViewController *)MainNavViewController{
    if (!_MainNavViewController) {
        _MainNavViewController = [[BaseNavigationViewController alloc] initWithRootViewController:self.mainVC];
    }
    return _MainNavViewController;
}

- (LoginVC *)loginViewController
{
    if (!_loginViewController) {
        _loginViewController = [[LoginVC alloc] init];
    }
    return _loginViewController;
}

- (MainVC *)mainVC{
    if (!_mainVC) {
        _mainVC = [[MainVC alloc]init];
    }
    return _mainVC;
}

- (UINavigationController *)guidePageNavViewController
{
    if (!_guidePageNavViewController) {
        BOOL isFirstApp = [[NSUserDefaults standardUserDefaults] boolForKey:kFirstAppName];
//        if (!isFirstApp) {
            _guidePageNavViewController = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"GuidePageVC") alloc] init]];
//        }else{
//            _guidePageNavViewController = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"ShowPageVC") alloc] init]];
//        }
        
        //_guidePageNavViewController.navigationBarHidden = YES;
    }
    return _guidePageNavViewController;
}

@end
