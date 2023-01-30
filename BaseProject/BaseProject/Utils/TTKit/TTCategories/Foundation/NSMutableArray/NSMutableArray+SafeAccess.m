//
//  NSMutableArray+SafeAccess.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "NSMutableArray+SafeAccess.h"

@implementation NSMutableArray (SafeAccess)

- (void)addSafeObject:(id)object
{
    if (object) {
        [self addObject:object];
    }
}

- (void)addString:(NSString *)stringValue
{
    [self addObject:stringValue ? stringValue : @""];
}

- (void)addBool:(BOOL)boolValue
{
    [self addObject:@(boolValue)];
}

- (void)addInt:(int)intValue
{
    [self addObject:@(intValue)];
}

- (void)addInteger:(NSInteger)integerValue
{
    [self addObject:@(integerValue)];
}

- (void)addUnsignedInteger:(NSUInteger)unsignedIntegerValue
{
    [self addObject:@(unsignedIntegerValue)];
}

- (void)addCGFloat:(CGFloat)CGFloatValue
{
    [self addObject:@(CGFloatValue)];
}

- (void)addChar:(char)charValue
{
    [self addObject:@(charValue)];
}

- (void)addFloat:(float)floatValue
{
    [self addObject:@(floatValue)];
}

- (void)addPoint:(CGPoint)pointValue
{
    [self addObject:NSStringFromCGPoint(pointValue)];
}

- (void)addSize:(CGSize)sizeValue
{
    [self addObject:NSStringFromCGSize(sizeValue)];
}

- (void)addRect:(CGRect)rectValue
{
    [self addObject:NSStringFromCGRect(rectValue)];
}


@end
