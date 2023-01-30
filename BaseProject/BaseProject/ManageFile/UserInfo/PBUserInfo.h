//
//  PBUserInfo.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/2/25.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBUserInfo : NSObject

/// 用户拥有的角色id
@property (nonatomic, copy) NSArray *roleIds;
/// 用户拥有的身份id
@property (nonatomic, copy) NSArray *identityIds;
@property (nonatomic, copy) NSArray *businessIdentityIds;
@property (nonatomic, copy) NSArray *menuCodeList;
/// 用户信息
@property (nonatomic, strong) PBUser *user;
@property (nonatomic, copy) NSArray *buttonCodeList;
/// 用户token
@property (nonatomic, copy) NSString *token;



/// 用户拥有的身份id
//@property (nonatomic, copy) NSArray *identitys;

/// 用户拥有的功能资源编码
//@property (nonatomic, copy) NSArray *moduleResource;

/// 用户拥有的角色id
//@property (nonatomic, copy) NSArray *roles;

/// 用户拥有的接口
//@property (nonatomic, copy) NSArray *apiResource;

/// 用户拥有的组织架构id
//@property (nonatomic, copy) NSArray *departments;


//@property (nonatomic, copy) NSArray *departmentIdList;

/// 组织架构id
//@property (nonatomic, copy) NSString *idRbacDepartment;

/// 用户信息
//@property (nonatomic, strong) PBUser *user;

/// 用户token
//@property (nonatomic, copy) NSString *token;

/// 用户是否进入团委，只记录第一次
//@property (nonatomic, assign) BOOL isEnterYouthCommittee;


//@property (nonatomic, assign) NSInteger simplePwd;

/**
 单例，获取当前实例
 
 @return 返回当前对象
 */
+ (instancetype)shareManager;


// 存储当前授权模型
- (BOOL)save;


// 获取模型
+ (PBUserInfo *)userInfoFromSandbox;


// 退出登陆
+ (void)exitLogin;



@end
