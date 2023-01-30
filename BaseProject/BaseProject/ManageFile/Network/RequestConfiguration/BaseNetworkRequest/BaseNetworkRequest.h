//
//  BaseNetworkRequest.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/7.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 请求头格式
 */
typedef NS_ENUM(NSInteger, RequestHeaderContentType) {
    RequestHeaderContentTypeApplicationJson = 0, /**< application/json;charset=UTF-8 */
    RequestHeaderContentTypeMultipartFormData, /**< multipart/form-data */
    RequestHeaderContentTypeTextPlain, /**< text/plain */
    RequestHeaderContentTypeTextJson, /**< text/json */
    RequestHeaderContentTypeTextJavascript, /**< text/javascript */
    RequestHeaderContentTypeTextHtml /**< text/html */
    
};

typedef void(^Success)(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel);
typedef void(^Failure)(NSURLSessionDataTask *task, BaseRequestFailModel *failModel);

@interface BaseNetworkRequest : NSObject

+(BaseNetworkRequest *)shareNetworkRequest;


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
-(NSURLSessionDataTask *)postRequestWithUrl:(NSString *)url params:(id)params isJSONRequest :(BOOL)isJSONRequest isJSONResponse :(BOOL)isJSONResponse contentType :(RequestHeaderContentType)contentType isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;


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
-(NSURLSessionDataTask *)getRequestWithUrl:(NSString *)url params:(id)params isJSONResponse :(BOOL)isJSONResponse contentType :(RequestHeaderContentType)contentType isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;


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
-(NSURLSessionDataTask *)putRequestWithUrl:(NSString *)url params:(id)params isJSONRequest :(BOOL)isJSONRequest isJSONResponse :(BOOL)isJSONResponse contentType :(RequestHeaderContentType)contentType isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;



/**
 上传图片
 
 @param urlStr 地址
 @param images 上传的图片
 @param isCompressionImg 图片是否需要压缩 YES压缩
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(NSURLSessionDataTask *)uploadImageWithUrlStr :(NSString *)urlStr images :(NSArray *)images isCompressionImg :(BOOL)isCompressionImg isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;

/**
 上传视频
 
 @param urlStr 地址
 @param data 上传的视频文件
 @param isCompressionImg 视频是否需要压缩 YES压缩
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(NSURLSessionDataTask *)uploadVideoWithUrlStr :(NSString *)urlStr data:(NSData *)data isCompressionImg :(BOOL)isCompressionImg isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;

-(NSURLSessionDataTask *)uploadFileWithUrlStr :(NSString *)urlStr data:(NSData *)data fileName:(NSString *)fileName isCompressionImg :(BOOL)isCompressionImg isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;

/**
 上传语音
 
 @param urlStr 地址
 @param audio 上传的语音
 @param isToken 是否需要token
 @param successBlock 成功
 @param failureBlock 失败
 */
-(void)uploadAudioWithUrlStr :(NSString *)urlStr audio :(NSData *)audio isToken :(BOOL)isToken success:(Success)successBlock failure:(Failure)failureBlock;

/**
 跳转登录
 */
-(void)goLogin;

@end
