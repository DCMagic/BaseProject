//
//  InspectionTaskRequestManager.m
//  BaseProject
//
//  Created by dongchao on 2022/11/18.
//

#import "InspectionTaskRequestManager.h"
#import "InspectionTaskUrl.h"

@implementation InspectionTaskRequestManager

#pragma mark - 巡检首页列表
+(NSURLSessionDataTask *)postInspectionMainPageListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kInspectMainList] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务列表
+(NSURLSessionDataTask *)postInspectionTaskListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kInspectTaskList] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务详情
+(NSURLSessionDataTask *)postInspectionTaskDetailRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kInspectTaskDetail] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务资产、道路（树）
+(NSURLSessionDataTask *)postInspectionTaskTreeRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kInspectTaskTree] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务-巡检记录（树）
+(NSURLSessionDataTask *)postInspectionTaskRecordTreeRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kInspectRecordTree] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务详情-巡检点（地图）
+(NSURLSessionDataTask *)postInspectionTaskPointRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kInspectPoint] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务详情-获取打卡半径
+(NSURLSessionDataTask *)postInspectionPunchRadiusRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kGetPunchRadius] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 巡检任务-巡检点及打卡点上报
+(NSURLSessionDataTask *)postInspectionReportPointsRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kReportPoint] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 定向巡检-巡检记录上报
+(NSURLSessionDataTask *)postInspectionReportPlanRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kReportPlan];
    [ShowSVProgressHUD showWithStatus:@"加载中"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
        if (successModel.code == kRequestResultCode_0) {
            [ShowSVProgressHUD showSuccessWithImageName:nil message:@"提交成功"];
            successBlock(task,successModel);
        } else {
            [ShowSVProgressHUD showErrorWithImageName:nil message:successModel.message];
            successBlock(task,successModel);
        }
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        [ShowSVProgressHUD showErrorWithImageName:nil message:@"提交失败"];
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 定向巡检-扫码获取资产信息
+(NSURLSessionDataTask *)postInspectionCheckInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    [ShowSVProgressHUD showWithStatus:@"加载中"];
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kGetCheckInfo] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
        if (successModel.code == kRequestResultCode_0) {
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
        } else {
            [ShowSVProgressHUD showErrorWithImageName:nil message:successModel.message];
            successBlock(task,successModel);
        }
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        [ShowSVProgressHUD showErrorWithImageName:nil message:@"获取失败"];
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 定向巡检-检查记录
+(NSURLSessionDataTask *)postInspectionCheckPointInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kGetCheckPointInfo] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

@end
