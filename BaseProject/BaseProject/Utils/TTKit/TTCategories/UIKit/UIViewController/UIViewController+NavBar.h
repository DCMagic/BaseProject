//
//  UIViewController+NavBar.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+Action.h"

@interface UIViewController (NavBar)

/// 添加消失BarButton（左侧)
- (void)addDismissBarButtonWithTitle:(NSString *)title;

/// 左侧文字BarButton
- (void)addLeftBarButtonWithTitle:(NSString *)title actionBlick:(TTBarButtonActionBlock)actionBlock;
/// 左侧图片BarButton
- (void)addLeftBarButtonWithImage:(UIImage *)image actionBlick:(TTBarButtonActionBlock)actionBlock;

/// 右侧文字BarButton
- (void)addRightBarButtonWithTitle:(NSString *)title actionBlick:(TTBarButtonActionBlock)actionBlock;
/// 右侧图片BarButton
- (void)addRightBarButtonWithImage:(UIImage *)image actionBlick:(TTBarButtonActionBlock)actionBlock;

@end
