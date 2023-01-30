//
//  TTFormCheckboxView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "TTFormCheckboxView.h"

@interface TTFormCheckboxView()

@property (nonatomic, strong) UIFont *fontp;
@property (nonatomic, strong) UIColor *textColorp;
@property (nonatomic, copy) NSArray<NSString *> *optionTitlesp;
@property (nonatomic, copy) NSArray *checkboxArr;
@property (nonatomic, assign) UIEdgeInsets contentViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets lineViewEdgeInsets;
@property (nonatomic, strong) UIView        *itemLine;     // 下划线
@property (nonatomic, assign) CGFloat lineH;
@property (nonatomic, strong) NSMutableArray *selectedArr; // 选中项
// 选择类型
@property (nonatomic, assign) FormSelectedType selectedTypep;

@property (nonatomic, strong) UIImage *normalImg;
@property (nonatomic, strong) UIImage *selectedImg;

@property (nonatomic, copy) void (^selectedBlockp)(NSArray *selectedArr);

// 选中图片


@end

@implementation TTFormCheckboxView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fontp = TT_FORMV_Font(16);
        self.textColorp =UIColor.blackColor;
        self.lineH = 0.5;
        self.normalImg = [self checkboxNormalColor];
        self.selectedImg = [self checkboxSelectedColor];
        self.selectedArr = [NSMutableArray array];
        [self buildView];
    }
    return self;
}



- (void)buildView {
    
    self.lineViewEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
    self.contentViewEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGFloat)maxHeight {
    
    return self.contentViewEdgeInsets.top + self.contentViewEdgeInsets.bottom + self.fontp.lineHeight;
}


+ (TTFormCheckboxView * (^)(void))checkbox
{

    return ^(void) {

        TTFormCheckboxView *checkbox = [[TTFormCheckboxView alloc] init];

        return checkbox;
    };
}


- (TTFormCheckboxView * (^)(NSArray<NSString *> *optionTitles))options
{
    @WeakObj(self);
    return ^(NSArray<NSString *> *optionTitles) {
        
        selfWeak.optionTitlesp = optionTitles;
        [selfWeak createCheckbox];
        return selfWeak;
    };
}


- (TTFormCheckboxView * (^)(UIFont *font))font
{
    @WeakObj(self);
    return ^(UIFont *font) {

        selfWeak.fontp = font;

        [self createCheckbox];
        
        return selfWeak;
    };
}

- (TTFormCheckboxView * (^)(UIColor *textColor))textColor
{
    @WeakObj(self);
    return ^(UIColor *textColor) {
        
        selfWeak.textColorp = textColor;
        
        [self createCheckbox];
        
        return selfWeak;
    };
}


- (TTFormCheckboxView *(^)(UIImage *image))normalIcon {
    @WeakObj(self);
    return ^(UIImage *image) {
        
        selfWeak.normalImg = image;
        
        return selfWeak;
    };
}

- (TTFormCheckboxView *(^)(UIImage *))selectedIcon {
    @WeakObj(self);
    return ^(UIImage *image) {
        
        selfWeak.selectedImg = image;
        
        return selfWeak;
    };
}


- (TTFormCheckboxView * (^)(UIColor *color))lineColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.itemLine.hidden = NO;
        selfWeak.itemLine.backgroundColor = color;
        
        return selfWeak;
    };
}

- (TTFormCheckboxView * (^)(CGFloat height))lineHeight
{
    @WeakObj(self);
    return ^(CGFloat height){
        
        selfWeak.itemLine.hidden = NO;
        selfWeak.lineH = height;
        
        return selfWeak;
    };
}

- (TTFormCheckboxView * (^)(UIEdgeInsets edgeInsets))lineEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.lineViewEdgeInsets = edgeInsets;
        
        return selfWeak;
    };
}

- (TTFormCheckboxView * (^)(UIEdgeInsets edgeInsets))contentEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        
        selfWeak.contentViewEdgeInsets = edgeInsets;
        
        return selfWeak;
    };
}


- (TTFormCheckboxView *(^)(NSArray *selectedArr))selectedOption {
    @WeakObj(self);
    return ^(NSArray *selectedArr){
        
        selfWeak.selectedArr = selectedArr.mutableCopy;
        
        return selfWeak;
    };
}



