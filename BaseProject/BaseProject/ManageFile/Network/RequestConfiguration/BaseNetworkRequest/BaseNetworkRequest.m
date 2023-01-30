//
//  BaseNetworkRequest.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/7.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "BaseNetworkRequest.h"
#import "RequestResultManager.h"
#import "LaunchManager.h"
//#import "useri"

//#import "BaseRequestResultManagerModel.h"

@implementation BaseNetworkRequest

+(BaseNetworkRequest *)shareNetworkRequest{
    
    static  BaseNetworkRequest * shareData  = nil;
    static dispatch_once_t   predicate;
    dispatch_once(&predicate,^{
        shareData = [[BaseNetworkRequest alloc] init];
    });
    return shareData;
}


/**
 post
 
 @param url 地址
 @param params 参数
 @param isJSONRequest 入参是否为json格式
 @param isJSONResponse 出参是否为json格式
 @param contentType 请求头格式
 @param isToken 是否需要token
 @param successBlock 成功回调
 @param failureBlock 失败回调
 @return 当前请求
 */
-(NSURLSessionDataTask *)postRequestWithUrl:(NSString *)url params:(id)params isJSONRequest :(BOOL)isJSONRequest isJSONResponse :(BOOL)isJSONResponse contentType :(RequestHeaderContentType)contentType isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求是json格式
    if (isJSONRequest) {
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    // 设置返回值是json格式
    if (isJSONResponse) {
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    NSString *type = @"";
    
    switch (contentType) {
        case RequestHeaderContentTypeApplicationJson:
            type = @"application/json";
            break;
            
        case RequestHeaderContentTypeMultipartFormData:
            type = @"multipart/form-data";
            break;
            
        case RequestHeaderContentTypeTextJavascript:
            type = @"text/javascript";
            break;
            
        case RequestHeaderContentTypeTextPlain:
            type = @"text/plain";
            break;
            
        case RequestHeaderContentTypeTextHtml:
            type = @"text/html";
            break;
            
        case RequestHeaderContentTypeTextJson:
            type = @"text/json";
            break;
    }
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObject:type];
    NSString *tokenStr = @"";
    if (isToken) {
        tokenStr = [PBUserInfo shareManager].token;
        [manager.requestSerializer setValue:tokenStr forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
    manager.requestSerializer.timeoutInterval = 15.0f;
    
    NSURLSessionDataTask *task = [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *data=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSString *logStr = [NSString stringWithFormat:@"请求成功：接口：%@\n请求参数：%@\n用户token：%@\n返回信息：%@",task.response.URL.absoluteString,jsonStr,tokenStr,responseObject];
        NSLog(@"%@",logStr);
        
        // cookies
        NSDictionary *fields = ((NSHTTPURLResponse *)task.response).allHeaderFields;
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:[NSURL URLWithString:url]];
        for (NSHTTPCookie *cookie in cookies) {
            NSLog(@"cookies ====== name : %@, value: %@",cookie.name, cookie.value);
        }
        
//        // 数据持久化
//        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentDirectory = [path objectAtIndex:0];
//        NSString *filePath = [documentDirectory stringByAppendingPathComponent:@"requestLogdc.plist"];
//        [logStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = type;
//        model.isSuccess = YES;
//
//        NSString * str = @"";
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
//            str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([params isKindOfClass:[NSArray class]]){
//            str = [params componentsJoinedByString:@"；"];
//        }else if ([params isKindOfClass:[NSString class]]){
//            str = params;
//        }
//
//        model.params = str;
//
//        NSString * resultStr = @"";
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//            resultStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([responseObject isKindOfClass:[NSArray class]]){
//            resultStr = [params componentsJoinedByString:@"；"];
//            resultStr = [resultStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        }else if ([responseObject isKindOfClass:[NSString class]]){
//            resultStr = [responseObject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];;
//        }
//        model.result = resultStr;
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:responseObject];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，请重新登录"];
            return;
        }
        successBlock(task,successModel);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *logStr = [NSString stringWithFormat:@"请求失败：接口：%@\n请求参数：%@\n用户token：%@\n错误信息：%@",task.response.URL.absoluteString,params,tokenStr,error];
        NSLog(@"%@",logStr);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，请重新登录"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpPopActivity];
            return;
        }
        
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = type;
//        model.isSuccess = NO;
//        NSString * str = @"";
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
//            str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([params isKindOfClass:[NSArray class]]){
//            str = [params componentsJoinedByString:@"；"];
//        }else if ([params isKindOfClass:[NSString class]]){
//            str = params;
//        }
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
        failureBlock(task,failModel);
        
    }];
    return task;
}


