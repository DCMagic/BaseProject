//
//  PBUser.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/18.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBUser : NSObject

@property (nonatomic, copy) NSString *outpostName;
@property (nonatomic, copy) NSString *idRbacDepartment;
/// 用户描述
@property (nonatomic, copy) NSString *notes;
/// 用户昵称
@property (nonatomic, copy) NSString *nickName;
/// 用户注册时间
@property (nonatomic, copy) NSString *gmtCreate;
/// 用户头像
@property (nonatomic, copy) NSString *headPic;
@property (nonatomic, copy) NSString *outpostId;
@property (nonatomic, copy) NSString *idRbacCompany;
/// 用户手机号
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, assign) NSInteger isInitialPwd;
/// 用户登录名
@property (nonatomic, copy) NSString *loginName;
/// 用户名称
@property (nonatomic, copy) NSString *name;
/// 公司名称
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, assign)NSInteger userType;
@property (nonatomic, copy) NSString *department;
/// 用户邮箱
@property (nonatomic, copy) NSString *email;


///// 用户名称
//@property (nonatomic, copy) NSString *name;
//
///// 用户id
//@property (nonatomic, copy) NSString *userID;
//
///// 用户手机号
//@property (nonatomic, copy) NSString *phone;
//
///// 用户昵称
//@property (nonatomic, copy) NSString *nickName;
//
///// 用户登录名
//@property (nonatomic, copy) NSString *loginName;
//
///// 用户头像
//@property (nonatomic, copy) NSString *headPic;
//
///// 用户描述
//@property (nonatomic, copy) NSString *notes;
//
///// 用户注册时间
//@property (nonatomic, copy) NSString *gmtCreate;
//
///// 用户工号
//@property (nonatomic, copy) NSString *jobNumber;
//
///// 用户邮箱
//@property (nonatomic, copy) NSString *email;
//
///// 公司名称
//@property (nonatomic, copy) NSString *company;
//
///// 公司id
//@property (nonatomic, copy) NSString *companyId;
//
//
//@property (nonatomic, assign) NSInteger idParentDepartment;
//
///// 部门
//@property (nonatomic, copy) NSString *section;
//
///// 党支部
//@property (nonatomic, copy) NSString *partyBranch;
//
///// 党支部id
//@property (nonatomic, assign) NSInteger partyBranchId;
//
///// 党委名称 可能为空
//@property (nonatomic, copy) NSString *partyCommitteeName;
//
///// 党委ID 可能为空
//@property (nonatomic, assign) NSInteger partyCommitteeId;
//
///// 所属团委或团支部名称 可能为空
//@property (nonatomic, copy) NSString *youthGroup;
//
///// 所属团委或团支部 可能为空
//@property (nonatomic, assign) NSInteger idRbacYouthGroup;
//
///// 职称
//@property (nonatomic, copy) NSString *titleName;
//
///// 是否领导 0 否 1 是
//@property (nonatomic, assign) NSInteger isLeader;
//
///// 性别 1：男 2：女
//@property (nonatomic, copy) NSString *sex;
//
///// 用户业务身份 1:入党申请人 2:普通党员 3:党务工作者 4:党组织负责人 5:共青团员 6:民主党派 7:群众
//@property (nonatomic, copy) NSString *identity;
//
///// 入党时间
//@property (nonatomic, copy) NSString *gmtJoinPartyTime;
//
///// 出生日期
//@property (nonatomic, copy) NSString *gmtBirthtime;
//
///// 学分
//@property (nonatomic, copy) NSString *learningFraction;
//
///// 支部排名
//@property (nonatomic, copy) NSString *partyBranchRanking;
//
///// 积分
//@property (nonatomic, copy) NSString *integral;
//
///// 勋章数
//@property (nonatomic, copy) NSString *medalNum;
//
//@property (nonatomic, assign) NSInteger isAllowedSpeaking; /**< 是否禁言 1 是,0 否 */


//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *loginName;
//@property (nonatomic, copy) NSString *nickName;
//@property (nonatomic, copy) NSString *companyName;
//@property (nonatomic, copy) NSString *phone;
//@property (nonatomic, copy) NSString *lastLoginIp;
//@property (nonatomic, copy) NSString *jobNumber;
//@property (nonatomic, copy) NSString *isEnableStatus;
//@property (nonatomic, copy) NSString *position;
//@property (nonatomic, copy) NSString *notes;
//@property (nonatomic, copy) NSString *department;
//@property (nonatomic, copy) NSString *email;
//@property (nonatomic, copy) NSString *companyUserTypeTitle;
//@property (nonatomic, copy) NSString *gmtCreate;
//@property (nonatomic, copy) NSString *gmtModified;
//@property (nonatomic, copy) NSString *attestationPwd;
//@property (nonatomic, copy) NSString *userID;
//@property (nonatomic, assign)NSInteger isAdmin;
//@property (nonatomic, assign)NSInteger isDeleted;
//@property (nonatomic, assign)NSInteger isEnable;
//@property (nonatomic, assign)NSInteger lastLoginPlatform;
//@property (nonatomic, assign)NSInteger companyUserType;
//@property (nonatomic, assign)NSInteger userType;
//@property (nonatomic, copy) NSString * headPic;
//@property (nonatomic, copy) NSArray * identityNames;
//@property (nonatomic, copy) NSArray * roleList;
//@property (nonatomic, copy)NSString *departmentNameStr;
//@property (nonatomic, copy)NSString *identityNameStr;


//{
//    codeRbacDepartment = "";
//    department = "";
//    email = "";
//    gmtCreate = "2021-12-13 15:35:44";
//    headPic = "";
//    id = 321;
//    idRbacDepartment = "<null>";
//    jobNumber = 15386614707;
//    loginName = Dongchao;
//    name = "\U8463\U8d85";
//    nameRbacDepartment = "";
//    nickName = "";
//    notes = "";
//    phone = 15386614707;
//    position = "";
//    signature = "<null>";
//    userType = 10;
//}

// 更新数据
- (void)update:(PBUser *)user;

// 获取业务身份
- (NSString *)getIdentityName;

@end


NS_ASSUME_NONNULL_END
