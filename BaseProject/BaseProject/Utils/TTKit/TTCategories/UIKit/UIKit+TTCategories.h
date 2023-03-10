//
//  UIKit+TTCategories.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#ifndef UIKit_TTCategories_h
#define UIKit_TTCategories_h

//MARK: UIApplication
#import "UIApplication+AppInfo.h"               // UIApplication 一些关于App的信息

//MARK: UIView
#import "UIView+Frame.h"                        // UIView 的一些关于坐标、大小的快捷属性
#import "UIView+Extensions.h"                   // UIView 关于subView、所在VC、当前状态的拓展
#import "UIView+Screenshot.h"                   // UIView 截屏
#import "UIView+TipView.h"                      // UIView 错误提示View（无网、无数据等）

//MARK: UIControl
#import "UIControl+ActionBlocks.h"              // UIColor 事件响应block

//MARK: UIButton
#import "UIButton+Extensions.h"                 // UIButton 设置背景色、图文混排

//MAKR: UIImage
#import "UIImage+TTColor.h"                       // UIImage 根据颜色初始化
#import "UIImage+Size.h"                        // UIImage 图片缩放
#import "UIImage+TTExtend.h"                    // UIImage 保存相册

//MARK: UIColor
#import "UIColor+Extensions.h"                  // UIColor 根据16进制字符串创建颜色
#import "UIColor+Gradient.h"                    // UIColor 渐变色

//MARK: UIScrollView
#import "UIScrollView+Extensions.h"             // UIScrollView contentOffset、contentSize、滚动方法拓展等
#import "UIScrollView+Pages.h"                  // UIScrollView 分页拓展
#import "UIScrollView+iOS11Fixed.h"             // UIScrollView iOS11

//MARK: UITextField
#import "UITextField+LengthLimit.h"             // UITextField 长度限制
#import "UITextField+Select.h"                  // UITextField 文字选择

//MARK: UITextView
#import "UITextView+Placeholder.h"              // UITextView placeHolder
#import "UITextView+LengthLimit.h"              // UITextView 长度限制
#import "UITextView+Select.h"                   // UITextView 文字选择

//MARK: UICollectionViewCell
#import "UICollectionViewCell+Extensions.h"     // UICollectionViewCell 高亮色设置

//MARK: UIBarButtonItem
#import "UIBarButtonItem+Action.h"              // UIBarButtonItem blcok

//MARK: UINavigationBar
#import "UINavigationBar+Extensions.h"          // UINavigationBar 背景色，透明度等

//MARK: UINavigationItem
#import "UINavigationItem+Fixed.h"              // UINavigationItem 修复navBarButton偏移过大问题

//MARK: UINavigationController
#import "UINavigationController+Extensions.h"   // UINavigationController 获取rootVC，查找VC，pop到指定VC等
#import "UIViewController+BackButtonHandler.h"  // 控制视图的返回

//MARK: UITabBarController+TTPush
#import "UITabBarController+TTPush.h"           // UITabBarController 当前VC Push

//MARK: UIViewController
#import "UIViewController+NavBar.h"             // UIViewController navBar按钮
#import "UIViewController+TipView.h"            // UIViewController 错误提示View（依赖UIView+TipView）
#import "UIViewController+StatusBar.h"          // UIViewController 状态栏

//MARK: UIWindow
#import "UIWindow+Extensions.h"                 // UIWindow 获取当前VC

//MARK: UIAlertView
#import "UIAlertView+ActionBlocks.h"            // UIAlertView 事件响应block

//MARK: UIGestureRecognizer
#import "UIGestureRecognizer+TTBlock.h"         // UIGestureRecognizer 事件响应block

#endif /* UIKit_TTCategories_h */
