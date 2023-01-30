//
//  TroubleRequestManager.m
//  BaseProject
//
//  Created by yangyang on 2022/11/22.
//

#import "TroubleRequestManager.h"
#import "TroubleUrl.h"

@implementation TroubleRequestManager

#pragma mark - 获取故障类型字典
+ (NSURLSessionDataTask *)getDictionaryNodeListRequestWithParams:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:inspectBaseInfoGetDictionaryNodeList];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 巡检故障-故障列表
+ (NSURLSessionDataTask *)getInspectTaskCheckPointAssetsInfoAssetsPageParams:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:inspectTaskCheckPointAssetsInfoAssetsPage];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 巡检故障-删除故障
+ (NSURLSessionDataTask *)getInspectTaskCheckPointAssetsInfoDeleteParams:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:inspectTaskCheckPointAssetsInfoDelete];
    [ShowSVProgressHUD showWithStatus:@"加载中"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 巡检故障-查看故障
+ (NSURLSessionDataTask *)getInspectTaskCheckPointAssetsInfoDetailParams:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:inspectTaskCheckPointAssetsInfoDetail];
    [ShowSVProgressHUD showWithStatus:@"加载中"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}

#pragma mark - 上传图片
+(NSURLSessionDataTask *)uploadImageByRequestWithImages:(NSArray *)images success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressImage serverPort:ServerPortNormal serverProject:ServerProjectNone path:uploadFilePath];
    
    [ShowSVProgressHUD showWithStatus:@"加载中"];
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] uploadImageWithUrlStr:url images:images isCompressionImg:YES isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        if (successModel.code == kRequestResultCode_0) {
            [ShowSVProgressHUD showSuccessWithImageName:nil message:@"提交成功"];
        } else {
            [ShowSVProgressHUD showErrorWithImageName:nil message:successModel.message];
        }
        successBlock(task,successModel);
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        [ShowSVProgressHUD showErrorWithImageName:nil message:@"提交失败"];
        failureBlock(task,failModel);
    }];

    return task;
}

#pragma mark - 常规巡检-故障上报
+ (NSURLSessionDataTask *)saveInspectTaskCheckPointAssetsInfoParams:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:inspectTaskCheckPointAssetsInfoSave];
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

@end
