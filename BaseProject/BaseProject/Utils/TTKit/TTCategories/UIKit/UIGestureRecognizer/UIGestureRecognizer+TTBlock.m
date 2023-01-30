//
//  UIGestureRecognizer+TTBlock.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIGestureRecognizer+TTBlock.h"

static const int AssociatedTarget_key;

@implementation UIGestureRecognizer (TTBlock)

+ (instancetype)tt_gestureRecognizerWithBlock:(TTGestureBlock)block {
    return [[self alloc] initWithGestureBlock:block];
}

- (instancetype)initWithGestureBlock:(TTGestureBlock)block {
    self = [self init];
    [self addBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

- (void)addBlock:(TTGestureBlock)block {
    if (block) {
        objc_setAssociatedObject(self, &AssociatedTarget_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender {
    TTGestureBlock block = objc_getAssociatedObject(self, &AssociatedTarget_key);
    if (block) {
        block();
    }
}


@end
