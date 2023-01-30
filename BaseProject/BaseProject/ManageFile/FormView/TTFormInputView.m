//
//  TTFormInputView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "TTFormInputView.h"


@interface TTFormInputView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField   *inputTF;       // 帐号TF
@property (nonatomic, strong) UIView        *inputLine;     // 下划线
@property (nonatomic, strong) UIButton      *smsCodeBtn;    // 验证码按钮
@property (nonatomic, strong) UIView        *leftbackView;
@property (nonatomic, strong) UIView        *leftV;

@property (nonatomic, assign) CGFloat lineH;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) NSString *xleftTitle;
@property (nonatomic, strong) UIImage *xleftImage;
@property (nonatomic, strong) UIFont *xleftFont;
@property (nonatomic, strong) UIColor *xleftColor;

@property (nonatomic, strong) UIView        *rightbackView;
@property (nonatomic, strong) UIView        *rightV;
@property (nonatomic, strong) UIView        *textFiledBackV;

@property (nonatomic, assign) UIEdgeInsets lineViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets fieldEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets contentViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets leftContentEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets leftTitleContentEdgeInsets;

@property (nonatomic, copy) void (^valueBlock)(id sender);

@end

@implementation TTFormInputView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildView];
    }
    return self;
}



- (void)buildView {
    
    self.lineViewEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
    self.fieldEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    self.contentViewEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    self.lineH = 0.5;
}

- (CGFloat)maxHeight {
    
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    return CGRectGetMaxY(self.inputLine.frame) + self.lineViewEdgeInsets.bottom;
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_smsCodeBtn == nil || _smsCodeBtn.isHidden == YES) {
        
        [self.inputTF sizeToFit];
        // 防止太短 点击不到
        CGFloat inputTFEdge = 5;
        self.inputTF.height += inputTFEdge * 2;
        self.inputTF.width = self.width - self.contentViewEdgeInsets.left - self.contentViewEdgeInsets.right;
        self.inputTF.left = self.contentViewEdgeInsets.left;
        self.inputTF.top = self.contentViewEdgeInsets.top - inputTFEdge;
        
        // 背景View
        if (_textFiledBackV) {

            // 有背景 则设置5点间距
            CGFloat margin = 5;
            
            _textFiledBackV.width = self.inputTF.width - self.inputTF.leftView.width - self.inputTF.rightView.width + 2 * margin;
            
            if (_textFiledBackV.height < self.inputTF.height) {
                _textFiledBackV.height = self.inputTF.height;
            }
            
            _textFiledBackV.centerY = self.inputTF.centerY;
            _textFiledBackV.left = self.inputTF.left + self.inputTF.leftView.width - margin;
            [self insertSubview:_textFiledBackV belowSubview:self.inputTF];
            
        }
        
        self.inputLine.width = self.width - self.lineViewEdgeInsets.left - self.lineViewEdgeInsets.right;
        self.inputLine.height = self.lineH;
        self.inputLine.left = self.lineViewEdgeInsets.left;
        self.inputLine.top = self.inputTF.maxY + self.contentViewEdgeInsets.bottom - self.lineH - inputTFEdge;
        
        
    }else {
        
        [self.smsCodeBtn sizeToFit];
        self.smsCodeBtn.right = self.width - self.contentViewEdgeInsets.right;
        self.smsCodeBtn.top = self.contentViewEdgeInsets.top;
        
        [self.inputTF sizeToFit];
        // 防止太短 点击不到
        
        CGFloat inputTFEdge = 5;
        
        self.inputTF.height += inputTFEdge * 2;
        self.inputTF.width = self.width - self.contentViewEdgeInsets.left - self.contentViewEdgeInsets.right -self.fieldEdgeInsets.right - self.smsCodeBtn.width;
        self.inputTF.left = self.contentViewEdgeInsets.left;
        self.inputTF.top = self.contentViewEdgeInsets.top - inputTFEdge;
        
        // 重新计算按钮Y值
        self.smsCodeBtn.centerY = self.inputTF.centerY;
        
        
        // 背景View
        if (_textFiledBackV) {
            // 有背景 则设置5点间距
            CGFloat margin = 5;
            
            _textFiledBackV.width = self.inputTF.width - self.inputTF.leftView.width - self.inputTF.rightView.width + 2 * margin;
            
            if (_textFiledBackV.height < self.inputTF.height) {
                _textFiledBackV.height = self.inputTF.height;
            }
            
            _textFiledBackV.centerY = self.inputTF.centerY;
            _textFiledBackV.left = self.inputTF.left + self.inputTF.leftView.width - margin;
            [self insertSubview:_textFiledBackV belowSubview:self.inputTF];
            
            
        }
        
        self.inputLine.width = self.width - self.lineViewEdgeInsets.left - self.lineViewEdgeInsets.right;
        self.inputLine.height = self.lineH;
        self.inputLine.left = self.lineViewEdgeInsets.left;
        self.inputLine.top = self.inputTF.maxY + self.contentViewEdgeInsets.bottom - self.lineH - inputTFEdge;
        
    }
    
}

