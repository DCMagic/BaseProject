//
//  UIScrollView+iOS11Fixed.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIScrollView+iOS11Fixed.h"

@implementation UIScrollView (iOS11Fixed)

- (void)setNeverAdjustmentContentInset:(BOOL)neverAdjustmentContentInset
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
}
- (BOOL)neverAdjustmentContentInset
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        return self.contentInsetAdjustmentBehavior;
    }
#endif
    return NO;
}

@end
