//
//  PBFormView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBFormView.h"
#import "PBFormInputView.h"



@interface PBFormView ()

@property (nonatomic, assign) CGFloat space;

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@property (nonatomic, strong) NSMutableDictionary *itemCache;

@property (nonatomic, strong) NSMutableDictionary *lineCache;

@property (nonatomic, assign) CGFloat formHeight;

@end

@implementation PBFormView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}


- (PBFormItemView * (^)(NSUInteger tag))item {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        PBFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView == nil) {
            itemView = [[PBFormItemView alloc] init];
            itemView.tag = tag;
            [selfWeak.itemCache setObject:itemView forKey:@(tag)];
        }
        
        return itemView;
    };
}

- (PBFormView * (^)(NSUInteger tag))removeTag {
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        PBFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView) {
            [itemView removeFromSuperview];
        }
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormLineView * (^)(NSUInteger tag))line {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        PBFormLineView *lineView = [selfWeak.lineCache objectForKey:@(tag)];
        
        if (lineView == nil) {
            lineView = [[PBFormLineView alloc] init];
            lineView.tag = tag;
            [selfWeak.lineCache setObject:lineView forKey:@(tag)];
        }
        
        return lineView;
    };
}



+ (PBFormView * (^)(void))form
{
    
    return ^(void) {
        
        PBFormView *formView = [[PBFormView alloc] init];
        
        return formView;
    };
}

- (PBFormView * (^)(void))end {
    
    @WeakObj(self);
    return ^(void) {
        
        selfWeak.width = PhoneScreen_WIDTH;
        selfWeak.height = [selfWeak maxHeight];
        
        return selfWeak;
    };
}

- (PBFormView * (^)(CGFloat margin))margin {
    
    @WeakObj(self);
    return ^(CGFloat margin) {
        
        selfWeak.space = margin;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormView * (^)(CGFloat edgeInsetAll))paddingAll {
    
    @WeakObj(self);
    return ^(CGFloat edgeInsetAll) {
        
        selfWeak.edgeInsets = UIEdgeInsetsMake(edgeInsetAll, edgeInsetAll, edgeInsetAll, edgeInsetAll);
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormView * (^)(UIEdgeInsets edgeInsets))padding {
    
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets) {
        
        selfWeak.edgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}



- (PBFormView * (^)(PBFormInputView *inputView))addInput
{
    @WeakObj(self);
    return ^(PBFormInputView *inputView) {
        
        [selfWeak addSubview:inputView];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormView * (^)(PBFormItemBaseView *itemView))addItem {
    @WeakObj(self);
    return ^(PBFormItemBaseView *itemView) {
        
        [selfWeak addSubview:itemView];
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (CGFloat)maxHeight {
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    return self.formHeight;
}



- (void)layoutView {
    
    CGFloat itemTop = self.edgeInsets.top;
    
    for (int i = 0; i < self.subviews.count; i++) {
        PBFormItemBaseView *subView = (PBFormItemBaseView *)self.subviews[i];

        if (i > 0) {
            PBFormItemBaseView *lastView = (PBFormItemBaseView *)self.subviews[i - 1];
            
            itemTop = itemTop + self.space + lastView.maxHeight;

        }

        [subView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).mas_offset(itemTop);
            make.left.mas_equalTo(self.mas_left).mas_offset(self.edgeInsets.left);
            make.right.mas_equalTo(self.mas_right).mas_offset(self.edgeInsets.right);
            make.height.mas_equalTo([subView maxHeight]);
        }];
        
    }
    
    PBFormItemBaseView *lastView = self.subviews.lastObject;
    
    self.formHeight = itemTop + lastView.maxHeight + self.edgeInsets.bottom;

}


- (NSMutableDictionary *)itemCache {
    if (!_itemCache) {
        _itemCache = [NSMutableDictionary dictionary];
    }
    return _itemCache;
}

- (NSMutableDictionary *)lineCache {
    if (!_lineCache) {
        _lineCache = [NSMutableDictionary dictionary];
    }
    return _lineCache;
}



@end
