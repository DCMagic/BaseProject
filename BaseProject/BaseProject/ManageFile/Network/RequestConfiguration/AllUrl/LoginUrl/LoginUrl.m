//
//  LoginUrl.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "LoginUrl.h"

// 请求个人信息
//NSString *const kUserinfoPath = @"/rbac/api/user/userinfo";

// 获取验证码
NSString *const kSendVerificationCodePath = @"/rbac/get/checkCode";

// 登录密码修改
NSString *const kModifyPwdPath = @"/rbac/user/updateUserPwd";

// 用户工作单位详情
NSString *const kUserWrkInfoPath = @"/rbac/department/getTwoNodeDepartment";

// ==============================================================================


// 用户注册
NSString *const kUserRegisterPath = @"/rbac/api/userRegister";

// 用户第一次登录修改密码
NSString *const kFirstLoginPath = @"/rbac/api/user/setNewPwd";



NSString *const kUserLogoutPath = @"/rbac/sys/logout";

// 发送验证码
//NSString *const kSendVerificationCodePath = @"/rbac/api/sendVerificationCode";

// 校验验证码
//NSString *const kCheckVerificationCodePath = @"/rbac/api/checkVerificationCode";

// 忘记密码
NSString *const kForgetPwdPath = @"/rbac/api/user/forgetPwd";

// 完善个人信息
NSString *const kUpdateUserPath = @"/rbac/api/user/updateUser";

// 获取公司列表
NSString *const kGetCompanyListPath = @"/rbac/api/user/getCompanyList";

// 获取支部列表
NSString *const kGetPartyBranchListPath = @"/rbac/api/user/getPartyBranchList";

// 校验手机号是否已注册
NSString *const kCheckIsRegistrationPath = @"/rbac/api/user/checkIsRegistration";

// 服务协议
NSString *const kServiceAgreementPath = @"/h5/view/serviceAgreement.html";



//2.0校验验证码
NSString *const kCheckVerificationCodePath = @"/rbac/api/sms/checkVerificationCode";

// 缴纳党费2.0
NSString *const kPayFeesRequestPath = @"/rbac/membershipDues";


#pragma mark--多杆项目接口
// 用户登录
NSString *const kUserLoginPath = @"/rbac/sys/login";
