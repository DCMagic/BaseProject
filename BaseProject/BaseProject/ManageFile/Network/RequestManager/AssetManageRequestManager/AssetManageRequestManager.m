//
//  AssetManageRequestManager.m
//  BaseProject
//
//  Created by dongchao on 2022/12/19.
//

#import "AssetManageRequestManager.h"
#import "AssetManageUrl.h"

@implementation AssetManageRequestManager

#pragma mark - 获取字典
+(NSURLSessionDataTask *)getGetDictItemListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kGetDictItemList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 获取字典
+(NSURLSessionDataTask *)getGetDictItem2ListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kGetDictItemList2];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 普通杆列表
+(NSURLSessionDataTask *)getOrdinaryPoleListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kOrdinaryPoleList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 普通杆基本信息
+(NSURLSessionDataTask *)getOrdinaryPoleBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kOrdinaryPoleBaseInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 普通杆挂载设备列表
+(NSURLSessionDataTask *)getOrdinaryPoleDeviceListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kOrdinaryPoleDeviceList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 普通杆挂载设备详情
+(NSURLSessionDataTask *)getOrdinaryPoleDeviceDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kOrdinaryPoleDeviceDetail];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 多功能综合杆列表
+(NSURLSessionDataTask *)getMultifuntionPoleListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kMutifunctionPoleList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 多功能综合杆基本信息
+(NSURLSessionDataTask *)getMultifuntionPoleBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kMutifunctionPoleBaseInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 多功能综合杆挂载设备列表
+(NSURLSessionDataTask *)getMultifuntionPoleDeviceListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kMutifunctionPoleDeviceList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 多功能综合杆挂载设备详情
+(NSURLSessionDataTask *)getMultifuntionPoleDeviceDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kMutifunctionPoleDeviceDetail];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能信控设备列表
+(NSURLSessionDataTask *)getMultifuntionIntelligenceDeviceRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kMutifunctionPoleIntelligenceDevice];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能综合箱列表
+(NSURLSessionDataTask *)getIntelligentBoxListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntellgentBoxList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能综合箱基本信息
+(NSURLSessionDataTask *)getIntelligentBoxBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligentBoxBaseInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能综合箱网关基本信息
+(NSURLSessionDataTask *)getIntelligentGetwayBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligentGetwayBaseInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能综合箱网关运行监控
+(NSURLSessionDataTask *)getIntelligentGetwayMonitoringRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligentGetwayMonitoring];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能综合箱网关打开、关闭门锁
+(NSURLSessionDataTask *)getIntelligentGetwayOpenLockRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligentGetwayOpenLock];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 智能综合箱网关告警信息列表
+(NSURLSessionDataTask *)getIntelligentGetwayPageAlarmRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligentGetwayPageAlarm];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 箱控列表
+(NSURLSessionDataTask *)getIntelligenceBoxManageListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceBoxManageList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 箱控基本信息
+(NSURLSessionDataTask *)getIntelligenceBoxManageBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceBoxManageBaseInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 箱控运行监控
+(NSURLSessionDataTask *)getIntelligenceBoxManageMonitoringRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceBoxManageMonitoring];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 箱控告警信息列表
+(NSURLSessionDataTask *)getIntelligenceBoxManageAlarmListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceBoxManageAlarmList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 箱控告警信息详情
+(NSURLSessionDataTask *)getIntelligenceBoxManageAlarmInfoDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceBoxManageAlarmInfoDetail];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 电源列表
+(NSURLSessionDataTask *)getIntelligencePowerControlListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligencePowerControlList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 电源基本信息
+(NSURLSessionDataTask *)getIntelligencePowerControlBaseInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligencePowerControlBaseInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 电源运行监控
+(NSURLSessionDataTask *)getIntelligencePowerControlMonitoringRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligencePowerControlMonitoring];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 电源设置第二路检测方式
+(NSURLSessionDataTask *)getIntelligencePowerControlPatternRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligencePowerControlPattern];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 电源输出通路开启
+(NSURLSessionDataTask *)getIntelligencePowerControlConnectPowerRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligencePowerControlConnectPower];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 电源输出通路关闭
+(NSURLSessionDataTask *)getIntelligencePowerControlBreakPowerRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligencePowerControlBreakPower];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 网关列表
+(NSURLSessionDataTask *)getIntelligenceGetwayListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceGetwayList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 网关告警信息列表
+(NSURLSessionDataTask *)getIntelligenceGetwayAlarmListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceGetwayAlarmList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 网关告警基本信息、告警记录
+(NSURLSessionDataTask *)getIntelligenceGetwayAlarmDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kIntelligenceGetwayAlarmDetail];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}


@end
