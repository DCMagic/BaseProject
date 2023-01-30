//
//  NSString+Dir.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/28.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Dir)


#pragma mark - 路径 -

/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir;

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir;

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir;

@end

NS_ASSUME_NONNULL_END