/**
 put
 
 @param url 地址
 @param params 参数
 @param isJSONRequest 入参是否为json格式
 @param isJSONResponse 出参是否为json格式
 @param contentType 请求头格式
 @param isToken 是否需要token
 @param successBlock 成功回调
 @param failureBlock 失败回调
 @return 当前请求
 */
-(NSURLSessionDataTask *)putRequestWithUrl:(NSString *)url params:(id)params isJSONRequest :(BOOL)isJSONRequest isJSONResponse :(BOOL)isJSONResponse contentType :(RequestHeaderContentType)contentType isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求是json格式
    if (isJSONRequest) {
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    // 设置返回值是json格式
    if (isJSONResponse) {
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    NSString *type = @"";
    
    switch (contentType) {
        case RequestHeaderContentTypeApplicationJson:
            type = @"application/json";
            break;
            
        case RequestHeaderContentTypeMultipartFormData:
            type = @"multipart/form-data";
            break;
            
        case RequestHeaderContentTypeTextJavascript:
            type = @"text/javascript";
            break;
            
        case RequestHeaderContentTypeTextPlain:
            type = @"text/plain";
            break;
            
        case RequestHeaderContentTypeTextHtml:
            type = @"text/html";
            break;
            
        case RequestHeaderContentTypeTextJson:
            type = @"text/json";
            break;
    }
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObject:type];
    
    if (isToken) {
        [manager.requestSerializer setValue:[PBUserInfo shareManager].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
    manager.requestSerializer.timeoutInterval = 15.0f;
    
    NSURLSessionDataTask *task = [manager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"接口%@请求成功，数据-----%@",task.response.URL.absoluteString,responseObject);
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = type;
//        model.isSuccess = YES;
//
//        NSString * str = @"";
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
//            str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([params isKindOfClass:[NSArray class]]){
//            str = [params componentsJoinedByString:@"；"];
//        }else if ([params isKindOfClass:[NSString class]]){
//            str = params;
//        }
//
//        model.params = str;
//
//        NSString * resultStr = @"";
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//            resultStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([responseObject isKindOfClass:[NSArray class]]){
//            resultStr = [params componentsJoinedByString:@"；"];
//            resultStr = [resultStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        }else if ([responseObject isKindOfClass:[NSString class]]){
//            resultStr = [responseObject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];;
//        }
//        model.result = resultStr;
//
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:responseObject];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        successBlock(task,successModel);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"接口%@请求失败，数据-----%@",task.response.URL.absoluteString,error);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpPopActivity];
            return;
        }
        
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = type;
//        model.isSuccess = NO;
//        NSString * str = @"";
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
//            str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([params isKindOfClass:[NSArray class]]){
//            str = [params componentsJoinedByString:@"；"];
//        }else if ([params isKindOfClass:[NSString class]]){
//            str = params;
//        }
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
        failureBlock(task,failModel);
        
    }];
    return task;
    
}



/**
 get
 
 @param url 地址
 @param params 参数
 @param isJSONResponse 出参是否为json格式
 @param contentType 请求头
 @param isToken 是否需要token
 @param successBlock 成功回调
 @param failureBlock 失败回调
 @return 当前请求
 */
