//
//  NSString+StringSize.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

@import Foundation;

@interface NSString (StringSize)

/**
 字符串绘制大小

 @param font 字体大小
 @param size 限制范围
 @return 绘制大小
 */
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
