//
//  AssetManageRequestManager.h
//  BaseProject
//
//  Created by dongchao on 2022/12/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AssetManageRequestManager : NSObject

#pragma mark - 获取字典
+(NSURLSessionDataTask *)getGetDictItemListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 获取字典2
+(NSURLSessionDataTask *)getGetDictItem2ListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;


#pragma mark - 普通杆列表
+(NSURLSessionDataTask *)getOrdinaryPoleListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 普通杆基本信息
+(NSURLSessionDataTask *)getOrdinaryPoleBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 普通杆挂载设备列表
+(NSURLSessionDataTask *)getOrdinaryPoleDeviceListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 普通杆挂载设备列表
+(NSURLSessionDataTask *)getOrdinaryPoleDeviceDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 多功能综合杆列表
+(NSURLSessionDataTask *)getMultifuntionPoleListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 多功能综合杆基本信息
+(NSURLSessionDataTask *)getMultifuntionPoleBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 多功能综合杆挂载设备列表
+(NSURLSessionDataTask *)getMultifuntionPoleDeviceListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 多功能综合杆挂载设备详情
+(NSURLSessionDataTask *)getMultifuntionPoleDeviceDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能信控设备列表
+(NSURLSessionDataTask *)getMultifuntionIntelligenceDeviceRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能综合箱列表
+(NSURLSessionDataTask *)getIntelligentBoxListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能综合箱基本信息
+(NSURLSessionDataTask *)getIntelligentBoxBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能综合箱网关基本信息
+(NSURLSessionDataTask *)getIntelligentGetwayBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能综合箱网关运行监控
+(NSURLSessionDataTask *)getIntelligentGetwayMonitoringRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能综合箱网关告警信息列表
+(NSURLSessionDataTask *)getIntelligentGetwayPageAlarmRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 智能综合箱网关打开、关闭门锁
+(NSURLSessionDataTask *)getIntelligentGetwayOpenLockRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

/*++++++++++++++++++++++++++++++++    监控    +++++++++++++++++++++++++++++++++++++++*/

#pragma mark - 箱控列表
+(NSURLSessionDataTask *)getIntelligenceBoxManageListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 箱控基本信息
+(NSURLSessionDataTask *)getIntelligenceBoxManageBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 箱控运行监控
+(NSURLSessionDataTask *)getIntelligenceBoxManageMonitoringRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 箱控告警信息列表
+(NSURLSessionDataTask *)getIntelligenceBoxManageAlarmListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 箱控告警信息详情
+(NSURLSessionDataTask *)getIntelligenceBoxManageAlarmInfoDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 电源列表
+(NSURLSessionDataTask *)getIntelligencePowerControlListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 电源基本信息
+(NSURLSessionDataTask *)getIntelligencePowerControlBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 电源运行监控
+(NSURLSessionDataTask *)getIntelligencePowerControlMonitoringRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 电源设置第二路检测方式
+(NSURLSessionDataTask *)getIntelligencePowerControlPatternRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 电源输出通路开启
+(NSURLSessionDataTask *)getIntelligencePowerControlConnectPowerRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 电源输出通路关闭
+(NSURLSessionDataTask *)getIntelligencePowerControlBreakPowerRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 网关列表
+(NSURLSessionDataTask *)getIntelligenceGetwayListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 网关告警信息列表
+(NSURLSessionDataTask *)getIntelligenceGetwayAlarmListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;

#pragma mark - 网关告警基本信息、告警记录
+(NSURLSessionDataTask *)getIntelligenceGetwayAlarmDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock;


@end

NS_ASSUME_NONNULL_END
