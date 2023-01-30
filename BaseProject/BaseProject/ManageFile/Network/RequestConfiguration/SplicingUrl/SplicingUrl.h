//
//  SplicingUrl.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 服务器地址
 */
typedef NS_ENUM(NSInteger, ServerAddress){
    ServerAddressNormal = 0, /**< 通用接口地址 */
    ServerAddressImage /**< 图片地址 */
};


/**
 端口号
 */
typedef NS_ENUM(NSInteger, ServerPort) {
    ServerPortNormal = 0, /**< 无端口号 */
    
};


/**
 所属模块
 */
typedef NS_ENUM(NSInteger, ServerProject) {
    ServerProjectNone = 0, /**< 无，为空 */
};

@interface SplicingUrl : NSObject

UIKIT_EXTERN NSString * const DCBaseUrl;

+(NSString *)SplicingUrlWithServerAddress :(ServerAddress)serverAddress serverPort :(ServerPort)serverPort serverProject :(ServerProject)serverProject path :(NSString *)path;

@end
