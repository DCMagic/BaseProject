//
//  InspectionTaskRequestManager.h
//  BaseProject
//
//  Created by dongchao on 2022/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InspectionTaskRequestManager : NSObject

#pragma mark - 巡检首页列表
+(NSURLSessionDataTask *)postInspectionMainPageListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务列表
+(NSURLSessionDataTask *)postInspectionTaskListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务详情
+(NSURLSessionDataTask *)postInspectionTaskDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务资产、道路（树）
+(NSURLSessionDataTask *)postInspectionTaskTreeRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务-巡检记录（树）
+(NSURLSessionDataTask *)postInspectionTaskRecordTreeRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务详情-巡检点（地图）
+(NSURLSessionDataTask *)postInspectionTaskPointRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务详情-获取打卡半径
+(NSURLSessionDataTask *)postInspectionPunchRadiusRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 巡检任务-巡检点及打卡点上报
+(NSURLSessionDataTask *)postInspectionReportPointsRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 定向巡检-巡检记录上报
+(NSURLSessionDataTask *)postInspectionReportPlanRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 定向巡检-扫码获取资产信息
+(NSURLSessionDataTask *)postInspectionCheckInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 定向巡检-检查记录
+(NSURLSessionDataTask *)postInspectionCheckPointInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

@end

NS_ASSUME_NONNULL_END
