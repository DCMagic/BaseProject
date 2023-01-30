//
//  UIImage+Color.h
//  TTKit
//
//  Created by libokun on 15/9/6.
//  Copyright (c) 2015年 libokun. All rights reserved.
//

#import <UIKit/UIKit.h>


//typedef NS_ENUM(NSInteger, TTGradientColorDirection) {
//    TTGradientColorDirectionHorizontal = 0,              //水平，默认
//    TTGradientColorDirectionvertical = 1,                //垂直，
//
//};


@interface UIImage (TTColor)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color lucency:(CGFloat)scale;

// 灰色图像
- (UIImage *)grayImage;

// 根据颜色 生成返回按钮图片  默认 44x44
+ (UIImage *)backButtonImageWithColor:(UIColor *)color;

/**
 *  渐变颜色
 *
 *  @param fromColor    开始颜色
 *  @param toColor      结束颜色
 *  @param size         渐变范围
 *  @param direction    渐变方向
 *
 *  @return 渐变颜色图片
 */
//+ (UIImage *)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withSize:(CGSize)size withDirection:(TTGradientColorDirection)direction;

@end
