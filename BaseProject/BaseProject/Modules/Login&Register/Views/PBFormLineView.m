//
//  PBFormLineView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/17.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBFormLineView.h"


@interface PBFormLineView ()

@property (nonatomic, assign) CGFloat lineViewHeight;

@end

@implementation PBFormLineView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineViewHeight = 8;
        self.backgroundColor = kBackgColor;
    }
    return self;
}

- (CGFloat)maxHeight {
    
    return self.lineViewHeight;
    
}

+ (PBFormLineView * (^)(void))line
{
    
    return ^(void) {
        
        PBFormLineView *lineView = [[PBFormLineView alloc] init];
        
        return lineView;
    };
}


- (PBFormLineView * (^)(UIColor *color))backgColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.backgroundColor = color;
        
        return selfWeak;
    };
}

- (PBFormLineView * (^)(CGFloat height))lineHeight
{
    @WeakObj(self);
    return ^(CGFloat height){
        
        selfWeak.lineViewHeight = height;
        
        return selfWeak;
    };
}


@end
