//
//  TTFormView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTFormInputView.h"
#import "TTFormItemBaseView.h"
#import "TTFormItemView.h"
#import "TTFormLineView.h"
#import "TTFormCheckboxView.h"

NS_ASSUME_NONNULL_BEGIN

// 表单View  登录 注册
@interface TTFormView : TTFormItemBaseView

TT_CHAINAPI_TYPE TTFormView *(^ margin)(CGFloat);

TT_CHAINAPI_TYPE TTFormView *(^ paddingAll)(CGFloat edgeInsetAll);

TT_CHAINAPI_TYPE TTFormView *(^ padding)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormView *(^ addInput)(TTFormInputView *);

TT_CHAINAPI_TYPE TTFormView *(^ addItem)(TTFormItemBaseView *);

TT_CHAINAPI_TYPE TTFormView *(^ removeTag)(NSUInteger tag);
// 不缓存高度
TT_CHAINAPI_TYPE TTFormView *(^ noCacheHeight)(void);

TT_CHAINAPI_TYPE TTFormView *(^ end)(void);

TT_CHAINAPI_TYPE TTFormView *(^ scroll)(void);

TT_CHAINAPI_TYPE TTFormView *(^ layout)(void);

TT_CHAINAPI_TYPE TTFormView *(^ removeAllItem)(void);

TT_CHAINAPI_TYPE TTFormItemView *(^ item)(NSUInteger tag);

TT_CHAINAPI_TYPE TTFormItemView *(^ copyOneItem)(NSUInteger tag);

TT_CHAINAPI_TYPE TTFormItemView *(^ copyTwoItem)(NSUInteger tag);

TT_CHAINAPI_TYPE TTFormItemView *(^ copyItem)(NSUInteger tag, NSUInteger copyTag);

TT_CHAINAPI_TYPE TTFormInputView *(^ input)(NSUInteger tag);

TT_CHAINAPI_TYPE TTFormLineView *(^ line)(NSUInteger tag);

TT_CHAINAPI_TYPE TTFormCheckboxView *(^ checkBox)(NSUInteger tag);

+ (TTFormView * (^)(void))form;

@property (nonatomic, weak) TTFormItemView *lastItem;

@end

NS_ASSUME_NONNULL_END
