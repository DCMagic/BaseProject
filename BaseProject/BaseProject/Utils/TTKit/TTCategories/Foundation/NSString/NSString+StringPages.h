//
//  NSString+StringPages.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringPages)

/**
 *  根据字符串进行分页
 *
 *  @param font  你想显示的字体大小，这个要保持统一
 *  @param rect     你想在多大的窗口显示
 *
 *  @return 返回一个数组，数组的元素是NSrange，根据NSRange来进行截取字符串
 */
- (NSArray *)tt_getPagesOfStringWithFont:(UIFont *)font inRect:(CGRect)rect;

@end