// 更新布局
- (void)layoutView {
    
    
//    if (_smsCodeBtn == nil || _smsCodeBtn.isHidden == YES) {
//
//        [self.inputTF mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.mas_top).with.offset(self.fieldEdgeInsets.top + self.contentViewEdgeInsets.top);
//            make.left.equalTo(self.mas_left).with.offset(self.fieldEdgeInsets.left + self.contentViewEdgeInsets.left);
//            make.right.equalTo(self.mas_right).with.offset(-(self.fieldEdgeInsets.right + self.contentViewEdgeInsets.right));
//        }];
//
//        [self.inputLine mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.inputTF.mas_bottom).mas_offset(self.lineViewEdgeInsets.top + self.fieldEdgeInsets.bottom + self.contentViewEdgeInsets.bottom);
//            make.left.mas_equalTo(self.mas_left).with.offset(self.lineViewEdgeInsets.left);
//            make.right.mas_equalTo(self.mas_right).with.offset(-self.lineViewEdgeInsets.right);
//            make.height.mas_equalTo(.5);
//        }];
//
//    }else {
//        [self.smsCodeBtn setContentHuggingPriority:UILayoutPriorityRequired
//                                           forAxis:UILayoutConstraintAxisHorizontal];
//        [self.inputTF setContentHuggingPriority:UILayoutPriorityDefaultLow
//                                        forAxis:UILayoutConstraintAxisHorizontal];
//
//
//        [self.inputTF mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.mas_top).with.offset(self.fieldEdgeInsets.top + self.contentViewEdgeInsets.top);
//            make.left.equalTo(self.mas_left).with.offset(self.fieldEdgeInsets.left + self.contentViewEdgeInsets.left);
//            make.right.equalTo(self.smsCodeBtn.mas_left).with.offset(-self.fieldEdgeInsets.right);
//        }];
//
//        [self.smsCodeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.mas_top).with.offset(self.fieldEdgeInsets.left + self.contentViewEdgeInsets.left);
//            make.right.equalTo(self.mas_right).with.offset(-self.contentViewEdgeInsets.right);
//            make.centerY.mas_equalTo(self.inputTF.mas_centerY);
//
//        }];
//
//
//        [self.inputLine mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.inputTF.mas_bottom).mas_offset(self.lineViewEdgeInsets.top + self.fieldEdgeInsets.bottom + self.contentViewEdgeInsets.bottom);
//            make.left.mas_equalTo(self.mas_left).with.offset(self.lineViewEdgeInsets.left);
//            make.right.mas_equalTo(self.mas_right).with.offset(-self.lineViewEdgeInsets.right);
//            make.height.mas_equalTo(.5);
//        }];
//    }
    
}


// 内容改变时触发
- (void)valueChanged {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.valueBlock) {
            self.valueBlock(self.inputTF);
        }
    });
    
    
}


- (NSString *)textFieldText {
    return self.inputTF.text;
}

- (TTFormInputView *(^)(void (^valueChangedBlock)(id sender)))valueChangedBlock
{
    @WeakObj(self);
    return ^(void (^valueChangedBlock)(id sender)) {
        selfWeak.valueBlock = valueChangedBlock;
        return selfWeak;
    };
}


- (TTFormInputView *(^)(void (^eventBlock)(id sender)))eventBlock
{
    @WeakObj(self);
    return ^TTFormInputView *(void (^eventBlock)(id sender)) {
        [selfWeak.smsCodeBtn tt_touchUpInside:eventBlock];
        return selfWeak;
    };
}


+ (TTFormInputView * (^)(void))input
{
    
    return ^(void) {
        
        TTFormInputView *inputView = [[TTFormInputView alloc] init];
        
        return inputView;
    };
}