// 创建Checkbox
- (void)createCheckbox{
    
    NSArray<NSString *> *optionTitles = self.optionTitlesp;
    
    NSMutableArray *checkboxM = [NSMutableArray array];
    
    CGFloat titleMaxWidht = 0;
    // 计算最大的宽度
    for (NSString *title in optionTitles) {
        
        CGRect rect = [title boundingRectWithSize:CGSizeMake(self.width - (self.contentViewEdgeInsets.left + self.contentViewEdgeInsets.right),0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.fontp} context:nil];
        titleMaxWidht = MAX(titleMaxWidht, rect.size.width);
    }
    // 计算屏幕显示最大宽度
    CGFloat maxWidth = (self.width - (self.contentViewEdgeInsets.left + self.contentViewEdgeInsets.right)) / optionTitles.count - 30;
    
    titleMaxWidht = MIN(maxWidth, titleMaxWidht);
    
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
        [optionBtn setImage:self.normalImg forState:(UIControlStateNormal)];
        [optionBtn setImage:self.selectedImg forState:(UIControlStateSelected)];
        optionBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        
        [optionBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        
        if (self.textColorp != nil) {
            [optionBtn setTitleColor:self.textColorp forState:(UIControlStateNormal)];
        }
        if (self.fontp != nil) {
            optionBtn.titleLabel.font = self.fontp;
        }
        
        optionBtn.tag = i;
        
        [checkboxM addObject:optionBtn];
        [self addSubview:optionBtn];

        CGFloat btnWidht = titleMaxWidht + 30;
        
        CGFloat margin = ((self.width - self.contentViewEdgeInsets.left - self.contentViewEdgeInsets.right) - btnWidht * optionTitles.count)/(optionTitles.count - 1);
        margin = MAX(margin, 0);
        
        optionBtn.frame = CGRectMake(self.contentViewEdgeInsets.left + (btnWidht + margin) * i , 0, btnWidht, self.height);
        [optionBtn addTarget:self action:@selector(optionBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        
        // 选中
        
        if ([self.selectedArr containsObject:@(i).stringValue]) {
            optionBtn.selected = YES;
        }else {
            optionBtn.selected = NO;
        }
    }

    self.checkboxArr = checkboxM.copy;
}

- (void)optionBtnClick:(UIButton *)sender {
    
    if (self.selectedTypep == FormSelectedTypeSingle) {
        [self.selectedArr removeAllObjects];
        for (UIButton *optionBtn in self.checkboxArr) {
            if (optionBtn != sender) {
                optionBtn.selected = NO;
            }
        }
    }
    
    sender.selected = !sender.isSelected;
    if (sender.selected) {
        if (![self.selectedArr containsObject:@(sender.tag).stringValue]) {
            [self.selectedArr addObject:@(sender.tag).stringValue];
        }
    }else {
        [self.selectedArr removeObject:@(sender.tag).stringValue];
    }
    
    if (self.selectedBlockp) {
        self.selectedBlockp(self.selectedArr);
    }
}



- (TTFormCheckboxView *(^)(void (^selectedBlock)(NSArray *selectedArr)))selectedBlock
{
    @WeakObj(self);
    return ^TTFormCheckboxView *(void (^selectedBlock)(NSArray *selectedArr)) {
        
        selfWeak.selectedBlockp = selectedBlock;
        
        return selfWeak;
    };
}


- (TTFormCheckboxView *(^)(FormSelectedType selectedType))selectedType {
    @WeakObj(self);
    return ^TTFormCheckboxView *(FormSelectedType selectedType) {
        
        selfWeak.selectedTypep = selectedType;
        
        return selfWeak;
    };
}


#pragma mark - # 方法

// 选中图片
- (UIImage *)checkboxSelectedColor {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(10.f, 10.0f) radius:9.5f startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    UIColor *fillColor3 = TT_FORMV_lineColor;
    [fillColor3 set];
    [path1 stroke];
    
    UIColor *fillColor1 = TT_FORMV_HexColor(0xFFEEEDED);
    [fillColor1 set];
    [path1 fill];
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(10.f, 10.0f) radius:7.0f startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    UIColor *fillColor2 = TT_FORMV_ThemeColor;
    [fillColor2 set];
    [path2 fill];
    
    CGContextDrawPath(context, kCGPathStroke);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

// 默认图片
- (UIImage *)checkboxNormalColor {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(10.f, 10.0f) radius:10.0f startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    UIColor *fillColor1 = TT_FORMV_HexColor(0xFFEEEDED);
    [fillColor1 set];
    [path1 fill];
    
    CGContextDrawPath(context, kCGPathStroke);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.itemLine.width = self.width - self.lineViewEdgeInsets.left - self.lineViewEdgeInsets.right;
    self.itemLine.height = self.lineH;
    self.itemLine.left = self.lineViewEdgeInsets.left;
    self.itemLine.top = self.height - self.lineH;
    
    [self createCheckbox];
}

- (UIView *)itemLine {
    if (!_itemLine) {
        _itemLine = [[UIView alloc] init];
        _itemLine.backgroundColor = [UIColor grayColor];
        _itemLine.hidden = YES;
        [self addSubview:_itemLine];
        
    }
    return _itemLine;
}


@end
