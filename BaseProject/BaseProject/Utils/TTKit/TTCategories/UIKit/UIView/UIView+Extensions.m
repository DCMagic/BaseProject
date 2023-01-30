//
//  UIView+Extensions.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIView+Extensions.h"
#import <objc/runtime.h>

static NSString *kStringTag = @"kStringTag";

@implementation UIView (Extensions)

- (UIViewController *)viewController
{
    for (UIView *next = self; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UINavigationController *)navigationController
{
    return self.viewController.navigationController;
}

- (BOOL)isShowInScreen
{
    if (self == nil) {
        return NO;
    }
    
    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.bounds toView:nil];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    if (self.hidden ||                              // view已隐藏
        self.superview == nil ||                    // 没有父视图
        CGSizeEqualToSize(rect.size, CGSizeZero)    // size为0
        ) {
        return NO;
    }
    
    // 计算view与window交叉的rect
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}

- (void)removeAllSubviews
{
    for (id view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (id)findSubViewWithClass:(Class)subViewClass
{
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:subViewClass]) {
            return subView;
        }
    }
    
    return nil;
}

- (id)findSuperViewWithClass:(Class)superViewClass
{
    if (self == nil || self.superview == nil) {
        return nil;
    }
    else if ([self.superview isKindOfClass:superViewClass]) {
        return self.superview;
    }
    else {
        return [self.superview findSuperViewWithClass:superViewClass];
    }
}

- (UIView *)findFirstResponder
{
    if ([self canBecomeFirstResponder]  && self.isFirstResponder) {
        return self;
    }
    
    for (UIView *view in self.subviews) {
        UIView *firstResponder = [view findFirstResponder];
        if (firstResponder) {
            return firstResponder;
        }
    }
    return nil;
}

- (NSString *)stringTag {
    return objc_getAssociatedObject(self, &kStringTag);
}

- (void)setStringTag:(NSString *)tag {
    objc_setAssociatedObject(self, &kStringTag, tag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

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

-(void)LX_SetShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(LXShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth{
    
    
    self.layer.masksToBounds = NO;
    
    self.layer.shadowColor = shadowColor.CGColor;
    
    self.layer.shadowOpacity = shadowOpacity;
    
    self.layer.shadowRadius =  shadowRadius;
    
    self.layer.shadowOffset = CGSizeZero;
    CGRect shadowRect;
    
    CGFloat originX = 0;
    
    CGFloat originY = 0;
    
    CGFloat originW = self.bounds.size.width;
    
    CGFloat originH = self.bounds.size.height;
    
    
    switch (shadowPathSide) {
        case LXShadowPathTop:
            shadowRect  = CGRectMake(originX, originY - shadowPathWidth/2, originW,  shadowPathWidth);
            break;
        case LXShadowPathBottom:
            shadowRect  = CGRectMake(originX, originH -shadowPathWidth/2, originW, shadowPathWidth);
            break;
            
        case LXShadowPathLeft:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
            
        case LXShadowPathRight:
            shadowRect  = CGRectMake(originW - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
        case LXShadowPathNoTop:
            shadowRect  = CGRectMake(originX -shadowPathWidth/2, originY +1, originW +shadowPathWidth,originH + shadowPathWidth/2 );
            break;
        case LXShadowPathAllSide:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
            break;
            
    }
    
    UIBezierPath *path =[UIBezierPath bezierPathWithRect:shadowRect];
    
    self.layer.shadowPath = path.CGPath;
    
}


@end
