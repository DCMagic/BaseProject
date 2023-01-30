//
//  TTFormView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "TTFormView.h"
#import "TTFormInputView.h"




@interface TTFormView ()

@property (nonatomic, assign) CGFloat space;

@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@property (nonatomic, strong) NSMutableArray<TTFormItemBaseView *> *itemArray;

@property (nonatomic, strong) NSMutableDictionary *itemCache;

@property (nonatomic, strong) NSMutableDictionary *inputCache;

@property (nonatomic, strong) NSMutableDictionary *lineCache;

@property (nonatomic, assign) CGFloat formHeight;

@property (nonatomic, assign) BOOL isCacheHeight;

@property (nonatomic, strong) UIView *backgView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TTFormView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, TT_FORMV_SCREEN_W, 0);
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:self.backgView];
        self.isCacheHeight = YES;
        
//        [self layoutView];
    }
    return self;
}

- (TTFormView * _Nonnull (^)(void))layout {
    @WeakObj(self);
    return ^(void) {

        [selfWeak layoutView];
        
        return selfWeak;
    };
}

- (TTFormView * _Nonnull (^)(void))removeAllItem {
    @WeakObj(self);
    return ^(void) {
        [self.backgView removeAllSubviews];
        return selfWeak;
    };
}


- (TTFormItemView * (^)(NSUInteger tag))item {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView == nil || ![itemView isKindOfClass:[TTFormItemView class]]) {
            itemView = [[TTFormItemView alloc] init];
            itemView.tag = tag;
            [selfWeak.itemCache setObject:itemView forKey:@(tag)];
            
        }
//        [selfWeak layoutView];
        return itemView;
    };
}

- (TTFormView * (^)(NSUInteger tag))removeTag {
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView) {
            [itemView removeFromSuperview];
        }
//        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSUInteger tag))copyOneItem {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView == nil || ![itemView isKindOfClass:[TTFormItemView class]]) {
            itemView = [[TTFormItemView alloc] init];
            itemView.tag = tag;
            [selfWeak.itemCache setObject:itemView forKey:@(tag)];
            
        }
        
        TTFormItemBaseView *copyItemView = selfWeak.itemArray.firstObject;
        if (copyItemView && [copyItemView isKindOfClass:[TTFormItemView class]]) {
            TTFormItemView *formatItemView = (TTFormItemView *)copyItemView;
            itemView = [formatItemView formatAtItem:itemView];
        }
        return itemView;
    };
}

- (TTFormItemView * (^)(NSUInteger tag))copyTwoItem {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView == nil || ![itemView isKindOfClass:[TTFormItemView class]]) {
            itemView = [[TTFormItemView alloc] init];
            itemView.tag = tag;
            [selfWeak.itemCache setObject:itemView forKey:@(tag)];
            
        }
        
        if (selfWeak.itemArray.count >= 2) {
            TTFormItemBaseView *copyItemView = selfWeak.itemArray[1];
            if (copyItemView && [copyItemView isKindOfClass:[TTFormItemView class]]) {
                TTFormItemView *formatItemView = (TTFormItemView *)copyItemView;
                itemView = [formatItemView formatAtItem:itemView];
            }
        }
        
        return itemView;
    };
}


- (TTFormItemView * _Nonnull (^)(NSUInteger tag, NSUInteger copyTag))copyItem {
    
    @WeakObj(self);
    return ^(NSUInteger tag, NSUInteger copyTag) {
        
        TTFormItemView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView == nil || ![itemView isKindOfClass:[TTFormItemView class]]) {
            itemView = [[TTFormItemView alloc] init];
            itemView.tag = tag;
            [selfWeak.itemCache setObject:itemView forKey:@(tag)];
            
        }
        TTFormItemView *copyItemView = [selfWeak.itemCache objectForKey:@(copyTag)];
        if (copyItemView) {
            itemView = [copyItemView formatAtItem:itemView];
        }
        
//        [selfWeak layoutView];
        return itemView;
    };
    
}



- (TTFormInputView * (^)(NSUInteger tag))input {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormInputView *itemView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (itemView == nil || ![itemView isKindOfClass:[TTFormInputView class]]) {
            itemView = [[TTFormInputView alloc] init];
            itemView.tag = tag;
            [selfWeak.itemCache setObject:itemView forKey:@(tag)];
        }
//        [selfWeak layoutView];
        return itemView;
    };
}


- (TTFormLineView * (^)(NSUInteger tag))line {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormLineView *lineView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (lineView == nil || ![lineView isKindOfClass:[TTFormLineView class]]) {
            lineView = [[TTFormLineView alloc] init];
            lineView.tag = tag;
            [selfWeak.itemCache setObject:lineView forKey:@(tag)];
        }
//        [selfWeak layoutView];
        return lineView;
    };
}


- (TTFormCheckboxView * (^)(NSUInteger tag))checkBox {
    
    @WeakObj(self);
    return ^(NSUInteger tag) {
        
        TTFormCheckboxView *checkBoxView = [selfWeak.itemCache objectForKey:@(tag)];
        
        if (checkBoxView == nil || ![checkBoxView isKindOfClass:[TTFormCheckboxView class]]) {
            checkBoxView = [[TTFormCheckboxView alloc] init];
            checkBoxView.tag = tag;
            [selfWeak.itemCache setObject:checkBoxView forKey:@(tag)];
        }
        return checkBoxView;
    };
}



