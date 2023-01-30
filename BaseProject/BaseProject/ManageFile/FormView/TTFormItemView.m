//
//  TTFormItemView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "TTFormItemView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TTFormItemView ()<UITextFieldDelegate>


@property (nonatomic, strong) UILabel   *itemLabel;       // itemlabel
@property (nonatomic, strong) UIView        *itemLine;     // 下划线
@property (nonatomic, assign) CGRect headFrame;            // 头像frame
@property (nonatomic, assign) BOOL isShowHead;            // 是否显示头像
@property (nonatomic, assign) UIEdgeInsets lineViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets contentViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets leftContentEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets leftTitleContentEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets rightContentEdgeInsets;

@property (nonatomic, copy) NSString *textString;
@property (nonatomic, copy) NSAttributedString *attributedText;
@property (nonatomic, assign) CGFloat lineH;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) NSString *xleftTitle;
@property (nonatomic, strong) UIImage *xleftImage;
@property (nonatomic, strong) UIFont *xleftFont;
@property (nonatomic, strong) UIColor *xleftColor;
@property (nonatomic, assign) UIControlContentHorizontalAlignment leftAlignment;

@property (nonatomic, strong) UIButton *xrightBtn;
@property (nonatomic, strong) UIFont *xrightFont;
@property (nonatomic, strong) UIColor *xrightColor;
@property (nonatomic, assign) CGFloat xrightHeight;
// 字体
@property (nonatomic, strong) UIFont *textFont;

@property (nonatomic, assign) NSInteger lineNum;
// 始终靠右显示
@property (nonatomic, assign) BOOL multiLineLeft;

// 自定义视图
@property (nonatomic, strong) UIView *customV;

// 头像宽高
@property (nonatomic, assign) NSInteger headViewWH;

// 头像阴影控件
@property (nonatomic, strong) UIView *headShadowView;

@end

@implementation TTFormItemView




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.headFrame = CGRectMake(0, 0, 63, 63);
        self.lineH = 0.5;
        self.headViewWH = 64;
        [self buildView];
    }
    return self;
}



- (void)buildView {
    
    self.lineViewEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
    self.contentViewEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    [self layoutView];
}

- (CGFloat)maxHeight {
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    return self.itemLine.maxY + self.lineViewEdgeInsets.bottom;
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_headView == nil) {
        
        [self.itemTF sizeToFit];
        self.itemTF.width = self.width - self.contentViewEdgeInsets.left - self.contentViewEdgeInsets.right;
        self.itemTF.left = self.contentViewEdgeInsets.left;
        self.itemTF.top = self.contentViewEdgeInsets.top;
        
        UIView *itemContent = self.itemTF;
        
        if (_itemLabel) {
            itemContent = _itemLabel;
            _itemLabel.font = self.itemTF.font;
            _itemLabel.textAlignment = self.itemTF.textAlignment;
            _itemLabel.textColor = self.itemTF.textColor;
            if (self.itemTF.text.length > 0 && ![self.itemTF.text isEqualToString:@" "]) {
                _itemLabel.text = self.textString;
                if (self.attributedText.length > 0) {
                    _itemLabel.text = @"";
                    _itemLabel.attributedText = self.attributedText;
                }
                self.itemTF.text = @" ";
            }else if (self.itemTF.text.length == 0) {
                _itemLabel.text = self.textString;
            }
            
            _itemLabel.width = self.itemTF.width - self.itemTF.leftView.width - self.itemTF.rightView.width;
            [_itemLabel sizeToFit];
            _itemLabel.width = self.itemTF.width - self.itemTF.leftView.width - self.itemTF.rightView.width;
            _itemLabel.left = self.itemTF.left + self.itemTF.leftView.width;
            _itemLabel.top = self.itemTF.top;
            
            if (_itemLabel.height < self.itemTF.height) {
                _itemLabel.height = self.itemTF.height;
            }
        }
        
        // 布局 CustomV
        [self layoutCustomV];
        if (_customV) {
            itemContent = _customV;
        }
        
        self.itemLine.width = self.width - self.lineViewEdgeInsets.left - self.lineViewEdgeInsets.right;
        self.itemLine.height = self.lineH;
        self.itemLine.left = self.lineViewEdgeInsets.left;
        self.itemLine.top = itemContent.maxY + self.contentViewEdgeInsets.bottom - self.lineH;
    }else {
        
        self.headView.width = TT_FORMV_Adaptation_6(self.headViewWH);
        self.headView.height = TT_FORMV_Adaptation_6(self.headViewWH);
        self.headView.top = self.contentViewEdgeInsets.top;
        self.headView.right = self.itemTF.right - self.itemTF.rightView.width;
        self.headView.layer.cornerRadius = TT_FORMV_Adaptation_6(self.headViewWH * 0.5);
        self.headView.clipsToBounds = YES;
        
        self.headShadowView.frame = self.headView.frame;
        self.headShadowView.layer.cornerRadius = TT_FORMV_Adaptation_6(self.headViewWH * 0.5);
        
        
        self.itemTF.width = self.width - self.contentViewEdgeInsets.left - self.contentViewEdgeInsets.right;
        self.itemTF.left = self.contentViewEdgeInsets.left;
        self.itemTF.centerY = self.headView.centerY;
        self.itemTF.height = 20;
        
        self.itemLine.width = self.width - self.lineViewEdgeInsets.left - self.lineViewEdgeInsets.right;
        self.itemLine.height = self.lineH;
        self.itemLine.left = self.lineViewEdgeInsets.left;
        self.itemLine.top = self.headView.maxY + self.contentViewEdgeInsets.bottom - self.lineH;

        
    }

    [self layoutIfNeeded];
}




