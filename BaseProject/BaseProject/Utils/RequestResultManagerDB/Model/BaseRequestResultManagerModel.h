//
//  BaseRequestResultManagerModel.h
//  jingcaieyuan
//
//  Created by dongchao on 2018/9/21.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequestResultManagerModel : NSObject

@property (nonatomic,copy) NSString *url; /**< url */
@property (nonatomic,copy) NSString *params; /**< 参数 */
@property (nonatomic, assign) BOOL isToken; /**< 是否需要token */
@property (nonatomic, copy) NSString *contentType; /**< 请求的格式 */
@property (nonatomic, assign) BOOL isSuccess; /**< 是否成功 */
@property (nonatomic, copy) NSString *result; /**< 请求结果 */
@property (nonatomic, copy) NSString *storageDate; /**< 时间 */

@end
