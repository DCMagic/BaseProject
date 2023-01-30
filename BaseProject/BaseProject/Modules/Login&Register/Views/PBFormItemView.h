//
//  PBFormItemView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBFormItemBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PBFormItemView : PBFormItemBaseView


TT_CHAINAPI_TYPE PBFormItemView *(^ text)(NSString *);

TT_CHAINAPI_TYPE PBFormItemView *(^ placeholder)(NSString *);

TT_CHAINAPI_TYPE PBFormItemView *(^ font)(UIFont *);

TT_CHAINAPI_TYPE PBFormItemView *(^ textColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormItemView *(^ textAlignment)(NSTextAlignment textAlignment);

TT_CHAINAPI_TYPE PBFormItemView *(^ rightIcon)(NSString *);

TT_CHAINAPI_TYPE PBFormItemView *(^ eventBlock)(void (^eventBlock)(id sender));

TT_CHAINAPI_TYPE PBFormItemView *(^ leftImage)(UIImage *);

TT_CHAINAPI_TYPE PBFormItemView *(^ leftIcon)(NSString *);

TT_CHAINAPI_TYPE PBFormItemView *(^ leftTitle)(NSString *title);

TT_CHAINAPI_TYPE PBFormItemView *(^ leftTitleColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormItemView *(^ lineColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormItemView *(^ lineEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE PBFormItemView *(^ showRedPrompt)(BOOL showRedPrompt);

TT_CHAINAPI_TYPE PBFormItemView *(^ contentEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE PBFormItemView *(^ headIcon)(NSString *);

TT_CHAINAPI_TYPE PBFormItemView *(^ headURL)(NSString *);

@property (nonatomic, strong) UIImageView   *headView;     // 头像view

+ (PBFormItemView * (^)(void))item;
@property (nonatomic, strong) UITextField   *itemTF;       // itemTF

@end

NS_ASSUME_NONNULL_END