// 布局 customV
- (void)layoutCustomV {
    if (_customV) {
        CGFloat customV_W = self.itemTF.width - self.itemTF.leftView.width - self.itemTF.rightView.width;
        
        // 缩放比例
        _customV.transform = CGAffineTransformMakeScale(1.0, 1.0);
        CGFloat transform = customV_W / _customV.width;
        _customV.transform = CGAffineTransformMakeScale(transform, transform);
        
        _customV.top = self.itemTF.top;
        _customV.left = self.itemTF.leftView.width + self.contentViewEdgeInsets.left;
        
        if (_customV.height < self.itemTF.height) {
            _customV.height = self.itemTF.height;
        }
        
    }
}

- (NSString *)textFieldText {
    NSString *textString = @"";
    
    if (self.textString.length > 0) {
        textString = self.textString;
    }
    if (self.itemTF.text.length > 0) {
        textString = self.itemTF.text;
    }
    if (_itemLabel.text.length > 0) {
        textString = _itemLabel.text;
    }
    
    return textString;
}


- (void)layoutView {
    [self layoutSubviews];
}

- (TTFormItemView * _Nonnull (^)(void))layout {
    @WeakObj(self);
    return ^(void) {
        
        [selfWeak layoutView];
        
        return selfWeak;
    };
}


+ (TTFormItemView * (^)(void))item
{
    
    return ^(void) {
        
        TTFormItemView *itemView = [[TTFormItemView alloc] init];
        
        return itemView;
    };
}


- (TTFormItemView *(^)(void (^eventBlock)(id sender)))eventBlock
{
    @WeakObj(self);
    return ^TTFormItemView *(void (^eventBlock)(id sender)) {
        [selfWeak addGestureRecognizer:[UITapGestureRecognizer tt_gestureRecognizerWithBlock:^{
            
            if (selfWeak.isShowHead) {
                eventBlock(selfWeak.headView);
            }else {
                eventBlock(selfWeak.itemTF);
            }
            
        }]];
        return selfWeak;
    };
}


- (TTFormItemView * (^)(NSString *placeholder))placeholder
{
    @WeakObj(self);
    return ^(NSString *placeholder) {
        
        selfWeak.itemTF.placeholder = placeholder;

        return selfWeak;
    };
}



