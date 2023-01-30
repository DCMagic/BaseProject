//
//  UIViewController+StatusBar.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/7.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIViewController+StatusBar.h"

static char kTTStatusBarStyleKey;

@implementation UIViewController (StatusBar)

# pragma mark - StatusBarStyle


- (void)setStatusBarStyle:(UIStatusBarStyle)style {
    objc_setAssociatedObject(self, &kTTStatusBarStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsStatusBarAppearanceUpdate];
}


@end
