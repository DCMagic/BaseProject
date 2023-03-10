//
//  TTShortcutMethod.m
//  TTKit
//
//  Created by tao6 on 2017/9/7.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import "TTShortcutMethod.h"

UILabel *createLabel(UIFont *textFont, UIColor *textColor)
{
    UILabel *label = [[UILabel alloc] init];
    [label setFont:textFont];
    [label setTextColor:textColor];
    return label;
}

UIButton *createButton(UIFont *titleFont, UIColor *titleColor, id target, SEL touchUpInsideAction)
{
    UIButton *button = [[UIButton alloc] init];
    !titleFont ? : [button.titleLabel setFont:titleFont];
    !titleFont ? : [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (target && touchUpInsideAction) {
        [button addTarget:target action:touchUpInsideAction forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}
