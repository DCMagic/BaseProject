//
//  NSObject+data.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "NSObject+data.h"
#import <objc/runtime.h>

static const char kUIViewDataKey;

@implementation NSObject (data)

@dynamic data;

- (void)setData:(id)data {
    [self dataWillChange];
    objc_setAssociatedObject(self, &kUIViewDataKey, data, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self dataDidChange];
}

- (id)data {
    return objc_getAssociatedObject(self, &kUIViewDataKey);
}

- (void)dataWillChange {
    // to implement
}

- (void)dataDidChange {
    // to implement
}

@end
