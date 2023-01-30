//
//  UIViewController+StatusBar.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/7.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (StatusBar)

# pragma mark - StatusBarStyle
/**
 设置导航栏样式
 */
- (void)setStatusBarStyle:(UIStatusBarStyle)style;

@end

NS_ASSUME_NONNULL_END
