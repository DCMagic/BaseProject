//
//  NSString+Contains.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Contains)

@property (nonatomic, assign, readonly, getter=isContainEmoji) BOOL containEmoji;

@property (nonatomic, assign, readonly, getter=isContainChinese) BOOL containChinese;

@property (nonatomic, assign, readonly, getter=isContainBlank) BOOL containBlank;


/**
 *  去除空格&空字符串
 *
 *  @return 去除空格后的字符串
 */
- (NSString *)trimmingWhitespace;


@end
