//
//  PBFormView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/14.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBFormInputView.h"
#import "PBFormItemBaseView.h"
#import "PBFormItemView.h"
#import "PBFormLineView.h"

NS_ASSUME_NONNULL_BEGIN

// 表单View  登录 注册
@interface PBFormView : PBFormItemBaseView

TT_CHAINAPI_TYPE PBFormView *(^ margin)(CGFloat);

TT_CHAINAPI_TYPE PBFormView *(^ paddingAll)(CGFloat edgeInsetAll);

TT_CHAINAPI_TYPE PBFormView *(^ padding)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE PBFormView *(^ addInput)(PBFormInputView *);

TT_CHAINAPI_TYPE PBFormView *(^ addItem)(PBFormItemBaseView *);

TT_CHAINAPI_TYPE PBFormView *(^ removeTag)(NSUInteger tag);

TT_CHAINAPI_TYPE PBFormView *(^ end)(void);

TT_CHAINAPI_TYPE PBFormItemView *(^ item)(NSUInteger tag);

TT_CHAINAPI_TYPE PBFormLineView *(^ line)(NSUInteger tag);




+ (PBFormView * (^)(void))form;


@end

NS_ASSUME_NONNULL_END
