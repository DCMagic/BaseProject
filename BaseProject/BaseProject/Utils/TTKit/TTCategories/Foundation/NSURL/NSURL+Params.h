//
//  NSURL+Params.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Params)

/**
 *  url参数转字典
 */
- (NSDictionary *)parameters;

/**
 *  根据参数名 取参数值
 */
- (NSString *)valueForParameter:(NSString *)parameterKey;

@end
