//
//  NSString+URL.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

@property (nonatomic, strong, readonly) NSURL *toURL;

#pragma mark - # 编码
/**
 *  url编码，使用 NSUTF8StringEncoding 格式
 *
 *  @return encode后的字符串
 */
- (NSString *)urlEncode;

/**
 *  url编码
 *
 *  @param encoding 编码模式
 *
 *  @return encode后的字符串
 */
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;


#pragma mark - # 解码
/**
 *  url解码，使用 NSUTF8StringEncoding 格式
 *
 *  @return decode后的字符串
 */
- (NSString *)urlDecode;

/**
 *  url解码
 *
 *  @param encoding 编码模式
 *
 *  @return decode后的字符串
 */
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding;


#pragma mark - # url解析
/**
 *  将url中的参数转成dic
 */
- (NSDictionary *)dictionaryFromURLParameters;


@end
