//
//  UIColor+Gradient.h
//  TTKit
//
//  Created by tao6 on 2017/8/28.
//  Copyright © 2017年 libokun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TTGradientColorDirection) {
    TTGradientColorDirectionHorizontal = 0,              //水平，默认
    TTGradientColorDirectionvertical = 1,                //垂直，

};


@interface UIColor (Gradient)

/**
 *  渐变颜色
 *
 *  @param fromColor    开始颜色
 *  @param toColor      结束颜色
 *  @param height       渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(int)height;


/**
 *  渐变颜色
 *
 *  @param fromColor    开始颜色
 *  @param toColor      结束颜色
 *  @param size         渐变范围
 *  @param direction    渐变方向
 *
 *  @return 渐变颜色
 */
+ (UIColor*)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withSize:(CGSize)size withDirection:(TTGradientColorDirection)direction;

@end
