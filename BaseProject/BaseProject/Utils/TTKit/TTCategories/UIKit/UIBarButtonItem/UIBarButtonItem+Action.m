//
//  UIBarButtonItem+Action.m
//  TTKit
//
//  Created by tao6 on 2017/8/28.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import "UIBarButtonItem+Action.h"
#import <objc/runtime.h>

char * const UIBarButtonItemActionBlock = "UIBarButtonItemActionBlock";

@implementation UIBarButtonItem (Action)

+ (id)fixItemSpace:(CGFloat)space
{
    UIBarButtonItem *fix = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix.width = space;
    return fix;
}

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(TTBarButtonActionBlock)actionBlock
{
    if (self = [self initWithTitle:title style:style target:nil action:nil]) {
        [self setActionBlock:actionBlock];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(TTBarButtonActionBlock)actionBlock
{
    if (self = [self initWithImage:image style:style target:nil action:nil]) {
        [self setActionBlock:actionBlock];
    }
    return self;
}

- (void)performActionBlock {
    dispatch_block_t block = self.actionBlock;
    
    if (block)
        block();
}

- (TTBarButtonActionBlock)actionBlock {
    return objc_getAssociatedObject(self, UIBarButtonItemActionBlock);
}

- (void)setActionBlock:(TTBarButtonActionBlock)actionBlock {
    if (actionBlock != self.actionBlock) {
        [self willChangeValueForKey:@"actionBlock"];
        
        objc_setAssociatedObject(self, UIBarButtonItemActionBlock, actionBlock, OBJC_ASSOCIATION_COPY);
        
        [self setTarget:self];
        [self setAction:@selector(performActionBlock)];
        
        [self didChangeValueForKey:@"actionBlock"];
    }
}
@end
