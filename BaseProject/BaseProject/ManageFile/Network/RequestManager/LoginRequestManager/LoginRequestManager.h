//
//  LoginRequestManager.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginRequestManager : NSObject

#pragma mark - #登录
+(NSURLSessionDataTask *)LoginRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 个人信息

#pragma mark - #注册

#pragma mark - #发送验证码
+(NSURLSessionDataTask *)SendVerificationCodeRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - #校验短信验证码

#pragma mark 退出登录

#pragma mark - #修改密码
+(NSURLSessionDataTask *)ModifyPwdRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 获取用户工作单位信息
+(NSURLSessionDataTask *)getUserWorkInfoDetailsRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;


@end

NS_ASSUME_NONNULL_END
