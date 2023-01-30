//
//  NetworkCode.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "NetworkCode.h"

CGFloat  const kRequestResultCode_401 = 401; /**< token失效 */
CGFloat  const kRequestResultCode_403 = 403; /**< 没有权限 */
CGFloat  const kRequestResultCode_0 = 0; /**< 接口请求成功 */
CGFloat  const kRequestResultCode__1001 = -1001; /**< 请求超时，在评论时代表包含敏感词，被禁言 */
CGFloat  const kRequestResultCode__1009 = -1009; /**< 无网络 */
CGFloat  const kRequestResultCode__1011 = -1011; /**< 未查询到对应的用户信息 */ // 跳转设置密码
CGFloat  const kRequestResultCode__999 = -999; /**< 取消请求 */
CGFloat  const kRequestResultCode__1005 = -1005; /**< 手机号未注册 */

CGFloat  const kRequestResultCode__1008 = -1008; /**< 在评论时代表发布的词包含不确定的敏感词，需要后台审核 */
