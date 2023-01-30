//
//  GlobalRequestManager.m
//  BaseProject
//
//  Created by dongchao on 2023/1/18.
//

#import "GlobalRequestManager.h"

@implementation GlobalRequestManager

#pragma mark - 获取请求数据
+ (NSURLSessionDataTask *)getDataRequestWithAppendUrl:appendUrl params:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    if (!appendUrl) { return nil;}
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:appendUrl];
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
