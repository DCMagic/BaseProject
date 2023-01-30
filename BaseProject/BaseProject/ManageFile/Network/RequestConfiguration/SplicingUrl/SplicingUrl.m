//
//  SplicingUrl.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "SplicingUrl.h"
//#import "ChangeServerEnvironmentVCModel.h"

@interface SplicingUrl()

@end

NSString * const DCBaseUrl = @"https://poletest.shujijian.com:88";  //  多杆测试
//NSString * const DCBaseUrl = @"https://www.digitalpole.shujijian.com"; // 多杆生产

@implementation SplicingUrl

+(NSString *)SplicingUrlWithServerAddress :(ServerAddress)serverAddress serverPort :(ServerPort)serverPort serverProject :(ServerProject)serverProject path :(NSString *)path {
    
    if (path.length == 0) {
        return @"";
    }
    
    if ([path hasPrefix:@"http://"] || [path hasPrefix:@"https://"]) {
        return path;
    }
    
    NSMutableString *returnPath = [NSMutableString string];
    // 请求方式
    [returnPath appendString:@"https://"];
//    [returnPath appendString:@"http://"];
    
//    测试环境
    [returnPath appendString:@"poletest.shujijian.com:88"];   // 测试
//    [returnPath appendString:@"www.digitalpole.shujijian.com"];
    
    // 端口号
//    if (currentModel.isProt) {
//        if (serverPort == ServerPortNormal) {
//            [returnPath appendString:@":10008"];
//        }
//    }
    
    // 所属模块
//    if (serverProject == ServerProjectNone) {
//
//    }
    
    [returnPath appendString:path];
    
    //由于部分图片含有汉字，所有需进行一次转码
    returnPath = [[returnPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    
    return returnPath;
}

@end