-(NSURLSessionDataTask *)getRequestWithUrl:(NSString *)url params:(id)params isJSONResponse :(BOOL)isJSONResponse contentType :(RequestHeaderContentType)contentType isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置返回值是json格式
    if (isJSONResponse) {
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    NSString *type = @"";
    
    switch (contentType) {
        case RequestHeaderContentTypeApplicationJson:
            type = @"application/json";
            break;
            
        case RequestHeaderContentTypeMultipartFormData:
            type = @"multipart/form-data";
            break;
            
        case RequestHeaderContentTypeTextJavascript:
            type = @"text/javascript";
            break;
            
        case RequestHeaderContentTypeTextPlain:
            type = @"text/plain";
            break;
            
        case RequestHeaderContentTypeTextHtml:
            type = @"text/html";
            break;
            
        case RequestHeaderContentTypeTextJson:
            type = @"text/json";
            break;
    }
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObject:type];
    
    if (isToken) {
        [manager.requestSerializer setValue:[PBUserInfo shareManager].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
    manager.requestSerializer.timeoutInterval = 15.0f;
    
    NSURLSessionDataTask *task =  [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"接口%@请求成功，数据-----%@",task.response.URL.absoluteString,responseObject);
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = type;
//        model.isSuccess = YES;
//
//        NSString * str = @"";
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
//            str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([params isKindOfClass:[NSArray class]]){
//            str = [params componentsJoinedByString:@"；"];
//        }else if ([params isKindOfClass:[NSString class]]){
//            str = params;
//        }
//
//        model.params = str;
//
//        NSString * resultStr = @"";
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//            resultStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([responseObject isKindOfClass:[NSArray class]]){
//            resultStr = [params componentsJoinedByString:@"；"];
//            resultStr = [resultStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        }else if ([responseObject isKindOfClass:[NSString class]]){
//            resultStr = [responseObject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];;
//        }
//        model.result = resultStr;
//
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:responseObject];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"接口%@请求失败，数据-----%@",task.response.URL.absoluteString,error);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpDismiss];
            return;
        }
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = type;
//        model.isSuccess = NO;
//        NSString * str = @"";
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
//            str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }else if ([params isKindOfClass:[NSArray class]]){
//            str = [params componentsJoinedByString:@"；"];
//        }else if ([params isKindOfClass:[NSString class]]){
//            str = params;
//        }
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
//        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
//        }else{
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
//        }
        
        failureBlock(task,failModel);
        
    }];
    return task;
}


