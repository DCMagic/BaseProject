//
//  PBFormItemView.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBFormItemView.h"

@interface PBFormItemView ()

@property (nonatomic, strong) UIView        *itemLine;     // 下划线
@property (nonatomic, assign) CGRect headFrame;            // 头像frame
@property (nonatomic, assign) BOOL isShowHead;            // 是否显示头像
@property (nonatomic, assign) UIEdgeInsets lineViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets contentViewEdgeInsets;

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UILabel *redPromptLab;

@end

@implementation PBFormItemView




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.headFrame = CGRectMake(0, 0, 63, 63);
        [self buildView];
    }
    return self;
}



- (void)buildView {
    
    self.lineViewEdgeInsets = UIEdgeInsetsMake(20, 20, 0, 20);
    self.contentViewEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);
    
}

- (CGFloat)maxHeight {
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    return self.itemLine.maxY + self.lineViewEdgeInsets.bottom;
    
}


- (void)layoutView {
    
    
    if (_headView == nil) {
        
        [self.itemTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(self.contentViewEdgeInsets.top);
            make.left.equalTo(self.mas_left).with.offset(self.contentViewEdgeInsets.left);
            make.right.equalTo(self.mas_right).with.offset(-self.contentViewEdgeInsets.right);
            make.height.mas_equalTo(Adaptation_6(20));
        }];
        
        [self.itemLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.itemTF.mas_bottom).mas_offset(self.lineViewEdgeInsets.top);
            make.left.mas_equalTo(self.mas_left).with.offset(self.lineViewEdgeInsets.left);
            make.right.mas_equalTo(self.mas_right).with.offset(-self.lineViewEdgeInsets.right);
            make.height.mas_equalTo(.5);
        }];
        
        [self.redPromptLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.itemTF);
            make.right.equalTo(self.itemLine.mas_left).offset(-3);
        }];
        
    } else {
        
        
        [self.headView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top).with.offset(self.contentViewEdgeInsets.top);
            make.right.equalTo(self.itemTF.mas_right).with.offset(-15);
            make.width.height.mas_equalTo(Adaptation_6(64));
            
        }];
        
        [self.itemTF mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headView.mas_centerY);
            make.left.equalTo(self.mas_left).with.offset(self.contentViewEdgeInsets.left);
            make.right.equalTo(self.mas_right).with.offset(-self.contentViewEdgeInsets.right);
            make.height.mas_equalTo(Adaptation_6(30));
        }];
        
        [self.itemLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.headView.mas_bottom).mas_offset(self.lineViewEdgeInsets.top);
            make.left.mas_equalTo(self.mas_left).with.offset(self.lineViewEdgeInsets.left);
            make.right.mas_equalTo(self.mas_right).with.offset(-self.lineViewEdgeInsets.right);
            make.height.mas_equalTo(.5);
        }];
        
        [self.redPromptLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.itemTF);
            make.right.equalTo(self.itemLine.mas_left).offset(-3);
        }];
        
    }
}


+ (PBFormItemView * (^)(void))item
{
    
    return ^(void) {
        
        PBFormItemView *itemView = [[PBFormItemView alloc] init];
        
        return itemView;
    };
}


- (PBFormItemView *(^)(void (^eventBlock)(id sender)))eventBlock
{
    @WeakObj(self);
    return ^PBFormItemView *(void (^eventBlock)(id sender)) {
        [selfWeak addGestureRecognizer:[UITapGestureRecognizer tt_gestureRecognizerWithBlock:^{
            
            if (self.isShowHead) {
                eventBlock(self.headView);
            }else {
                eventBlock(selfWeak.itemTF);
            }
            
        }]];
        return selfWeak;
    };
}


- (PBFormItemView * (^)(NSString *placeholder))placeholder
{
    @WeakObj(self);
    return ^(NSString *placeholder) {
        
        selfWeak.itemTF.placeholder = placeholder;
        [selfWeak layoutView];
        return selfWeak;
    };
}



