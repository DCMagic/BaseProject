//
//  UIView+Extensions.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum :NSInteger{
    
    LXShadowPathLeft,
    
    LXShadowPathRight,
    
    LXShadowPathTop,
    
    LXShadowPathBottom,
    
    LXShadowPathNoTop,
    
    LXShadowPathAllSide
    
} LXShadowPathSide;

@interface UIView (Extensions)

/**
 * 获取view所在的controller
 */
@property (nonatomic, weak, readonly) UIViewController *viewController;

/**
 * 获取view所在的navigationController
 */
@property (nonatomic, weak, readonly) UINavigationController *navigationController;

/**
 * 当前view是不是正在屏幕上展示了
 */
@property (nonatomic, assign, readonly) BOOL isShowInScreen;

/**
 * 移除所有子视图
 */
- (void)removeAllSubviews;

/**
 *  找到指定类名的SubView对象
 */
- (id)findSubViewWithClass:(Class)subViewClass;

/**
 *  找到指定类名的SuperView对象
 */
- (id)findSuperViewWithClass:(Class)superViewClass;

/**
 *  找到第一响应者
 */
- (UIView *)findFirstResponder;


/*
 * shadowColor 阴影颜色
 *
 * shadowOpacity 阴影透明度，默认0
 *
 * shadowRadius  阴影半径，默认3
 *
 * shadowPathSide 设置哪一侧的阴影，
 
 * shadowPathWidth 阴影的宽度，
 */

-(void)LX_SetShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(LXShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth;

@property (nonatomic, strong) NSString *stringTag;

@end
