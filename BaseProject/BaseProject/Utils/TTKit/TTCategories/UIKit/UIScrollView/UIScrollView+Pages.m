//
//  UIScrollView+Pages.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIScrollView+Pages.h"

@implementation UIScrollView (Pages)

#pragma mark - # 横向分页
- (NSInteger)numberOfPageX
{
    NSInteger pages = self.contentSize.width / self.frame.size.width;
    return pages;
}

- (NSInteger)pageX
{
    NSInteger pageX = self.contentOffset.x / self.frame.size.width;
    return pageX;
}

- (void)setPageX:(NSInteger)pageX
{
    [self setPageX:pageX animated:NO];
}

- (void)setPageX:(CGFloat)page animated:(BOOL)animated
{
    CGFloat offsetX = self.frame.size.width * page;
    [self setContentOffset:CGPointMake(offsetX, 0) animated:animated];
}

#pragma mark - # 纵向分页
- (NSInteger)numberOfPageY
{
    NSInteger pages = self.contentSize.height / self.frame.size.height;
    return pages;
}

- (NSInteger)pageY
{
    NSInteger pageY = self.contentOffset.y / self.frame.size.height;
    return pageY;
}

- (void)setPageY:(NSInteger)pageY
{
    [self setPageX:pageY animated:NO];
}

- (void)setPageY:(CGFloat)page animated:(BOOL)animated
{
    CGFloat offsetY = self.frame.size.height * page;
    [self setContentOffset:CGPointMake(0, offsetY) animated:animated];
}

@end