- (TTFormInputView * (^)(NSString *title))leftTitle
{
    @WeakObj(self);
    return ^(NSString *title) {
        
        selfWeak.xleftTitle = title;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIFont *leftFont))leftFont
{
    @WeakObj(self);
    return ^(UIFont *leftFont) {
        
        selfWeak.xleftFont = leftFont;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIColor *leftColor))leftColor
{
    @WeakObj(self);
    return ^(UIColor *leftColor) {
        
        selfWeak.xleftColor = leftColor;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}



- (TTFormInputView * (^)(UIEdgeInsets edgeInsets))leftEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.leftContentEdgeInsets = edgeInsets;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(UIEdgeInsets))leftTitleEdgeInsets {
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.leftTitleContentEdgeInsets = edgeInsets;
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}


- (TTFormInputView * (^)(NSString *text))text
{
    @WeakObj(self);
    return ^(NSString *text) {
        
        selfWeak.inputTF.text = text;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * (^)(NSString *placeholder))placeholder
{
    @WeakObj(self);
    return ^(NSString *placeholder) {
        
        selfWeak.inputTF.placeholder = placeholder;

        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(UIColor * color))placeholderColor {
    @WeakObj(self);
    return ^(UIColor *color) {
        
        [selfWeak.inputTF setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        return selfWeak;
    };
}


- (TTFormInputView * _Nonnull (^)(CGFloat radius))cornerRadius {
    @WeakObj(self);
    return ^(CGFloat radius) {
        
        selfWeak.textFiledBackV.layer.cornerRadius = radius;
        selfWeak.textFiledBackV.layer.masksToBounds = YES;
        return selfWeak;
    };
}


- (TTFormInputView * _Nonnull (^)(UIColor * _Nonnull))borderColor {
    @WeakObj(self);
    return ^(UIColor *color) {
        selfWeak.textFiledBackV.layer.borderColor = color.CGColor;
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(CGFloat))borderWidth {
    @WeakObj(self);
    return ^(CGFloat width) {
        
        selfWeak.textFiledBackV.layer.borderWidth = width;
        return selfWeak;
    };
}


- (TTFormInputView * _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    @WeakObj(self);
    return ^(UIColor *color) {
        selfWeak.textFiledBackV.backgroundColor = color;
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(CGFloat height))backgroundHeight {
    @WeakObj(self);
    return ^(CGFloat height) {
        
        selfWeak.textFiledBackV.height = height;
        return selfWeak;
    };
}


- (TTFormInputView * (^)(UIKeyboardType keyboardType))keyboardType
{
    @WeakObj(self);
    return ^(UIKeyboardType keyboardType) {
        
        selfWeak.inputTF.keyboardType = keyboardType;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * (^)(UIFont *font))font
{
    @WeakObj(self);
    return ^(UIFont *font) {
        
        selfWeak.inputTF.font = font;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIColor *textColor))textColor
{
    @WeakObj(self);
    return ^(UIColor *textColor) {
        
        selfWeak.inputTF.textColor = textColor;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * (^)(int maxCount))maxCount
{
    @WeakObj(self);
    return ^(int maxCount) {
        
        selfWeak.inputTF.maxLength = maxCount;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * (^)(BOOL secureTextEntry))secureTextEntry
{
    @WeakObj(self);
    return ^(BOOL secureTextEntry) {
        
        [selfWeak.inputTF setSecureTextEntry:secureTextEntry];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UITextFieldViewMode  clearButtonMode))clearButtonMode
{
    @WeakObj(self);
    return ^(UITextFieldViewMode  clearButtonMode) {
        selfWeak.inputTF.clearButtonMode = clearButtonMode;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (void)layoutLeftButton {
    
    if (!self.leftBtn) {
        self.leftBtn = [[UIButton alloc] init];
        self.leftBtn.userInteractionEnabled = NO;
        [self.leftBtn setTitleColor:TT_FORMV_WordColor forState:(UIControlStateNormal)];
        self.leftBtn.titleLabel.font = TT_FORMV_Font(16);
        
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
    
    [self.leftBtn sizeToFit];
    self.leftBtn.contentEdgeInsets = self.leftContentEdgeInsets;
    self.leftBtn.titleEdgeInsets = self.leftTitleContentEdgeInsets;
    
    self.leftBtn.width += self.leftTitleContentEdgeInsets.left + self.leftTitleContentEdgeInsets.right + self.leftContentEdgeInsets.left + self.leftContentEdgeInsets.right;
    
    self.inputTF.leftView = self.leftBtn;
    self.inputTF.leftViewMode = UITextFieldViewModeAlways;
    
}



- (TTFormInputView * (^)(NSString *imageName))leftIcon
{
    @WeakObj(self);
    return ^(NSString *imageName) {
        
        selfWeak.xleftImage = [UIImage imageNamed:imageName];
        [selfWeak layoutLeftButton];
        
        return selfWeak;
    };
}


- (TTFormInputView * (^)(UIView *leftView))leftView
{
    @WeakObj(self);
    return ^(UIView *leftView) {
        
        selfWeak.inputTF.leftView = leftView;
        selfWeak.inputTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIView *rightView))rightView
{
    @WeakObj(self);
    return ^(UIView *rightView) {
        
        selfWeak.inputTF.rightView = rightView;
        selfWeak.inputTF.rightViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * (^)(NSString *smsTitle, UIControlState controlState))smsTitle
{
    @WeakObj(self);
    return ^(NSString *smsTitle, UIControlState controlState) {
        [selfWeak.smsCodeBtn setTitle:smsTitle forState:controlState];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIColor *smsTitleColor, UIControlState controlState))smsTitleColor
{
    @WeakObj(self);
    return ^(UIColor *smsTitleColor, UIControlState controlState) {
        
        [selfWeak.smsCodeBtn setTitleColor:smsTitleColor forState:controlState];
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * (^)(UIColor * smsBtnBackgroundColor))smsBtnBackgroundColor {
    
    @WeakObj(self);
    return ^(UIColor *smsBtnBackgroundColor) {
        
        selfWeak.smsCodeBtn.backgroundColor = smsBtnBackgroundColor;
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(CGFloat cornerRadius))smsBtnCornerRadius {
    
    @WeakObj(self);
    return ^(CGFloat cornerRadius) {
        
        selfWeak.smsCodeBtn.layer.cornerRadius = cornerRadius;
        selfWeak.smsCodeBtn.layer.masksToBounds = YES;
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(UIEdgeInsets edgeInsets))smsBtncContentEdgeInsets {
    
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.smsCodeBtn.contentEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * (^)(BOOL smsCodeHidden))smsCodeHidden
{
    @WeakObj(self);
    return ^(BOOL smsCodeHidden) {
        
        selfWeak.smsCodeBtn.hidden = smsCodeHidden;
//        [selfWeak setNeedsLayout];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * _Nonnull (^)(BOOL firstResponder))isFirstResponder {
    @WeakObj(self);
    return ^(BOOL firstResponder) {
        if (firstResponder) {
            [selfWeak.inputTF becomeFirstResponder];
        }

        return selfWeak;
    };
}



- (TTFormInputView * (^)(UIColor *color))lineColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.inputLine.hidden = NO;
        selfWeak.inputLine.backgroundColor = color;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIEdgeInsets edgeInsets))lineEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.lineViewEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (TTFormInputView * _Nonnull (^)(CGFloat))lineHeight {
    @WeakObj(self);
    return ^(CGFloat height){
        
        selfWeak.inputLine.hidden = NO;
        selfWeak.lineH = height;
        
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIEdgeInsets edgeInsets))textFieldEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.fieldEdgeInsets = edgeInsets;
        return selfWeak;
    };
}

- (TTFormInputView * (^)(UIEdgeInsets edgeInsets))contentEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.contentViewEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (UITextField *)inputTF {
    if (!_inputTF) {
        _inputTF = [[UITextField alloc] init];
        _inputTF.delegate = self;
        [_inputTF addTarget:self  action:@selector(valueChanged)  forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_inputTF];
        [self layoutView];
    }
    return _inputTF;
}

- (UIView *)inputLine {
    if (!_inputLine) {
        _inputLine = [[UIView alloc] init];
        _inputLine.backgroundColor = [UIColor grayColor];
        _inputLine.hidden = YES;
        [self addSubview:_inputLine];
        [self layoutView];
    }
    return _inputLine;
}

- (UIButton *)smsCodeBtn {
    if (!_smsCodeBtn) {
        _smsCodeBtn.hidden = YES;
        _smsCodeBtn = [[UIButton alloc] init];
        [_smsCodeBtn setTitleColor:TT_FORMV_ThemeColor forState:UIControlStateNormal];
        _smsCodeBtn.titleLabel.font = TT_FORMV_Font(14);
        [self addSubview:_smsCodeBtn];
        [self layoutView];
    }
    return _smsCodeBtn;
}

- (UIView *)textFiledBackV {
    if (!_textFiledBackV) {
        _textFiledBackV = [[UIView alloc] init];
        _textFiledBackV.backgroundColor = [UIColor clearColor];
        [self addSubview:_textFiledBackV];
    }
    return _textFiledBackV;
}


@end
