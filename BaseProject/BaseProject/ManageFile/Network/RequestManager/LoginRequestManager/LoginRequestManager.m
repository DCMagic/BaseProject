//
//  LoginRequestManager.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "LoginRequestManager.h"
#import "LoginUrl.h"

@implementation LoginRequestManager

#pragma mark - #登录
+(NSURLSessionDataTask *)LoginRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    [ShowSVProgressHUD showWithStatus:@"登录中..."];
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kUserLoginPath];

    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:NO success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
        if (successModel.code != kRequestResultCode_0) {
            [ShowSVProgressHUD svpDismiss];
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:successModel.message.length == 0 ? @"登录失败" : successModel.message];
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        
        [ShowSVProgressHUD svpDismiss];
        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
        }else{
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
        }
        failureBlock(task,failModel);
        
    }];
    return task;
}

#pragma mark - #发送验证码
+(NSURLSessionDataTask *)SendVerificationCodeRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    [ShowSVProgressHUD showWithStatus:@"发送验证码"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kSendVerificationCodePath] params:params isJSONRequest:YES isJSONResponse:NO contentType:RequestHeaderContentTypeApplicationJson isToken:NO success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
        [ShowSVProgressHUD svpDismiss];
        if (successModel.code != kRequestResultCode_0) {
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:successModel.message.length == 0 ? @"验证码发送失败" : successModel.message];
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        
        [ShowSVProgressHUD svpDismiss];
        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
        }else{
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
        }
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - #修改密码
+(NSURLSessionDataTask *)ModifyPwdRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    [ShowSVProgressHUD showWithStatus:@"修改密码"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kModifyPwdPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
        [ShowSVProgressHUD svpDismiss];
        if (successModel.code != kRequestResultCode_0) {
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:successModel.message.length == 0 ? @"密码修改失败" : successModel.message];
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        
        [ShowSVProgressHUD svpDismiss];
        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
        }else{
            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
        }
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 获取当前登录人巡检组信息
+(NSURLSessionDataTask *)getUserWorkInfoDetailsRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kUserWrkInfoPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}


@end
