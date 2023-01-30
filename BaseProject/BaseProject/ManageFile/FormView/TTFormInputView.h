//
//  TTFormInputView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTFormItemBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTFormInputView : TTFormItemBaseView


TT_CHAINAPI_TYPE NSString *textFieldText;

TT_CHAINAPI_TYPE TTFormInputView *(^ leftTitle)(NSString *title);

TT_CHAINAPI_TYPE TTFormInputView *(^ leftFont)(UIFont *leftFont);

TT_CHAINAPI_TYPE TTFormInputView *(^ leftColor)(UIColor *leftColor);

TT_CHAINAPI_TYPE TTFormInputView *(^ leftIcon)(NSString *);

TT_CHAINAPI_TYPE TTFormInputView *(^ leftView)(UIView *);

TT_CHAINAPI_TYPE TTFormInputView *(^ leftEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormInputView *(^ leftTitleEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormInputView *(^ text)(NSString *);

TT_CHAINAPI_TYPE TTFormInputView *(^ placeholder)(NSString *);

TT_CHAINAPI_TYPE TTFormInputView *(^ placeholderColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormInputView *(^ cornerRadius)(CGFloat);

TT_CHAINAPI_TYPE TTFormInputView *(^ borderColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormInputView *(^ borderWidth)(CGFloat);

TT_CHAINAPI_TYPE TTFormInputView *(^ backgroundColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormInputView *(^ backgroundHeight)(CGFloat);

TT_CHAINAPI_TYPE TTFormInputView *(^ keyboardType)(UIKeyboardType);

TT_CHAINAPI_TYPE TTFormInputView *(^ font)(UIFont *);

TT_CHAINAPI_TYPE TTFormInputView *(^ textColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormInputView *(^ maxCount)(int);

TT_CHAINAPI_TYPE TTFormInputView *(^ secureTextEntry)(BOOL);

TT_CHAINAPI_TYPE TTFormInputView *(^ clearButtonMode)(UITextFieldViewMode);

TT_CHAINAPI_TYPE TTFormInputView *(^ isFirstResponder)(BOOL);

TT_CHAINAPI_TYPE TTFormInputView *(^ rightView)(UIView *);

TT_CHAINAPI_TYPE TTFormInputView *(^ smsTitle)(NSString *smsTitle, UIControlState controlState);

TT_CHAINAPI_TYPE TTFormInputView *(^ smsTitleColor)(UIColor *smsTitleColor, UIControlState controlState);

TT_CHAINAPI_TYPE TTFormInputView *(^ smsBtnBackgroundColor)(UIColor *backgroundColor);

TT_CHAINAPI_TYPE TTFormInputView *(^ smsBtnCornerRadius)(CGFloat cornerRadius);

TT_CHAINAPI_TYPE TTFormInputView *(^ smsBtncContentEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormInputView *(^ smsCodeHidden)(BOOL);

TT_CHAINAPI_TYPE TTFormInputView *(^ lineColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormInputView *(^ lineEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormInputView *(^ lineHeight)(CGFloat height);

TT_CHAINAPI_TYPE TTFormInputView *(^ contentEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormInputView *(^ textFieldEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormInputView *(^ valueChangedBlock)(void (^valueChangedBlock)(id sender));

TT_CHAINAPI_TYPE TTFormInputView *(^ eventBlock)(void (^eventBlock)(id sender));

+ (TTFormInputView * (^)(void))input;

@end

NS_ASSUME_NONNULL_END