- (TTFormItemView * (^)(UIFont *font))font
{
    @WeakObj(self);
    return ^(UIFont *font) {
        
        selfWeak.itemTF.font = font;
        
        selfWeak.itemTF.height = font.lineHeight;
        
        selfWeak.textFont = font;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIColor *textColor))textColor
{
    @WeakObj(self);
    return ^(UIColor *textColor) {
        
        selfWeak.itemTF.textColor = textColor;

        return selfWeak;
    };
}

- (TTFormItemView * _Nonnull (^)(NSUInteger))numberOfLines
{
    @WeakObj(self);
    return ^(NSUInteger numberOfLines) {
        
        selfWeak.lineNum = numberOfLines;
        selfWeak.itemLabel.numberOfLines = numberOfLines;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSString *text))text
{
    @WeakObj(self);
    return ^(NSString *text) {
        
        selfWeak.textString = text;
        selfWeak.itemLabel.text = text;
        selfWeak.itemTF.text = @" ";

        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSAttributedString *attrText))attrText
{
    @WeakObj(self);
    return ^(NSAttributedString *attrText) {
        
        selfWeak.attributedText = attrText;
        selfWeak.itemLabel.attributedText = attrText;
        selfWeak.itemTF.text = @" ";
        
        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSTextAlignment textAlignment))textAlignment
{
    @WeakObj(self);
    return ^(NSTextAlignment textAlignment) {
        
        selfWeak.itemTF.textAlignment = textAlignment;

        return selfWeak;
    };
}

- (TTFormItemView * _Nonnull (^)(BOOL textMultiLineLeft))textMultiLineLeft {
    
    @WeakObj(self);
    return ^(BOOL textMultiLineLeft) {
        
        selfWeak.multiLineLeft = textMultiLineLeft;
        
        return selfWeak;
    };
    
}


- (TTFormItemView * _Nonnull (^)(BOOL isHidden))rightHidden {
    @WeakObj(self);
    return ^(BOOL isHidden) {
        
        selfWeak.itemTF.rightView.hidden = isHidden;
        
        return selfWeak;
    };
}


- (TTFormItemView * (^)(NSString *imageName))rightIcon
{
    @WeakObj(self);
    return ^(NSString *imageName) {
        
        if (!selfWeak.xrightBtn) {
            selfWeak.xrightBtn = [[UIButton alloc] init];
            selfWeak.xrightBtn.userInteractionEnabled = NO;
            [selfWeak.xrightBtn setTitleColor:TT_FORMV_WordColor forState:(UIControlStateNormal)];
            selfWeak.xrightBtn.titleLabel.font = TT_FORMV_Font(16);
            
        }
        
        if (selfWeak.xrightFont) {
            selfWeak.xrightBtn.titleLabel.font = selfWeak.xrightFont;
        }
        
        if (selfWeak.xrightColor) {
            [selfWeak.xrightBtn setTitleColor:selfWeak.xrightColor forState:(UIControlStateNormal)];
        }
        
        
        selfWeak.xrightBtn.contentEdgeInsets = selfWeak.rightContentEdgeInsets;
        
        [selfWeak.xrightBtn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
        selfWeak.xrightBtn.userInteractionEnabled = NO;
        [selfWeak.xrightBtn sizeToFit];
        
        if (selfWeak.xrightHeight) {
            selfWeak.xrightBtn.height = selfWeak.xrightHeight;
        }
        
        if (selfWeak.xrightBtn.titleLabel.text.length > 0) {
            selfWeak.xrightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, TT_FORMV_Adaptation_6(16), 0, 0);
            selfWeak.xrightBtn.width += TT_FORMV_Adaptation_6(16);
        }
        selfWeak.itemTF.rightView = selfWeak.xrightBtn;
        selfWeak.itemTF.rightViewMode = UITextFieldViewModeAlways;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIView *rightView))rightView
{
    @WeakObj(self);
    return ^(UIView *rightView) {
        
        UIView *rightV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightView.size.width + 10, rightView.height)];
        rightView.left = 10;
        [rightV addSubview:rightView];
        
        selfWeak.itemTF.rightView = rightV;
        selfWeak.itemTF.rightViewMode = UITextFieldViewModeAlways;

        return selfWeak;
    };
}


