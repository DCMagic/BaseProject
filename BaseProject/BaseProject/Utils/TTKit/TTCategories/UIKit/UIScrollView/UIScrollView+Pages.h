//
//  UIScrollView+Pages.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Pages)

#pragma mark - # 横向分页
@property (nonatomic, assign, readonly) NSInteger numberOfPageX;
@property (nonatomic, assign) NSInteger pageX;
- (void)setPageX:(CGFloat)page animated:(BOOL)animated;

#pragma mark - # 纵向分页
@property (nonatomic, assign, readonly) NSInteger numberOfPageY;
@property (nonatomic, assign) NSInteger pageY;
- (void)setPageY:(CGFloat)page animated:(BOOL)animated;

@end
