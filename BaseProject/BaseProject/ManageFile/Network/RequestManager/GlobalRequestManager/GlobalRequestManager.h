//
//  GlobalRequestManager.h
//  BaseProject
//
//  Created by dongchao on 2023/1/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalRequestManager : NSObject

#pragma mark - 获取请求数据
+(NSURLSessionDataTask *)getDataRequestWithAppendUrl:appendUrl params:(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

@end

NS_ASSUME_NONNULL_END
