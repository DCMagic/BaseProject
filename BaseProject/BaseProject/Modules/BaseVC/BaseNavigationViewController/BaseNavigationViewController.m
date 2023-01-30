//
//  BaseNavigationViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/5/16.
//

#import "BaseNavigationViewController.h"
#import "AppDelegate.h"

@interface BaseNavigationViewController ()<UINavigationBarDelegate,UINavigationControllerDelegate>

@end

@implementation BaseNavigationViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController* topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置系统返回箭头的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //设置导航栏标题颜色
    //    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:kPingFangSC_Medium size:17],NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.delegate = self;
    [self.navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"返回按钮"];
    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"返回按钮"];
    self.navigationItem.backBarButtonItem = backItem;
    
}

/**
 拦截系统的push事件，增加隐藏tabbar
 
 @param viewController 要push的vc
 @param animated 是否需要push动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:animated];
}

@end
