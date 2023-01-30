//
//  NSString+isBlank.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

@import Foundation;

/**
 字符串是否为空
 */
@interface NSString (isBlank)

/**
 字符串是否为空

 @param str 检测的字符串
 @return 结果
 */
+ (BOOL)isBlank:(NSString*)str;

/**
 字符串是否是11位电话号码

 @param string 检测的字符串
 @return 结果
 */
+ (BOOL)isTelephones:(NSString *)string;

/**
 字符串是否是8位电话号码

 @param string 检测的字符串
 @return 结果
 */
+ (BOOL)isPhoneNumber:(NSString *)string;

@end
