//
//  BaseTabBarViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/11/9.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()<UITabBarDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
    [self configIOS15];

}

/// 添加子控制器集合
- (void)addChildViewControllers {
    [self addChildViewControllerVcName:@"HomeVC" title:@"首页" imageName:@"home"];
    [self addChildViewControllerVcName:@"MainVC" title:@"巡检" imageName:@"inspection"];
    [self addChildViewControllerVcName:@"MineViewController" title:@"我的" imageName:@"user"];
}

/// 添加子控制器
- (void)addChildViewControllerVcName:(NSString *)vcName title:(NSString *)title imageName:(NSString *)imageName {
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [[cls alloc] init];
    vc.title = title; // 设置控制器标题，和按钮的文字
    vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    
    // 将导航控制器添加到tabBar控制器中
    [self addChildViewController:nav];
}

- (void)configIOS15 {
    self.tabBar.backgroundColor = UIColor.whiteColor;
    if(@available(iOS 15.0,*)){
          UINavigationBarAppearance *apperance=[[UINavigationBarAppearance alloc]init];
          apperance.backgroundColor=[UIColor whiteColor];//设置背景色
          [apperance setTitleTextAttributes:@{
                      NSFontAttributeName:[UIFont systemFontOfSize:18],
                      NSForegroundColorAttributeName:UIColor.whiteColor
          }];//设置标题字体
          apperance.shadowImage = [[UIImage alloc]init];
          apperance.shadowColor=nil;//分割线去除
          [UINavigationBar appearance].standardAppearance=apperance;
          [UINavigationBar appearance].scrollEdgeAppearance=[UINavigationBar appearance].standardAppearance;//重新赋值
      }
}

@end
