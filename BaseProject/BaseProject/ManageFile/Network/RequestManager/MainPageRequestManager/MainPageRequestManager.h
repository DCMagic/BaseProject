//
//  MainPageRequestManager.h
//  BaseProject
//
//  Created by dongchao on 2022/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageRequestManager : NSObject

#pragma mark - 用户信息
//+(NSURLSessionDataTask *)getUserInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 用户信息详情
+(NSURLSessionDataTask *)getUserInfoDetailsRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 通知公告
+(NSURLSessionDataTask *)getNoticeListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 通知公告详情
+(NSURLSessionDataTask *)getNoticeDetailListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 上传图片
+(NSURLSessionDataTask *)UploadImageByRequestWithImages:(NSArray *)images success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 个人任务数量完成情况
+(NSURLSessionDataTask *)getPersonalWorkNumRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 获取用户未读数
+(NSURLSessionDataTask *)getUnReadNumPathNumRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 获取用户未读消息数
+(NSURLSessionDataTask *)getUnReadMessageNumPathNumRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;


#pragma mark--多杆项目接口
//获取用户登录信息
+(NSURLSessionDataTask *)getLoginUserInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;
//查询当前登录者信息
+(NSURLSessionDataTask *)getCurrentInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

@end

NS_ASSUME_NONNULL_END