- (TTFormItemView * (^)(UIButton *rightBtn))rightBtn
{
    @WeakObj(self);
    return ^(UIButton *rightBtn) {
        [selfWeak addSubview:rightBtn];
        
        rightBtn.right = self.width - selfWeak.contentViewEdgeInsets.right;
        rightBtn.centerY = selfWeak.itemTF.centerY;
        
        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSString *title))rightTitle
{
    @WeakObj(self);
    return ^(NSString *title) {
        
        if (!selfWeak.xrightBtn) {
            selfWeak.xrightBtn = [[UIButton alloc] init];
            selfWeak.xrightBtn.userInteractionEnabled = NO;
            [selfWeak.xrightBtn setTitleColor:TT_FORMV_WordColor forState:(UIControlStateNormal)];
            selfWeak.xrightBtn.titleLabel.font = TT_FORMV_Font(16);
            
        }
        
        if (selfWeak.xrightFont) {
            selfWeak.xrightBtn.titleLabel.font = selfWeak.xrightFont;
        }
        
        if (selfWeak.xrightColor != nil) {
            [selfWeak.xrightBtn setTitleColor:selfWeak.xrightColor forState:(UIControlStateNormal)];
        }
        
        [selfWeak.xrightBtn setTitle:title forState:(UIControlStateNormal)];
        selfWeak.xrightBtn.contentEdgeInsets = selfWeak.rightContentEdgeInsets;
        
        [selfWeak.xrightBtn sizeToFit];
        
        if (selfWeak.xrightHeight) {
            selfWeak.xrightBtn.height = selfWeak.xrightHeight;
        }
        
        // 如果有图片 则设置间距
        if (selfWeak.xrightBtn.imageView.image != nil) {
            selfWeak.xrightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, TT_FORMV_Adaptation_6(16), 0, 0);
            selfWeak.xrightBtn.width += TT_FORMV_Adaptation_6(16);
        }
        selfWeak.itemTF.rightView = selfWeak.xrightBtn;
        selfWeak.itemTF.rightViewMode = UITextFieldViewModeAlways;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIFont *rightFont))rightFont
{
    @WeakObj(self);
    return ^(UIFont *rightFont) {
        
        selfWeak.xrightFont = rightFont;
        
        if (selfWeak.xrightBtn != nil) {
            selfWeak.xrightBtn.titleLabel.font = rightFont;
            [selfWeak.xrightBtn sizeToFit];
        }

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIColor *rightColor))rightColor
{
    @WeakObj(self);
    return ^(UIColor *rightColor) {
        
        selfWeak.xrightColor = rightColor;
        
        if (selfWeak.xrightBtn != nil) {
            [selfWeak.xrightBtn setTitleColor:rightColor forState:(UIControlStateNormal)];
        }

        return selfWeak;
    };
}


- (TTFormItemView * (^)(CGFloat rightHeight))rightHeight {
    @WeakObj(self);
    return ^(CGFloat rightHeight) {
        
        selfWeak.xrightHeight = rightHeight;
        
        if (selfWeak.xrightBtn != nil) {
            selfWeak.xrightBtn.height = rightHeight;
        }
        
        return selfWeak;
    };
}


- (TTFormItemView * (^)(UIEdgeInsets edgeInsets))rightEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.rightContentEdgeInsets = edgeInsets;
        if (selfWeak.xrightBtn != nil) {
            selfWeak.xrightBtn.contentEdgeInsets = selfWeak.rightContentEdgeInsets;
            [selfWeak.xrightBtn sizeToFit];
        }

        return selfWeak;
    };
}



