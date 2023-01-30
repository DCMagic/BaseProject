//
//  UICollectionViewCell+Extensions.m
//  TTKit
//
//  Created by tao6 on 2017/7/17.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import "UICollectionViewCell+Extensions.h"

@implementation UICollectionViewCell (Extensions)

- (void)setSelectedBackgrounColor:(UIColor *)selectedBackgrounColor
{
    if (selectedBackgrounColor) {
        UIView *selectedBGView = [[UIView alloc] init];
        [selectedBGView setBackgroundColor:selectedBackgrounColor];
        [self setSelectedBackgroundView:selectedBGView];
    }
    else {
        [self setSelectedBackgroundView:nil];
    }
}
- (UIColor *)selectedBackgrounColor
{
    return self.selectedBackgroundView.backgroundColor;
}

@end