- (PBFormItemView * (^)(UIFont *font))font
{
    @WeakObj(self);
    return ^(UIFont *font) {
        
        selfWeak.itemTF.font = font;
        
        [self.itemTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(font.lineHeight);
        }];
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(UIColor *textColor))textColor
{
    @WeakObj(self);
    return ^(UIColor *textColor) {
        
        selfWeak.itemTF.textColor = textColor;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(NSString *text))text
{
    @WeakObj(self);
    return ^(NSString *text) {
        
        selfWeak.itemTF.text = text;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(NSTextAlignment textAlignment))textAlignment
{
    @WeakObj(self);
    return ^(NSTextAlignment textAlignment) {
        
        selfWeak.itemTF.textAlignment = textAlignment;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormItemView * (^)(NSString *imageName))rightIcon
{
    @WeakObj(self);
    return ^(NSString *imageName) {
        UIImage *img = [UIImage imageNamed:imageName];
        
        if (img != nil) {
            UIImageView *rightImg = [[UIImageView alloc] initWithImage:img];
            UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rightImg.size.width + 10, rightImg.size.height)];
            rightImg.left = 10;
            [rightView addSubview:rightImg];
            
            selfWeak.itemTF.rightView = rightView;
            selfWeak.itemTF.rightViewMode = UITextFieldViewModeAlways;
        }else {
            selfWeak.itemTF.rightView = nil;
        }
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormItemView * (^)(UIImage *image))leftImage
{
    @WeakObj(self);
    return ^(UIImage *image) {
        
        if (!selfWeak.leftBtn) {
            selfWeak.leftBtn = [[UIButton alloc] init];
            selfWeak.leftBtn.userInteractionEnabled = NO;
            [selfWeak.leftBtn setTitleColor:kFF333333 forState:(UIControlStateNormal)];
            selfWeak.leftBtn.titleLabel.font = kPingFangSC_Regular_16;
            
        }
        
        [selfWeak.leftBtn setImage:image imageHL:image];
        [selfWeak.leftBtn sizeToFit];
        if (selfWeak.leftBtn.titleLabel.text.length > 0) {
            selfWeak.leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, Adaptation_6(16), 0, 0);
            selfWeak.leftBtn.width += Adaptation_6(16);
        }
        selfWeak.itemTF.leftView = selfWeak.leftBtn;
        selfWeak.itemTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormItemView * (^)(NSString *imageName))leftIcon
{
    @WeakObj(self);
    return ^(NSString *imageName) {
        
        if (!selfWeak.leftBtn) {
            selfWeak.leftBtn = [[UIButton alloc] init];
            selfWeak.leftBtn.userInteractionEnabled = NO;
            [selfWeak.leftBtn setTitleColor:kFF333333 forState:(UIControlStateNormal)];
            selfWeak.leftBtn.titleLabel.font = kPingFangSC_Regular_16;
            
        }
        
        [selfWeak.leftBtn setImage:kImage(imageName) imageHL:kImage(imageName)];
        [selfWeak.leftBtn sizeToFit];
        if (selfWeak.leftBtn.titleLabel.text.length > 0) {
            selfWeak.leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, Adaptation_6(16), 0, 0);
            selfWeak.leftBtn.width += Adaptation_6(16);
        }
        selfWeak.itemTF.leftView = selfWeak.leftBtn;
        selfWeak.itemTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(NSString *title))leftTitle
{
    @WeakObj(self);
    return ^(NSString *title) {

        if (!selfWeak.leftBtn) {
            selfWeak.leftBtn = [[UIButton alloc] init];
            selfWeak.leftBtn.userInteractionEnabled = NO;
            [selfWeak.leftBtn setTitleColor:kFF333333 forState:(UIControlStateNormal)];
            selfWeak.leftBtn.titleLabel.font = kFZXIYSJW_18;
        }
        
        [selfWeak.leftBtn setTitle:title forState:(UIControlStateNormal)];
        [selfWeak.leftBtn sizeToFit];
        // 如果有图片 则设置间距
        if (selfWeak.leftBtn.imageView.image != nil) {
            selfWeak.leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, Adaptation_6(16), 0, 0);
            selfWeak.leftBtn.width += Adaptation_6(16);
        }
        selfWeak.itemTF.leftView = selfWeak.leftBtn;
        selfWeak.itemTF.leftViewMode = UITextFieldViewModeAlways;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(UIColor *color))leftTitleColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        [selfWeak.leftBtn setTitleColor:color forState:UIControlStateNormal];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(UIColor *color))lineColor
{
    @WeakObj(self);
    return ^(UIColor *color){
        
        selfWeak.itemLine.hidden = NO;
        selfWeak.itemLine.backgroundColor = color;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(BOOL showRedPrompt))showRedPrompt
{
    @WeakObj(self);
    return ^(BOOL showRedPrompt){
        
        selfWeak.redPromptLab.hidden = !showRedPrompt;
        return selfWeak;
    };
}


- (PBFormItemView * (^)(UIEdgeInsets edgeInsets))lineEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.lineViewEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(UIEdgeInsets edgeInsets))contentEdgeInsets
{
    @WeakObj(self);
    return ^(UIEdgeInsets edgeInsets){
        
        selfWeak.contentViewEdgeInsets = edgeInsets;
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (PBFormItemView * (^)(NSString *headIcon))headIcon
{
    @WeakObj(self);
    return ^(NSString *headIcon) {
        
        selfWeak.headView.image = kImage(headIcon);
        [selfWeak layoutView];
        return selfWeak;
    };
}

- (PBFormItemView * (^)(NSString *headURL))headURL
{
    @WeakObj(self);
    return ^(NSString *headURL) {
        
        [selfWeak.headView sd_setImageWithURL:kURL(headURL) placeholderImage:selfWeak.headView.image];
        [selfWeak layoutView];
        return selfWeak;
    };
}


- (UITextField *)itemTF {
    if (!_itemTF) {
        _itemTF = [[UITextField alloc] init];
        _itemTF.textAlignment = NSTextAlignmentRight;
        _itemTF.userInteractionEnabled = NO;
        _itemTF.font = kFZXIYSJW_16;
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
        _headView.layer.cornerRadius = Adaptation_6(32);
        _headView.clipsToBounds = YES;
        _headView.backgroundColor = UIColor.redColor;
        self.isShowHead = YES;
        [self addSubview:_headView];
    }
    return _headView;
}

-(UILabel *)redPromptLab{
    if (!_redPromptLab) {
        _redPromptLab = [[UILabel alloc] init];
        _redPromptLab.textColor = kFFD01815;
        _redPromptLab.textAlignment = NSTextAlignmentCenter;
        _redPromptLab.font = kPingFangSC_Regular_16;
        _redPromptLab.hidden = YES;
        _redPromptLab.text = @"*";
        [self addSubview:_redPromptLab];
    }
    return _redPromptLab;
}


@end
