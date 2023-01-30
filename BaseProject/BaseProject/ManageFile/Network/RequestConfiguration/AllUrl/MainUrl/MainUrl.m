//
//  HomeUrl.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/2/21.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "MainUrl.h"

@implementation MainUrl

//查询当前登录者信息
//NSString *const getCurrentInfo = @"/rbac/user/app/getLoginUserInfo";

// 查询个人信息
//NSString *const kGetUserInfo = @"/rbac/user/userDetails";

// 查询个人信息详情
//NSString *const kGetUserInfoDetails = @"/rbac/user/userDetails";

// 增加修改签名接口
NSString *const kUpdateUserSignature = @"/rbac/user/updateUserSignature";

// 查询公告消息或推送消息列表
NSString *const kNoticeListPath = @"/me/zhzfpushinform/listByOther";

// 公告消息详情
NSString *const kNoticeDetailListPath = @"/me/zhzfpushinform/detalis";

// 上传图片
NSString *const kUploadHeadPicPath = @"/re/server/upload";

// 个人任务数量完成情况
NSString *const kPersonalWorkNumPath = @"/check/zhzfyearcheck/statYearCheckForApp";

// 获取用户未读数
NSString *const kUnReadNumPath = @"/me/zhzfpushinform/unRead";

// 消息提醒未读红点接口
NSString *const kUnReadMessageNumPath = @"/check/messageRemind/redPoint";

// 待审批数量
NSString *const kUnApproveCount = @"/check/checkapprove/unApproveCount";



#pragma mark--多杆项目接口
//查询当前登录者信息
NSString *const getLoginUserInfo = @"/rbac/user/app/getLoginUserInfo";
// 请求个人信息
NSString *const getCurrentInfo = @"/multi/inspectBaseInfo/app/getCurrentInfo";

@end
