//
//  PBFormCheckboxView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBFormCheckboxView.h"

@interface PBFormCheckboxView()

@property (nonatomic, strong) UIFont *fontp;

@property (nonatomic, strong) UIColor *textColorp;

@property (nonatomic, copy) NSArray<NSString *> *optionTitlesp;


@property (nonatomic, copy) NSArray *checkboxArr;



@end

@implementation PBFormCheckboxView


+ (PBFormCheckboxView * (^)(void))checkbox
{

    return ^(void) {

        PBFormCheckboxView *checkbox = [[PBFormCheckboxView alloc] init];

        return checkbox;
    };
}


- (PBFormCheckboxView * (^)(NSArray<NSString *> *optionTitles))options
{
    @WeakObj(self);
    return ^(NSArray<NSString *> *optionTitles) {
        
        selfWeak.optionTitlesp = optionTitles;
        
        return selfWeak;
    };
}


- (PBFormCheckboxView * (^)(UIFont *font))font
{
    @WeakObj(self);
    return ^(UIFont *font) {

        selfWeak.fontp = font;

        [self createCheckbox];
        
        return selfWeak;
    };
}

- (PBFormCheckboxView * (^)(UIColor *textColor))textColor
{
    @WeakObj(self);
    return ^(UIColor *textColor) {
        
        selfWeak.textColorp = textColor;
        
        [self createCheckbox];
        
        return selfWeak;
    };
}



// 创建Checkbox
- (void)createCheckbox{
    
    NSArray<NSString *> *optionTitles = self.optionTitlesp;
    
    NSMutableArray *checkboxM = [NSMutableArray array];
    
    for (int i = 0; i < optionTitles.count; i++) {
        NSString *optionTitle = optionTitles[i];
        
        UIButton *optionBtn;
        
        if (self.checkboxArr.count > i) {
            optionBtn = self.checkboxArr[i];
        }
        
        if (optionBtn == nil) {
            optionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        }
        
        [optionBtn setTitle:optionTitle forState:(UIControlStateNormal)];
        [optionBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        if (self.textColorp != nil) {
            [optionBtn setTitleColor:self.textColorp forState:(UIControlStateNormal)];
        }
        if (self.fontp != nil) {
            optionBtn.titleLabel.font = self.fontp;
        }
        
        [checkboxM addObject:optionBtn];
        
    }

    self.checkboxArr = checkboxM.copy;
}


@end
