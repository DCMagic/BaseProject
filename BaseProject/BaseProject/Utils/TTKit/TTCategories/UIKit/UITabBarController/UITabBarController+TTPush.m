//
//  UITabBarController+TLPush.m
//  TTKit
//
//  Created by tao6 on 2017/9/19.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import "UITabBarController+TTPush.h"

@implementation UITabBarController (TTPush)

- (BOOL)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.selectedIndex < self.childViewControllers.count) {
        UIViewController *vc = self.childViewControllers[self.selectedIndex];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController *)vc pushViewController:viewController animated:animated];
            return YES;
        }
    }
    return NO;
}

@end
