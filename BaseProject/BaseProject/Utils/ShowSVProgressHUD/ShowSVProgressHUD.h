//
//  ShowSVProgressHUD.h
//  jingcaiyuanyu
//
//  Created by dongchao on 2018/8/20.
//  Copyright © 2018年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowSVProgressHUD : NSObject


/**
 一直转圈，带文字提示,不可交互

 @param status 提示文字
 */
+(void)showWithStatus :(NSString*)status;


/**
 一直转圈，带文字提示,可交互

 @param status 提示文字
 */
+(void)showInteractiveWithStatus :(NSString*)status;


/**
 显示带图片的提示文字，显示1.5秒

 @param imageName 图片名
 @param status 显示消息
 */
+(void)showInfoWithImageName :(NSString *)imageName status :(NSString *)status;


/**
 显示带图片的提示文字，显示1.5秒，可交互

 @param imageName 图片名
 @param status 图片名
 */
+(void)showInteractiveInfoWithImageName :(NSString *)imageName status :(NSString *)status;

/**
 显示不带图片的提示文字，显示1.5秒,不可交互

 @param status 提示文字
 */
+(void)showNoImageInfoWithStatus :(NSString *)status;


/**
 显示不带图片的提示文字，显示1.5秒,可交互

 @param status 提示文字
 */
+(void)showInteractiveNoImageInfoWithStatus :(NSString *)status;

/**
 显示错误提示消息，不可交互

 @param imageName 错误提示图片
 @param message 错误信息
 */
+(void)showErrorWithImageName :(NSString *)imageName message :(NSString *)message;


/**
 显示错误提示消息,可交互

 @param imageName 显示错误提示消息
 @param message 错误信息
 */
+(void)showInteractiveErrorWithImageName :(NSString *)imageName message :(NSString *)message;


/**
 显示成功消息，不可交互

 @param imageName 成功图片
 @param message 成功信息
 */
+(void)showSuccessWithImageName :(NSString *)imageName message :(NSString *)message;

/**
 显示成功消息,可交互

 @param imageName 成功图片
 @param message 成功信息
 */
+(void)showInteractiveSuccessWithImageName :(NSString *)imageName message :(NSString *)message;

/**
 关闭最后一个显示
 */
+(void)svpPopActivity;


/**
 关闭所有显示
 */
+(void)svpDismiss;

@end