/**
 上传图片
 
 @param urlStr 地址
 @param images 上传的图片
 @param isCompressionImg 图片是否需要压缩 YES压缩
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(NSURLSessionDataTask *)uploadImageWithUrlStr :(NSString *)urlStr images :(NSArray *)images isCompressionImg :(BOOL)isCompressionImg isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock{
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (isToken) {
//        [manager.requestSerializer setValue:[UserInformation shareUserInformation].token.length == 0 ? @"" : [UserInformation shareUserInformation].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
        [manager.requestSerializer setValue:[PBUserInfo shareManager].token.length == 0 ? @"" : [PBUserInfo shareManager].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"multipart/form-data",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 15.0f;
    
    NSURLSessionDataTask *task = [manager POST:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // 上传 多张图片
        for(NSInteger i = 0; i < images.count; i++) {
            // 压缩
            UIImage *image = [images objectAtIndex:i];
            NSData * imageData = UIImageJPEGRepresentation(image, 1.0);;
            if (isCompressionImg) {
                image = [CommonlyUsedMethod imageWithOriginalWithImage:image targetWidth:1280 targetHeight:1280];
                imageData = [CommonlyUsedMethod zipNSDataWithImage:image];
            }
            
            // 上传的参数名
            NSString *str = [DateHelper getDateFromStringWithDate:[NSDate new] formatStr:@"yyyyMMddHHmmss"];
            CFUUIDRef puuid = CFUUIDCreate( nil );
            CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
            NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
            
            NSString *fileName = [NSString stringWithFormat:@"%@-%@.jpg", str,result];
            [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
        }
        [formData appendPartWithFormData:[@"true" dataUsingEncoding:NSUTF8StringEncoding] name:@"flag"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        NSLog(@"%.2lf%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功
        NSLog(@"接口%@请求成功，数据-----%@",task.response.URL.absoluteString,responseObject);
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:responseObject];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"接口%@请求失败，数据-----%@",task.response.URL.absoluteString,error);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"登录信息已失效或账号在其他设备上登录！"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpDismiss];
            return;
        }
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = @"";
//        model.isSuccess = NO;
//        NSString * str = @"无法展示参数，上传的图片";
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
//        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
//        }else{
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
//        }
        
        failureBlock(task,failModel);
        
    }];
    return task;
}

/**
 上传视频
 
 @param urlStr 地址
 @param data 上传的视频文件
 @param isCompressionImg 视频是否需要压缩 YES压缩
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(NSURLSessionDataTask *)uploadVideoWithUrlStr :(NSString *)urlStr data:(NSData *)data isCompressionImg :(BOOL)isCompressionImg isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock{
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (isToken) {
//        [manager.requestSerializer setValue:[UserInformation shareUserInformation].token.length == 0 ? @"" : [UserInformation shareUserInformation].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
        [manager.requestSerializer setValue:[PBUserInfo shareManager].token.length == 0 ? @"" : [PBUserInfo shareManager].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"multipart/form-data",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 15.0f;
    
    NSURLSessionDataTask *task = [manager POST:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (data.length > 0) {
            NSString *str = [DateHelper getDateFromStringWithDate:[NSDate new] formatStr:@"yyyyMMddHHmmss"];
            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"%@.mp4",str] mimeType:@"video/mp4"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        NSLog(@"%.2lf%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功
        NSLog(@"接口%@请求成功，数据-----%@",task.response.URL.absoluteString,responseObject);
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        if ([NSString stringWithFormat:@"%@",responseObject[@"url"]].length > 0) {
            [dict setObject:@(0) forKey:@"code"];
            [dict setObject:[responseObject copy] forKey:@"body"];
        }
        
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:dict];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"接口%@请求失败，数据-----%@",task.response.URL.absoluteString,error);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"登录信息已失效或账号在其他设备上登录！"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpDismiss];
            return;
        }
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = @"";
//        model.isSuccess = NO;
//        NSString * str = @"无法展示参数，上传的图片";
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
//        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
//        }else{
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
//        }
        
        failureBlock(task,failModel);
        
    }];
    return task;
}

/**
 上传文件
 
 @param urlStr 地址
 @param data 上传的视频文件
 @param isCompressionImg 视频是否需要压缩 YES压缩
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(NSURLSessionDataTask *)uploadFileWithUrlStr :(NSString *)urlStr data:(NSData *)data fileName:(NSString *)fileName isCompressionImg :(BOOL)isCompressionImg isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock{
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (isToken) {
//        [manager.requestSerializer setValue:[UserInformation shareUserInformation].token.length == 0 ? @"" : [UserInformation shareUserInformation].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
        [manager.requestSerializer setValue:[PBUserInfo shareManager].token.length == 0 ? @"" : [PBUserInfo shareManager].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"multipart/form-data",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 15.0f;
    
    NSURLSessionDataTask *task = [manager POST:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (data.length > 0) {
            NSArray *fileNameAndType = [fileName componentsSeparatedByString:@"."];
            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"%@",fileNameAndType.firstObject] mimeType:fileNameAndType.lastObject];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        NSLog(@"%.2lf%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功
        NSLog(@"接口%@请求成功，数据-----%@",task.response.URL.absoluteString,responseObject);
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        if ([NSString stringWithFormat:@"%@",responseObject[@"url"]].length > 0) {
            [dict setObject:@(0) forKey:@"code"];
            [dict setObject:[responseObject copy] forKey:@"body"];
        }
        
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:dict];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"接口%@请求失败，数据-----%@",task.response.URL.absoluteString,error);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"登录信息已失效或账号在其他设备上登录！"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpDismiss];
            return;
        }
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = @"";
//        model.isSuccess = NO;
//        NSString * str = @"无法展示参数，上传的图片";
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
//        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
//        }else{
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
//        }
        
        failureBlock(task,failModel);
        
    }];
    return task;
}

/**
 上传语音
 
 @param urlStr 地址
 @param audio 上传的语音
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(void)uploadAudioWithUrlStr :(NSString *)urlStr audio :(NSData *)audio isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock{
    
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (isToken) {
//        [manager.requestSerializer setValue:[UserInformation shareUserInformation].token.length == 0 ? @"" : [UserInformation shareUserInformation].token forHTTPHeaderField:@"X-AUTH-TOKEN"];
    }
    
    // 请求超时时间
    manager.requestSerializer.timeoutInterval = 20.0f;
    
    [manager POST:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // 上传的参数名
        NSString *str = [DateHelper getDateFromStringWithDate:[NSDate new] formatStr:@"yyyyMMddHHmmss"];
        NSString *fileName = [NSString stringWithFormat:@"%@.mp3", str];
        [formData appendPartWithFileData:audio name:@"file" fileName:fileName mimeType:@"audio/mp3"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        NSLog(@"%.2lf%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功
        NSLog(@"接口%@请求成功，数据-----%@",task.response.URL.absoluteString,responseObject);
        BaseRequestSuccessModel *successModel = [BaseRequestSuccessModel yy_modelWithJSON:responseObject];
        if (successModel.code == kRequestResultCode__1009) {
            [ShowSVProgressHUD svpDismiss];
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"您的登录信息已经失效，去重新登录吧！"];
            return;
        }
        successBlock(task,successModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"接口%@请求失败，数据-----%@",task.response.URL.absoluteString,error);
        
        NSHTTPURLResponse *respone = error.userInfo[@"com.alamofire.serialization.response.error.response"];
        BaseRequestFailModel *failModel = [BaseRequestFailModel yy_modelWithDictionary:error.userInfo];
        failModel.respone = respone;
        failModel.code = error.code;
        
        if (failModel.respone.statusCode == kRequestResultCode_401) {
            // token失效，跳转登录
            [[BaseNetworkRequest shareNetworkRequest] goLogin];
            [ShowSVProgressHUD showInfoWithImageName:nil status:@"登录信息已失效或账号在其他设备上登录！"];
            return;
        }
        if (failModel.code == kRequestResultCode__999 || failModel.respone.statusCode == kRequestResultCode__999) {
            [ShowSVProgressHUD svpDismiss];
            return;
        }
        
        /* ********************开始************************* */
