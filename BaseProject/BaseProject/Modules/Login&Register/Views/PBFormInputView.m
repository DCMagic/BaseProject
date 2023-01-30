//
//  PBFormInputView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBFormInputView.h"


@interface PBFormInputView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField   *inputTF;       // 帐号TF
@property (nonatomic, strong) UIView        *inputLine;     // 下划线

@property (nonatomic, strong) UIView        *leftbackView;
@property (nonatomic, strong) UIView        *leftV;
@property (nonatomic, strong) UIView        *rightbackView;
@property (nonatomic, strong) UIView        *rightV;

@property (nonatomic, assign) UIEdgeInsets lineViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets fieldEdgeInsets;

@property (nonatomic, copy) void (^valueBlock)(id sender);

@end

@implementation PBFormInputView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildView];
    }
    return self;
}

-(void)becomeFirstResponderTextField{
    [self.inputTF becomeFirstResponder];
}

-(void)resignFirstResponderTextField {
    [self.inputTF resignFirstResponder];
}

- (void)buildView {
    
    self.lineViewEdgeInsets = UIEdgeInsetsMake(10, 20, 0, 20);
    self.fieldEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
}

- (CGFloat)maxHeight {
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    return self.inputLine.maxY + self.lineViewEdgeInsets.bottom;
    
}


- (void)layoutView {
    
    if (_smsCodeBtn == nil || _smsCodeBtn.isHidden == YES) {
        
        [self.inputTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left).with.offset(self.fieldEdgeInsets.left);
            make.right.equalTo(self.mas_right).with.offset(-self.fieldEdgeInsets.right);
            make.height.mas_equalTo(Adaptation_6(30));
        }];
        
        [self.inputLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.inputTF.mas_bottom).mas_offset(self.lineViewEdgeInsets.top);
            make.left.mas_equalTo(self.mas_left).with.offset(self.lineViewEdgeInsets.left);
            make.right.mas_equalTo(self.mas_right).with.offset(-self.lineViewEdgeInsets.right);
            make.height.mas_equalTo(.5);
        }];
        
    }else {
        [self.smsCodeBtn setContentHuggingPriority:UILayoutPriorityRequired
                                           forAxis:UILayoutConstraintAxisHorizontal];
        [self.inputTF setContentHuggingPriority:UILayoutPriorityDefaultLow
                                        forAxis:UILayoutConstraintAxisHorizontal];
        
        
        [self.inputTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left).with.offset(20);
            make.right.equalTo(self.smsCodeBtn.mas_left).with.offset(-20);
            make.height.mas_equalTo(Adaptation_6(30));
        }];
        
        [self.smsCodeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.right.equalTo(self.mas_right).with.offset(-20);
            make.centerY.mas_equalTo(self.inputTF.mas_centerY);
            
        }];
        
        
        [self.inputLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.inputTF.mas_bottom).mas_offset(self.lineViewEdgeInsets.top);
            make.left.mas_equalTo(self.mas_left).with.offset(self.lineViewEdgeInsets.left);
            make.right.mas_equalTo(self.mas_right).with.offset(-self.lineViewEdgeInsets.right);
            make.height.mas_equalTo(.5);
        }];
    }
    
}


// 内容改变时触发
- (void)valueChanged :(UITextField *)textField{
    
    NSString *lang = textField.textInputMode.primaryLanguage; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];       //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position || !selectedRange){
            if (self.valueBlock) {
                self.valueBlock(self.inputTF);
            }
        }
    }else{
        //中文输入法以外的直接统计，不考虑其他语种情况
        if (self.valueBlock) {
            self.valueBlock(self.inputTF);
        }
    }
}


- (NSString *)textFieldText {
    return self.inputTF.text;
}

