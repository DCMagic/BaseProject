//
//  TTFormItemView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTFormItemBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTFormItemView : TTFormItemBaseView


TT_CHAINAPI_TYPE TTFormItemView *(^ text)(NSString *);

TT_CHAINAPI_TYPE TTFormItemView *(^ attrText)(NSAttributedString *attrText);

TT_CHAINAPI_TYPE TTFormItemView *(^ placeholder)(NSString *);

TT_CHAINAPI_TYPE TTFormItemView *(^ font)(UIFont *);

TT_CHAINAPI_TYPE TTFormItemView *(^ textColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormItemView *(^ numberOfLines)(NSUInteger numberOfLines);

TT_CHAINAPI_TYPE TTFormItemView *(^ textAlignment)(NSTextAlignment textAlignment);
// 多行始终靠左显示
TT_CHAINAPI_TYPE TTFormItemView *(^ textMultiLineLeft)(BOOL textMultiLineLeft);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightIcon)(NSString *);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightHidden)(BOOL isHidden);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightView)(UIView *rightView);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightBtn)(UIButton *rightBtn);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightTitle)(NSString *title);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightFont)(UIFont *leftFont);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightColor)(UIColor *leftColor);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightHeight)(CGFloat rightHeight);

TT_CHAINAPI_TYPE TTFormItemView *(^ rightEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormItemView *(^ eventBlock)(void (^eventBlock)(id sender));

TT_CHAINAPI_TYPE TTFormItemView *(^ leftImage)(UIImage *);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftIcon)(NSString *);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftTitle)(NSString *title);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftFont)(UIFont *leftFont);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftColor)(UIColor *leftColor);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormItemView *(^ leftTitleEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormItemView *(^ lineColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormItemView *(^ lineHeight)(CGFloat height);

TT_CHAINAPI_TYPE TTFormItemView *(^ lineEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormItemView *(^ contentEdgeInsets)(UIEdgeInsets edgeInsets);

TT_CHAINAPI_TYPE TTFormItemView *(^ headIcon)(NSString *);

TT_CHAINAPI_TYPE TTFormItemView *(^ headURL)(NSString *);

TT_CHAINAPI_TYPE TTFormItemView *(^ headShadowColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormItemView *(^ headWH)(NSInteger headWH);

TT_CHAINAPI_TYPE TTFormItemView *(^ customView)(UIView *customView);

TT_CHAINAPI_TYPE TTFormItemView *(^ layout)(void);

@property (nonatomic, strong) UIImageView   *headView;     // 头像view

// 显示内容View
@property (nonatomic, weak, readonly) UIView   *itemView;

@property (nonatomic, strong) UITextField   *itemTF;       // itemTF

+ (TTFormItemView * (^)(void))item;
// 将自身的样式给itemView
- (TTFormItemView *)formatAtItem:(TTFormItemView *)itemView;

@end

NS_ASSUME_NONNULL_END