- (void)layoutLeftButton {
    
    if (!self.leftBtn) {
        self.leftBtn = [[UIButton alloc] init];
        self.leftBtn.userInteractionEnabled = NO;
        [self.leftBtn setTitleColor:TT_FORMV_WordColor forState:(UIControlStateNormal)];
        self.leftBtn.titleLabel.font = TT_FORMV_Font(16);
        self.leftBtn.contentHorizontalAlignment = self.leftAlignment;
    }
    
    
    if (self.xleftFont) {
        self.leftBtn.titleLabel.font = self.xleftFont;
    }
    
    if (self.xleftColor != nil) {
        [self.leftBtn setTitleColor:self.xleftColor forState:(UIControlStateNormal)];
    }
    
    if (self.xleftTitle != nil && self.xleftTitle.length > 0) {
        [self.leftBtn setTitle:self.xleftTitle forState:(UIControlStateNormal)];
    }
    
    if (self.xleftImage != nil) {
        [self.leftBtn setImage:self.xleftImage forState:UIControlStateNormal];
    }
    
    // 如果有图片 则设置间距
    if (self.leftBtn.imageView.image != nil && self.leftBtn.titleLabel.text.length > 0) {
        if (self.leftTitleContentEdgeInsets.left == 0) {
            self.leftTitleContentEdgeInsets = UIEdgeInsetsMake(0, TT_FORMV_Adaptation_6(10), 0, 0);
        }
    }
    
    self.leftBtn.contentEdgeInsets = self.leftContentEdgeInsets;
    self.leftBtn.titleEdgeInsets = self.leftTitleContentEdgeInsets;
    [self.leftBtn sizeToFit];
    self.leftBtn.width += self.leftTitleContentEdgeInsets.left;
    
    self.itemTF.leftView = self.leftBtn;
    self.itemTF.leftViewMode = UITextFieldViewModeAlways;
    
}




- (TTFormItemView * (^)(UIImage *image))leftImage
{
    @WeakObj(self);
    return ^(UIImage *image) {
        selfWeak.xleftImage = image;
        [selfWeak layoutLeftButton];

        return selfWeak;
    };
}

- (TTFormItemView * _Nonnull (^)(UIControlContentHorizontalAlignment))leftContentHorizontalAlignment {
    @WeakObj(self);
    return ^(UIControlContentHorizontalAlignment alignment) {
        selfWeak.leftAlignment = alignment;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}


- (TTFormItemView * (^)(NSString *imageName))leftIcon
{
    @WeakObj(self);
    return ^(NSString *imageName) {
        
        selfWeak.xleftImage = [UIImage imageNamed:imageName];
        [selfWeak layoutLeftButton];


        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSString *title))leftTitle
{
    @WeakObj(self);
    return ^(NSString *title) {

        selfWeak.xleftTitle = title;
        [selfWeak layoutLeftButton];

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIFont *leftFont))leftFont
{
    @WeakObj(self);
    return ^(UIFont *leftFont) {
        
        selfWeak.xleftFont = leftFont;
        
        [selfWeak layoutLeftButton];

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIColor *leftColor))leftColor
{
    @WeakObj(self);
    return ^(UIColor *leftColor) {
        
        selfWeak.xleftColor = leftColor;
        
        [selfWeak layoutLeftButton];

        return selfWeak;
    };
}



- (TTFormItemView * (^)(UIEdgeInsets edgeInsets))leftEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.leftContentEdgeInsets = edgeInsets;
        [selfWeak layoutLeftButton];

        return selfWeak;
    };
}

- (TTFormItemView * _Nonnull (^)(UIEdgeInsets))leftTitleEdgeInsets {
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.leftTitleContentEdgeInsets = edgeInsets;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}



- (TTFormItemView * (^)(UIColor *color))lineColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.itemLine.hidden = NO;
        selfWeak.itemLine.backgroundColor = color;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(CGFloat height))lineHeight
{
    @WeakObj(self);
    return ^(CGFloat height){
        
        selfWeak.itemLine.hidden = NO;
        selfWeak.lineH = height;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIEdgeInsets edgeInsets))lineEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.lineViewEdgeInsets = edgeInsets;

        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIEdgeInsets edgeInsets))contentEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.contentViewEdgeInsets = edgeInsets;

        return selfWeak;
    };
}


- (TTFormItemView * (^)(NSString *headIcon))headIcon
{
    @WeakObj(self);
    return ^(NSString *headIcon) {
        
        selfWeak.headView.image = [UIImage imageNamed:headIcon];

        return selfWeak;
    };
}