- (PBFormInputView *(^)(void (^valueChangedBlock)(id sender)))valueChangedBlock
{
    @WeakObj(self);
    return ^(void (^valueChangedBlock)(id sender)) {
        selfWeak.valueBlock = valueChangedBlock;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView *(^)(void (^eventBlock)(id sender)))eventBlock
{
    @WeakObj(self);
    return ^PBFormInputView *(void (^eventBlock)(id sender)) {
        [selfWeak.smsCodeBtn tt_touchUpInside:eventBlock];
        [selfWeak layoutView];
        return selfWeak;
    };
}


+ (PBFormInputView * (^)(void))input
{
    
    return ^(void) {
        
        PBFormInputView *inputView = [[PBFormInputView alloc] init];
        
        return inputView;
    };
}


- (PBFormInputView * (^)(NSString *text))text
{
    @WeakObj(self);
    return ^(NSString *text) {
        
        selfWeak.inputTF.text = text;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView * (^)(NSString *placeholder))placeholder
{
    @WeakObj(self);
    return ^(NSString *placeholder) {
        
        selfWeak.inputTF.placeholder = placeholder;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UIKeyboardType keyboardType))keyboardType
{
    @WeakObj(self);
    return ^(UIKeyboardType keyboardType) {
        
        selfWeak.inputTF.keyboardType = keyboardType;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView * (^)(UIFont *font))font
{
    @WeakObj(self);
    return ^(UIFont *font) {
        
        selfWeak.inputTF.font = font;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UIColor *textColor))textColor
{
    @WeakObj(self);
    return ^(UIColor *textColor) {
        
        selfWeak.inputTF.textColor = textColor;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(int maxCount))maxCount
{
    @WeakObj(self);
    return ^(int maxCount) {
        
        selfWeak.inputTF.maxLength = maxCount;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView * (^)(BOOL secureTextEntry))secureTextEntry
{
    @WeakObj(self);
    return ^(BOOL secureTextEntry) {
        
        [selfWeak.inputTF setSecureTextEntry:secureTextEntry];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UITextFieldViewMode  clearButtonMode))clearButtonMode
{
    @WeakObj(self);
    return ^(UITextFieldViewMode  clearButtonMode) {
        selfWeak.inputTF.clearButtonMode = clearButtonMode;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView * (^)(NSString *imageName))leftIcon
{
    @WeakObj(self);
    return ^(NSString *imageName) {
        
        
        if (self.leftV != nil && [self.leftV isKindOfClass:[UIImageView class]]) {
            UIImageView *leftImage = (UIImageView *)self.leftV;
            leftImage.image = kImage(imageName);
            [selfWeak layoutView];
            return selfWeak;
        }
        
        UIImageView *leftImg = [[UIImageView alloc] initWithImage:kImage(imageName)];
        leftImg.contentMode = UIViewContentModeScaleAspectFit;
        self.leftV = leftImg;
        // 为了防止切换icon时 两个icon大小不一致
        CGFloat leftImgW = leftImg.width < 15 ? 15 : leftImg.width;
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftImgW + 5, leftImg.size.height)];
        [leftView addSubview:leftImg];
        self.leftbackView = leftView;
        
        selfWeak.inputTF.leftView = leftView;
        selfWeak.inputTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView * (^)(UIView *leftView))leftView
{
    @WeakObj(self);
    return ^(UIView *leftView) {
        
        selfWeak.inputTF.leftView = leftView;
        selfWeak.inputTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * _Nonnull (^)(NSString *leftText))leftText{
    @WeakObj(self);
    return ^(NSString *leftText) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Adaptation_6(86), Adaptation_6(24))];
        label.text = leftText;
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Adaptation_6(86), Adaptation_6(24))];
        [leftView addSubview:label];
        selfWeak.inputTF.leftView = leftView;
        selfWeak.inputTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UIView *rightView))rightView
{
    @WeakObj(self);
    return ^(UIView *rightView) {
        
        selfWeak.inputTF.rightView = rightView;
        selfWeak.inputTF.rightViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormInputView * (^)(NSString *smsTitle, UIControlState controlState))smsTitle
{
    @WeakObj(self);
    return ^(NSString *smsTitle, UIControlState controlState) {
        
        [selfWeak.smsCodeBtn setTitle:smsTitle forState:controlState];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UIColor *smsTitleColor, UIControlState controlState))smsTitleColor
{
    @WeakObj(self);
    return ^(UIColor *smsTitleColor, UIControlState controlState) {
        
        [selfWeak.smsCodeBtn setTitleColor:smsTitleColor forState:controlState];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * _Nonnull (^)(UIFont * _Nonnull, UIControlState))smsTitleFont{
    @WeakObj(self);
    return ^(UIFont *smsTitleFont, UIControlState controlState) {
        
        [selfWeak.smsCodeBtn.titleLabel setFont:smsTitleFont];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * _Nonnull (^)(UIImage * _Nonnull, UIControlState controlState))smsImage{
    @WeakObj(self);
    return ^(UIImage *smsImage, UIControlState controlState) {
        
        [selfWeak.smsCodeBtn setImage:smsImage forState:controlState];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(BOOL smsCodeHidden))smsCodeHidden
{
    @WeakObj(self);
    return ^(BOOL smsCodeHidden) {
        
        selfWeak.smsCodeBtn.hidden = smsCodeHidden;
        [selfWeak setNeedsLayout];
        [selfWeak layoutView];
        return selfWeak;
    };
}



- (PBFormInputView * (^)(UIColor *color))lineColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.inputLine.hidden = NO;
        selfWeak.inputLine.backgroundColor = color;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UIEdgeInsets edgeInsets))lineEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.lineViewEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormInputView * (^)(UIEdgeInsets edgeInsets))textFieldEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.fieldEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (UITextField *)inputTF {
    if (!_inputTF) {
        _inputTF = [[UITextField alloc] init];
        _inputTF.delegate = self;
        _inputTF.font = kPingFangSC_Regular_14;
        [_inputTF addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_inputTF];
    }
    return _inputTF;
}

- (UIView *)inputLine {
    if (!_inputLine) {
        _inputLine = [[UIView alloc] init];
        _inputLine.backgroundColor = [UIColor grayColor];
        _inputLine.hidden = YES;
        [self addSubview:_inputLine];
    }
    return _inputLine;
}

- (UIButton *)smsCodeBtn {
    if (!_smsCodeBtn) {
        _smsCodeBtn.hidden = YES;
        _smsCodeBtn = [[UIButton alloc] init];
        [_smsCodeBtn setTitleColor:kThemeColor forState:UIControlStateNormal];
        _smsCodeBtn.titleLabel.font = kPingFangSC_Regular_14;
        [self addSubview:_smsCodeBtn];
    }
    return _smsCodeBtn;
}


@end
