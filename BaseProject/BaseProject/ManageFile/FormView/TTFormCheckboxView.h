//
//  TTFormCheckboxView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTFormItemBaseView.h"

typedef NS_ENUM(NSUInteger, FormSelectedType) {
    FormSelectedTypeSingle, // 单选
    FormSelectedTypeMultiple,   // 多选
};

@interface TTFormCheckboxView : TTFormItemBaseView

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ font)(UIFont *);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ textColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ normalIcon)(UIImage *);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ selectedIcon)(UIImage *);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ options)(NSArray<NSString *> *optionTitles);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ lineColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ lineHeight)(CGFloat height);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ lineEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ contentEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ selectedType)(FormSelectedType selectedType);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ selectedBlock)(void (^selectedBlock)(NSArray *selectedArr));

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ selectedOption)(NSArray *selectedArr);

@end
