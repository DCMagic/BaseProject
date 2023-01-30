//
//  UIBarButtonItem+Action.h
//  TTKit
//
//  Created by tao6 on 2017/8/28.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TTBarButtonActionBlock)(void);

@interface UIBarButtonItem (Action)

+ (id)fixItemSpace:(CGFloat)space;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(TTBarButtonActionBlock)actionBlock;

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(TTBarButtonActionBlock)actionBlock;

- (void)setActionBlock:(TTBarButtonActionBlock)actionBlock;

@end
