//
//  TroubleRequestManager.h
//  BaseProject
//
//  Created by yangyang on 2022/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TroubleRequestManager : NSObject

#pragma mark - 获取故障类型字典
+(NSURLSessionDataTask *)getDictionaryNodeListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检故障-故障列表
+(NSURLSessionDataTask *)getInspectTaskCheckPointAssetsInfoAssetsPageParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检故障-删除故障
+(NSURLSessionDataTask *)getInspectTaskCheckPointAssetsInfoDeleteParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检故障-查看故障
+(NSURLSessionDataTask *)getInspectTaskCheckPointAssetsInfoDetailParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 上传图片
+(NSURLSessionDataTask *)uploadImageByRequestWithImages:(NSArray *)images success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 常规巡检-故障上报
+(NSURLSessionDataTask *)saveInspectTaskCheckPointAssetsInfoParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

@end


NS_ASSUME_NONNULL_END
