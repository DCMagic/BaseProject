//
//  HomeUrl.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/2/21.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainUrl : NSObject

// 查询个人信息
//FOUNDATION_EXPORT NSString *const kGetUserInfo;

// 查询个人信息详情
//FOUNDATION_EXPORT NSString *const kGetUserInfoDetails;

// 增加修改签名接口
FOUNDATION_EXPORT NSString *const kUpdateUserSignature;

// 通知公告
FOUNDATION_EXPORT NSString *const kNoticeListPath;

// 通知公告详情
FOUNDATION_EXPORT NSString *const kNoticeDetailListPath;

// 上传图片
FOUNDATION_EXPORT NSString *const kUploadHeadPicPath;

// 个人任务数量完成情况
FOUNDATION_EXPORT NSString *const kPersonalWorkNumPath;

// 获取用户未读数
FOUNDATION_EXPORT NSString *const kUnReadNumPath;

// 消息提醒未读红点接口
FOUNDATION_EXPORT NSString *const kUnReadMessageNumPath;

// 待审批数量
FOUNDATION_EXPORT NSString *const kUnApproveCount;


#pragma mark--多杆项目接口
//查询当前登录者信息
FOUNDATION_EXPORT NSString *const getLoginUserInfo;
// 请求个人信息
FOUNDATION_EXPORT NSString *const getCurrentInfo;

@end
