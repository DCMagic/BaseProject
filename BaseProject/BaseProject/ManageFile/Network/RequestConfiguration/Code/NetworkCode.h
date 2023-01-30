//
//  NetworkCode.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**< token失效 */
UIKIT_EXTERN CGFloat const kRequestResultCode_401;

/**< 没有权限 */
UIKIT_EXTERN CGFloat const kRequestResultCode_403;

/**< 接口请求成功 */
UIKIT_EXTERN CGFloat const kRequestResultCode_0;

/**< 请求超时，在评论时代表包含敏感词，被禁言 */
UIKIT_EXTERN CGFloat const kRequestResultCode__1001;

/**<  未查询到对应的用户信息 */
UIKIT_EXTERN CGFloat const kRequestResultCode__1011;

/**< 无网络 */
UIKIT_EXTERN CGFloat const kRequestResultCode__1009;

/**< 取消请求 */
UIKIT_EXTERN CGFloat const kRequestResultCode__999;


/**< 手机号未注册 */
UIKIT_EXTERN CGFloat const kRequestResultCode__1005;

/**< 在评论时代表发布的词包含不确定的敏感词，需要后台审核 */
UIKIT_EXTERN CGFloat const kRequestResultCode__1008;

