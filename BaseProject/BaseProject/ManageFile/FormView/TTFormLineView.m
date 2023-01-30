//
//  TTFormLineView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/17.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "TTFormLineView.h"


@interface TTFormLineView ()

@property (nonatomic, assign) CGFloat lineViewHeight;

@end

@implementation TTFormLineView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lineViewHeight = 8;
        self.backgroundColor = TT_FORMV_lineColor;
    }
    return self;
}

- (CGFloat)maxHeight {
    
    return self.lineViewHeight;
    
}

+ (TTFormLineView * (^)(void))line
{
    
    return ^(void) {
        
        TTFormLineView *lineView = [[TTFormLineView alloc] init];
        
        return lineView;
    };
}


- (TTFormLineView * (^)(UIColor *color))backgColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.backgroundColor = color;
        
        return selfWeak;
    };
}

- (TTFormLineView * (^)(CGFloat height))lineHeight
{
    @WeakObj(self);
    return ^(CGFloat height){
        
        selfWeak.lineViewHeight = height;
        
        return selfWeak;
    };
}


@end
