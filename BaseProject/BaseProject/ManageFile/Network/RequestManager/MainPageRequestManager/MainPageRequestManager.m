//
//  MainPageRequestManager.m
//  BaseProject
//
//  Created by dongchao on 2022/3/28.
//

#import "MainPageRequestManager.h"
#import "MainUrl.h"

@implementation MainPageRequestManager

#pragma mark - 用户信息
//+(NSURLSessionDataTask *)getUserInfoRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
//
//    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kGetUserInfo] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
//        [ShowSVProgressHUD svpDismiss];
//        successBlock(task,successModel);
////        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];
//
//    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
//        failureBlock(task,failModel);
//    }];
//    return task;
//}

#pragma mark - 用户信息详情
+(NSURLSessionDataTask *)getUserInfoDetailsRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:getCurrentInfo] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 通知公告
+(NSURLSessionDataTask *)getNoticeListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kNoticeListPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 通知公告详情
+(NSURLSessionDataTask *)getNoticeDetailListRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
//    [ShowSVProgressHUD showWithStatus:@"请求通知公告详情"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kNoticeDetailListPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 上传图片
+(NSURLSessionDataTask *)UploadImageByRequestWithImages:(NSArray *)images success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] uploadImageWithUrlStr:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressImage serverPort:ServerPortNormal serverProject:ServerProjectNone path:kUploadHeadPicPath] images:images isCompressionImg:YES isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        successBlock(task,successModel);
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];

    return task;
}

#pragma mark - 个人任务数量完成情况
+(NSURLSessionDataTask *)getPersonalWorkNumRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
//    [ShowSVProgressHUD showWithStatus:@"请求通知公告详情"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kPersonalWorkNumPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

#pragma mark - 获取用户未读数
+(NSURLSessionDataTask *)getUnReadNumPathNumRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
//    [ShowSVProgressHUD showWithStatus:@"请求通知公告详情"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kUnReadNumPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}


#pragma mark - 获取用户未读消息数
+(NSURLSessionDataTask *)getUnReadMessageNumPathNumRequestWithParams :(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
//    [ShowSVProgressHUD showWithStatus:@"请求通知公告详情"];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:[SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:kUnReadMessageNumPath] params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);
//        [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"请求成功"];

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}


#pragma mark--多杆项目接口
//获取用户登录信息
+ (NSURLSessionDataTask *)getLoginUserInfoRequestWithParams:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestSuccessModel * _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nonnull, BaseRequestFailModel * _Nonnull))failureBlock {
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:getLoginUserInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
            [ShowSVProgressHUD svpDismiss];
            successBlock(task,successModel);
    
        } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
            [ShowSVProgressHUD svpDismiss];
            failureBlock(task,failModel);
        }];
        return task;
}
//查询当前登录者信息
+(NSURLSessionDataTask *)getCurrentInfoRequestWithParams:(id)params success:(void(^)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel))successBlock failure:(void(^)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel))failureBlock{
    
    NSString *url = [SplicingUrl SplicingUrlWithServerAddress:ServerAddressNormal serverPort:ServerPortNormal serverProject:ServerProjectNone path:getCurrentInfo];
    
    NSURLSessionDataTask *task = [[BaseNetworkRequest shareNetworkRequest] postRequestWithUrl:url params:params isJSONRequest:YES isJSONResponse:YES contentType:RequestHeaderContentTypeApplicationJson isToken:YES success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        [ShowSVProgressHUD svpDismiss];
        successBlock(task,successModel);

    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        failureBlock(task,failModel);
    }];
    return task;
}

@end
