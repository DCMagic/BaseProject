//
//  TTFormViewConfig.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/2/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#ifndef TTFormViewConfig_h
#define TTFormViewConfig_h

//#import "TTKit.h"

#import "UIView+Form.h"
#import "UIControl+Form.h"
#import "UITextField+FormLimit.h"
#import "UIGestureRecognizer+TTFormBlock.h"


#define     TT_CHAINAPI_TYPE            @property (nonatomic, copy, readonly)


#define TT_FORMV_SCREEN_H [UIScreen mainScreen].bounds.size.height
#define TT_FORMV_SCREEN_W [UIScreen mainScreen].bounds.size.width



#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = weak##o

/**
 *  适配不同尺寸的屏幕,已6的屏幕为基准宽度
 */
#define TT_FORMV_Adaptation_6(WidthOrHeight) (TT_FORMV_SCREEN_W / 375.0 * (WidthOrHeight))


#define     TT_FORMV_HexAColor(color, a)         [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:a]

#define     TT_FORMV_HexColor(color)             [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:1.0]

#define TT_FORMV_Font(f) [UIFont systemFontOfSize:f]


// 分割线颜色
#define TT_FORMV_lineColor TT_FORMV_HexColor(0xFFDDDDDD)
// 背景颜色
//#define TT_FORMV_BackgColor [UIColor whiteColor]
// 主题颜色
#define TT_FORMV_ThemeColor TT_FORMV_HexColor(0xFFD01815)
// 字体颜色
#define TT_FORMV_WordColor TT_FORMV_HexColor(0xFF333333)
// 头像背景颜色
#define TT_FORMV_headColor TT_FORMV_HexColor(0xFFF5F5F5)


#endif /* FormViewConfig_h */
