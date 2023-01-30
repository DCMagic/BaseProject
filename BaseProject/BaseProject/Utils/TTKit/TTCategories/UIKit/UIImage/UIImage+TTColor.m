//
//  UIImage+Color.m
//  TTKit
//
//  Created by libokun on 15/9/6.
//  Copyright (c) 2015年 libokun. All rights reserved.
//

#import "UIImage+TTColor.h"

@implementation UIImage (TTColor)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color lucency:(CGFloat)scale {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 
- (UIImage *)grayImage {
    int width = self.size.width;
    int height = self.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  kCGBitmapByteOrderDefault);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), self.CGImage);
    CGImageRef image = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:image];
    CGImageRelease(image);
    CGContextRelease(context);
    
    return grayImage;
}


// 根据颜色 生成返回按钮图片
+ (UIImage *)backButtonImageWithColor:(UIColor *)color; {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 10.0f, 18.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(rect.size.width,0);
    CGPoint middlePoint = CGPointMake(0, rect.size.height * 0.5);
    CGPoint endPoint = CGPointMake(rect.size.width, rect.size.height);
    
    [path moveToPoint:startPoint];
    [path addLineToPoint:middlePoint];
    
    [path moveToPoint:endPoint];
    [path addLineToPoint:middlePoint];
    
    [path closePath];
    path.lineWidth = 1;
    UIColor *fillColor = color;
    [fillColor set];
    [path stroke];
    CGContextDrawPath(context, kCGPathStroke);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


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
+ (UIImage *)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withSize:(CGSize)size withDirection:(TTGradientColorDirection)direction {

    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();

    NSArray* colors = [NSArray arrayWithObjects:(id)fromColor.CGColor, (id)toColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);

    CGPoint endPoint = CGPointMake(0, size.width);

    switch (direction) {
        case TTGradientColorDirectionHorizontal:
            endPoint = CGPointMake(0, size.width);
            break;
        case TTGradientColorDirectionvertical:
            endPoint = CGPointMake(0, size.height);
            break;
        default:
            break;
    }

    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), endPoint, 0);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return image;

}


@end
