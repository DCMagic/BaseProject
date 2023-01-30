//
//  PBFormInputView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBFormItemBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PBFormInputView : PBFormItemBaseView


TT_CHAINAPI_TYPE NSString *textFieldText;

TT_CHAINAPI_TYPE PBFormInputView *(^ text)(NSString *);

TT_CHAINAPI_TYPE PBFormInputView *(^ placeholder)(NSString *);

TT_CHAINAPI_TYPE PBFormInputView *(^ keyboardType)(UIKeyboardType);

TT_CHAINAPI_TYPE PBFormInputView *(^ font)(UIFont *);

TT_CHAINAPI_TYPE PBFormInputView *(^ textColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormInputView *(^ maxCount)(int);

TT_CHAINAPI_TYPE PBFormInputView *(^ secureTextEntry)(BOOL);

TT_CHAINAPI_TYPE PBFormInputView *(^ clearButtonMode)(UITextFieldViewMode);

TT_CHAINAPI_TYPE PBFormInputView *(^ leftIcon)(NSString *);

TT_CHAINAPI_TYPE PBFormInputView *(^ leftView)(UIView *);

TT_CHAINAPI_TYPE PBFormInputView *(^ leftText)(NSString *);

TT_CHAINAPI_TYPE PBFormInputView *(^ rightView)(UIView *);

TT_CHAINAPI_TYPE PBFormInputView *(^ smsTitle)(NSString *smsTitle, UIControlState controlState);

TT_CHAINAPI_TYPE PBFormInputView *(^ smsImage)(UIImage *smsImage, UIControlState controlState);

TT_CHAINAPI_TYPE PBFormInputView *(^ smsTitleColor)(UIColor *smsTitleColor, UIControlState controlState);

TT_CHAINAPI_TYPE PBFormInputView *(^ smsTitleFont)(UIFont *smsTitleFont, UIControlState controlState);

TT_CHAINAPI_TYPE PBFormInputView *(^ smsCodeHidden)(BOOL);

TT_CHAINAPI_TYPE PBFormInputView *(^ lineColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormInputView *(^ lineEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE PBFormInputView *(^ textFieldEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE PBFormInputView *(^ valueChangedBlock)(void (^valueChangedBlock)(id sender));

TT_CHAINAPI_TYPE PBFormInputView *(^ eventBlock)(void (^eventBlock)(id sender));

+ (PBFormInputView * (^)(void))input;

-(void)becomeFirstResponderTextField;

-(void)resignFirstResponderTextField;

@property (nonatomic, strong) UIButton      *smsCodeBtn;    // 验证码按钮

@end

NS_ASSUME_NONNULL_END
