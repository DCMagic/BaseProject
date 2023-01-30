//
//  NSString+firstChar.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 获取字符串的首字母（不管是汉子还是拼音）
 */
@interface NSString (firstChar)


/**
 获取首字母，缺省为#

 @return 首字母
 */
- (NSString*)firstChar;

@end

NS_ASSUME_NONNULL_END