+ (TTFormView * (^)(void))form
{
    
    return ^(void) {
        
        TTFormView *formView = [[TTFormView alloc] init];
        return formView;
    };
}

- (TTFormView * (^)(void))end {
    
    @WeakObj(self);
    return ^(void) {
        if (selfWeak.width <= 0) {
            selfWeak.width = TT_FORMV_SCREEN_W;
        }
        selfWeak.height = [selfWeak maxHeight];
        selfWeak.backgView.frame = selfWeak.bounds;
        
        return selfWeak;
    };
}

- (TTFormView * _Nonnull (^)(void))noCacheHeight {
    @WeakObj(self);
    return ^(void) {
        selfWeak.isCacheHeight = NO;
        return selfWeak;
    };
}

- (TTFormView * (^)(void))scroll {
    
    @WeakObj(self);
    return ^(void) {
//        [selfWeak.backgView removeFromSuperview];
//        selfWeak.scrollView.frame = selfWeak.bounds;
//        [selfWeak.scrollView addSubview:selfWeak.backgView];
//        [selfWeak addSubview:selfWeak.scrollView];
        [selfWeak.scrollView addSubview:self.backgView];
        [selfWeak addSubview:selfWeak.scrollView];
        selfWeak.scrollView.contentSize = CGSizeMake(0, [selfWeak maxHeight]);
        
        return selfWeak;
    };
}

- (TTFormView * (^)(CGFloat margin))margin {
    
    @WeakObj(self);
    return ^(CGFloat margin) {
        
        selfWeak.space = margin;
//        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormView * (^)(CGFloat edgeInsetAll))paddingAll {
    
    @WeakObj(self);
    return ^(CGFloat edgeInsetAll) {
        
        selfWeak.edgeInsets = UIEdgeInsetsMake(edgeInsetAll, edgeInsetAll, edgeInsetAll, edgeInsetAll);
//        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormView * (^)(UIEdgeInsets edgeInsets))padding {
    
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets) {
        
        selfWeak.edgeInsets = edgeInsets;
//        [selfWeak layoutView];
        return selfWeak;
    };
}



- (TTFormView * (^)(TTFormInputView *inputView))addInput
{
    @WeakObj(self);
    return ^(TTFormInputView *inputView) {
        
        [selfWeak.backgView addSubview:inputView];
        [selfWeak.itemArray addObject:inputView];
//        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormView * (^)(TTFormItemBaseView *itemView))addItem {
    @WeakObj(self);
    return ^(TTFormItemBaseView *itemView) {
        
        [selfWeak.backgView addSubview:itemView];
        [selfWeak.itemArray addObject:itemView];
//        [selfWeak layoutView];
        return selfWeak;
    };
}


- (CGFloat)maxHeight {
    
    if (self.formHeight > 0 && self.isCacheHeight) {
        return self.formHeight;
    }
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
    
    return self.formHeight;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_scrollView) {
        _scrollView.frame = self.bounds;
    }
    
    CGFloat itemTop = self.edgeInsets.top;
    
    for (int i = 0; i < self.backgView.subviews.count; i++) {
       UIView *subV = self.backgView.subviews[i];
        
        if ([subV isKindOfClass:[TTFormItemBaseView class]]) {
            
            TTFormItemBaseView *subView = (TTFormItemBaseView *)subV;
            
            if (i > 0) {
                TTFormItemBaseView *lastView = (TTFormItemBaseView *)self.backgView.subviews[i - 1];
                
                itemTop = itemTop + self.space + lastView.maxHeight;
                
            }
            subView.top = itemTop;
            subView.width = self.width - self.edgeInsets.left - self.edgeInsets.right;
            subView.height = [subView maxHeight];
            subView.left = self.edgeInsets.left;
            
            
//            if ([subView isKindOfClass:[TTFormItemView class]]) {
//                self.lastItem = (TTFormItemView *)subView;
//            }
            
        }
    }
    
    TTFormItemBaseView *lastView = self.backgView.subviews.lastObject;
    
    self.backgView.height = itemTop + lastView.maxHeight + self.edgeInsets.bottom;

    // 防止与自定布局冲突，自动布局时 self.width == 0  高度算不出来
    if (self.width > 0) {
        self.formHeight = itemTop + lastView.maxHeight + self.edgeInsets.bottom;
    }

    [self layoutIfNeeded];
    
}

- (void)layoutView {

}


- (TTFormItemView *)lastItem {
    TTFormItemView *lastV;
    for (UIView *subV in self.backgView.subviews) {
        if ([subV isKindOfClass:[TTFormItemView class]]) {
            lastV = (TTFormItemView *)subV;
        }
    }
    return lastV;
}

- (NSMutableDictionary *)inputCache {
    if (!_inputCache) {
        _inputCache = [NSMutableDictionary dictionary];
    }
    return _inputCache;
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

- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}


- (UIView *)backgView {
    if (!_backgView) {
        _backgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TT_FORMV_SCREEN_W, 0)];
    }
    return _backgView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, TT_FORMV_SCREEN_W, 0)];
    }
    return _scrollView;
}


@end
