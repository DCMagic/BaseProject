//
//  UITabBarController+TLLaunchExtension.h
//  TTKit
//
//  Created by tao6 on 2017/9/19.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (TTPush)

/**
 *  获取当前VC的navController，并执行push操作
 *
 *  @return 是否成功push
 */
- (BOOL)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