//        BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
//        model.url = task.response.URL.absoluteString;
//        model.isToken = isToken;
//        model.contentType = @"";
//        model.isSuccess = NO;
//        NSString * str = @"无法展示参数，上传的语音";
//        model.params = str;
//        model.result = [NSString stringWithFormat:@"错误码值: %ld\n错误原因：%@",failModel.respone ? failModel.respone.statusCode : failModel.code,failModel.respone ? failModel.respone.debugDescription : failModel.failDescription];
//        [RequestResultManager insertDataWithResultModel:model];
        /* ********************结束************************* */
        
//        if (failModel.respone.statusCode == kRequestResultCode__1001 || failModel.code == kRequestResultCode__1001) {
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"请求超时！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode__1009 || failModel.code == kRequestResultCode__1009){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"网络连接失败！"];
//        }else if (failModel.respone.statusCode == kRequestResultCode_403 || failModel.code == kRequestResultCode_403){
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"您暂无权限"];
//        }else{
//            [ShowSVProgressHUD showInteractiveErrorWithImageName:nil message:@"服务器开小差了"];
//        }
        failureBlock(task,failModel);
        
    }];
}


/**
 跳转登录
 */
-(void)goLogin{
    [PBUserInfo exitLogin];
    [self popToRoot];
    [LAUNCH_MANAGER showLaunch];
}

-(void)popToRoot{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if ([window.rootViewController isKindOfClass:[UITabBarController class]]) {
        [((UINavigationController *)((UITabBarController *)window.rootViewController).selectedViewController) popToRootViewControllerAnimated:NO];
        ((UITabBarController *)window.rootViewController).selectedIndex = 0;
    }
    
}

@end