- (TTFormItemView * (^)(NSString *headURL))headURL
{
    @WeakObj(self);
    return ^(NSString *headURL) {
        
        [selfWeak.headView sd_setImageWithURL:[NSURL URLWithString:headURL] placeholderImage:selfWeak.headView.image];

        return selfWeak;
    };
}

- (TTFormItemView * _Nonnull (^)(NSInteger headWH))headWH {
    @WeakObj(self);
    return ^(NSInteger headWH) {
        
        selfWeak.headViewWH = headWH;
        
        return selfWeak;
    };
}

- (TTFormItemView * _Nonnull (^)(UIColor * shadowColor))headShadowColor {
    @WeakObj(self);
    return ^(UIColor * shadowColor) {
        
        selfWeak.headShadowView.layer.cornerRadius = 40;
        selfWeak.headShadowView.layer.shadowColor = shadowColor.CGColor;
        selfWeak.headShadowView.layer.shadowOffset = CGSizeMake(0, 0);
        selfWeak.headShadowView.layer.shadowRadius = 5;
        selfWeak.headShadowView.layer.shadowOpacity = 0.14;
        
        return selfWeak;
    };
}

- (TTFormItemView * (^)(UIView * customView))customView {
    @WeakObj(self);
    return ^(UIView *customView) {
        
        [selfWeak.customV removeFromSuperview];
        
        selfWeak.customV = customView;
        
        [selfWeak addSubview:selfWeak.customV];
        
        return selfWeak;
    };
}


- (TTFormItemView *)formatAtItem:(TTFormItemView *)itemView {
    
    itemView
    .textColor(self.itemTF.textColor)
    .font(self.itemTF.font)
    .textAlignment(self.itemTF.textAlignment)
    .contentEdgeInsets(self.contentViewEdgeInsets);
    
    
    if (_leftBtn) {
        itemView
        .leftFont(self.xleftFont ? self.xleftFont : TT_FORMV_Font(15))
        .leftColor(self.xleftColor ? self.xleftColor : TT_FORMV_WordColor)
        .leftEdgeInsets(self.leftContentEdgeInsets);
    }
    
    if (_xrightBtn) {
        itemView
        .rightFont(self.xrightFont ? self.xrightFont : TT_FORMV_Font(15))
        .rightColor(self.xrightColor ? self.xrightColor : TT_FORMV_WordColor)
        .rightEdgeInsets(self.leftContentEdgeInsets)
        .rightEdgeInsets(self.rightContentEdgeInsets);
    }
    
    
    if (!self.itemLine.isHidden) {
        itemView
        .lineEdgeInsets(self.lineViewEdgeInsets)
        .lineHeight(self.lineH)
        .lineColor(self.itemLine.backgroundColor);
    }
    
    if (_itemLabel) {
        itemView
        .numberOfLines(self.lineNum);
    }
    
    return itemView;
    
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return NO;
    
}

- (UILabel *)itemLabel {
    if (!_itemLabel) {
        _itemLabel = [[UILabel alloc] init];
        _itemLabel.textAlignment = NSTextAlignmentLeft;
        _itemLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:_itemLabel];

    }
    return _itemLabel;
}

- (UITextField *)itemTF {
    if (!_itemTF) {
        _itemTF = [[UITextField alloc] init];
        _itemTF.textAlignment = NSTextAlignmentRight;
        _itemTF.userInteractionEnabled = NO;
        _itemTF.delegate = self;
        _itemView = _itemTF;
        [self addSubview:_itemTF];

    }
    return _itemTF;
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

- (UIImageView *)headView {
    if (!_headView) {
        _headView = [[UIImageView alloc] init];
        _headView.backgroundColor = TT_FORMV_headColor;
        self.isShowHead = YES;
        [self addSubview:_headView];

    }
    return _headView;
}

- (UIView *)headShadowView {
    if (!_headShadowView) {
        _headShadowView = [[UIView alloc] init];
        _headShadowView.backgroundColor = TT_FORMV_headColor;
        [self addSubview:_headShadowView];
        
        if (_headView) {
            [self insertSubview:_headShadowView belowSubview:_headView];
        }
        
    }
    return _headShadowView;
}

@end
