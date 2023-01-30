//
//  LoginVC.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "LoginVC.h"
#import "PBFormInputView.h"
#import "PBFormView.h"
#import "LoginRequestManager.h"
#import "LaunchManager.h"
#import "NSString_MD5.h"
#import "SplicingUrl.h"

typedef enum :NSInteger{
    
    LoginTypePassword,  // 密码
    LoginTypeCode  // 验证码
    
} LoginType;

@interface LoginVC ()

@property (nonatomic, strong) PBFormInputView  *userInputView;  // userInput
@property (nonatomic, strong) PBFormInputView  *codeInputView;  // codeInput
//@property (nonatomic, strong) PBFormInputView  *smsInputView;   // smsInput
@property (nonatomic, strong) UIImageView   *logo;              // 登录页logo
@property (nonatomic, strong) UILabel       *titleLab;          // 登陆标题
@property (nonatomic, strong) UIButton      *loginBtn;          // 登录按钮
@property (nonatomic, strong) UIButton      *registerBtn;       // 注册按钮
@property (nonatomic, strong) UIButton      *forgetBtn;         // 忘记密码按钮
@property (nonatomic, strong) UIButton      *smsLoginBtn;       // 验证码登录按钮

@property (nonatomic, assign) LoginType loginType;

@property (nonatomic, assign) BOOL isRegistered; /**< 是否走注册 */

@end

@implementation LoginVC

static NSString * const loginTitle = @"多功能综合杆运营管理平台";

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self getCaptchaCode:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar setHidden:YES];
    
    [self buildUI];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerSuccessAction:) name:kRegisterSuccessNoticeName object:nil];
}


// 初始化控件
- (void)buildUI {
    
    @WeakObj(self);
    self.userInputView = PBFormInputView.input()
    .placeholder(@"请输入账号")
    .text(@"")
    .keyboardType(UIKeyboardTypeDefault)
    .font(kFZXIYSJW_14)
    .textColor(UIColor.blackColor)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftText(@"账 号")
    .lineColor(kLineColor)
    .valueChangedBlock(^(UITextField *sender){
        [selfWeak valueChanged];
    });
    
    self.codeInputView = PBFormInputView.input()
    .placeholder(@"请输入密码")
    .text(@"")
    .keyboardType(UIKeyboardTypeDefault)
    .font(kFZXIYSJW_14)
    .textColor(UIColor.blackColor)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftText(@"密 码")
    .secureTextEntry(YES)
    .lineColor(kLineColor)
    .valueChangedBlock(^(UITextField *sender){
        [selfWeak valueChanged];
    });
    
//    self.smsInputView = PBFormInputView.input()
//    .placeholder(@"请输入验证码")
//    .keyboardType(UIKeyboardTypeNumberPad)
//    .font(kFZXIYSJW_14)
//    .textColor(UIColor.blackColor)
//    .clearButtonMode(UITextFieldViewModeWhileEditing)
//    .leftText(@"验证码")
//    .secureTextEntry(NO)
//    .maxCount(6)
//    .lineColor(kLineColor)
//    .smsCodeHidden(NO)
////    .smsTitle(@"获取验证码", UIControlStateNormal)
//    .smsImage([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DCBaseUrl,@"/rbac/get/checkCode"]]]], UIControlStateNormal)
//    .smsTitleColor(kFF5065DE, UIControlStateNormal)
//    .smsTitleFont(kFZXIYSJW_14, UIControlStateNormal)
//    .valueChangedBlock(^(UITextField *sender){
//        [selfWeak valueChanged];
//    })
//    .eventBlock(^(UIButton *sender){
//        [self smsCodeBtnClick:sender];
//    });
//
//    PBFormView *formView =  PBFormView.form().margin(20)
//    .addInput(self.userInputView)
//    .addInput(self.codeInputView)
//    .addInput(self.smsInputView);
    
    PBFormView *formView =  PBFormView.form().margin(20)
        .addInput(self.userInputView)
        .addInput(self.codeInputView);
    
    // logo
    [self.view addSubview:self.logo];
    // 标题
    [self.view addSubview:self.titleLab];
    [self.view addSubview:formView];
    // 登录按钮
    [self.view addSubview:self.loginBtn];
    // 注册
//    [self.view addSubview:self.registerBtn];
    // 短信验证
//    [self.view addSubview:self.smsLoginBtn];
    // 忘记密码
//    [self.view addSubview:self.forgetBtn];
    
    // 布局
    [self.logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(Adaptation_6(65) + SAFEAREA_INSETS_BOTTOM);
        make.height.mas_equalTo(Adaptation_6(58));
        make.width.mas_equalTo(Adaptation_6(90));
        make.centerX.equalTo(self.view);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(Adaptation_6(200));
        make.centerX.equalTo(self.view);
    }];
    [formView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(Adaptation_6(300));
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo([formView maxHeight]);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(formView.mas_bottom).offset(Adaptation_6(68));
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.mas_equalTo(50);
    }];
    
//    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.loginBtn.mas_bottom).offset(Adaptation_6(30));
//        make.left.mas_equalTo(self.loginBtn.mas_left).mas_offset(10);
//    }];
    
//    [self.smsLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.loginBtn.mas_bottom).offset(Adaptation_6(30));
//        make.left.equalTo(self.loginBtn.mas_left).with.offset(10);
//    }];
//
//    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.loginBtn.mas_bottom).offset(Adaptation_6(30));
//        make.right.equalTo(self.loginBtn.mas_right).mas_offset(-10);
//    }];
    
}

// 输入改变
- (void)valueChanged {
    if (self.loginType == LoginTypePassword) {  // 密码登录
        
        if (/*[self checkPhone] && */self.codeInputView.textFieldText.length >= 6) {
            self.loginBtn.enabled = YES;
        }else {
            self.loginBtn.enabled = NO;
        }
        
    }else {     // 验证码
        
        if (/*[self checkPhone] && */self.codeInputView.textFieldText.length >= 6) {
            self.loginBtn.enabled = YES;
        }else {
            self.loginBtn.enabled = NO;
        }
    }
}

// 校验手机号
- (BOOL)checkPhone {
    NSString *phone = self.userInputView.textFieldText.trimmingWhitespace;
    
    if (![phone tt_isMobileNumber]) {
        return NO;
    }
    return YES;
}

#pragma mark - 按钮点击事件
// 登录按钮点击
- (void)loginBtnClick:(UIButton *)sender{
    [self loginRequest];
}
// 点击切换验证码
- (void)smsLoginClick:(UIButton *)sender{
    
}

// 获取验证码
- (void)smsCodeBtnClick:(UIButton *)sender {
    
//    if (![self checkPhone]) {
//        [ShowSVProgressHUD showInteractiveInfoWithImageName:nil status:@"您输入的手机号码不正确！"];
//        return;
//    }
    
    [self getCaptchaCode:sender];
//    [self checkIsRegistrationRequestWith:sender];
    
}

#pragma mark 数据请求
// 登录
- (void)loginRequest{
    
    // MD5加密
    // 加密规则：1.密码MD5加密 2.账号和加密后的密码在再进行加密
    NSString *pwd =  [NSString stringWithFormat:@"%@",self.codeInputView.textFieldText.trimmingWhitespace];
    NSString *pwdMD5 = [pwd md5String];
    NSString *user = self.userInputView.textFieldText.trimmingWhitespace;
    NSString *userAndPwd = [[[NSString stringWithFormat:@"%@%@",user,[pwdMD5 uppercaseString]]md5String] uppercaseString];
    
    
    NSDictionary *params = @{@"loginName":user,
                            @"pwd": userAndPwd,
                            @"checkCode":@"123",
                            @"os":@"3",
                            @"idEntity":@"3",
                            @"query": @"1"
                            };
    
    self.loginBtn.userInteractionEnabled = NO;
    
    NSURLSessionDataTask *dataTask = [LoginRequestManager LoginRequestWithParams:params success:^(NSURLSessionDataTask *task, BaseRequestSuccessModel *successModel) {
        
        if (successModel.code == kRequestResultCode_0) {
            
            // 请求成功
            PBUserInfo *userInfo = [PBUserInfo yy_modelWithJSON:successModel.body];
            userInfo.token = successModel.body[@"token"];
            BOOL result = [userInfo save];
            if (result) {
                [ShowSVProgressHUD showInteractiveSuccessWithImageName:nil message:@"登录成功"];
                [LAUNCH_MANAGER showLaunch];
            }else{
                [PBUserInfo exitLogin];
                [ShowSVProgressHUD showInteractiveInfoWithImageName:nil status:@"登录失败"];
            }
        }
        self.loginBtn.userInteractionEnabled = YES;
        
    } failure:^(NSURLSessionDataTask *task, BaseRequestFailModel *failModel) {
        self.loginBtn.userInteractionEnabled = YES;
    }];
    
    [self.allTask addObject:dataTask];
    
}

// 获取验证码
- (void)getCaptchaCode:(UIButton *)sender{
    
    [sender setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DCBaseUrl,@"/rbac/get/checkCode"]]]] forState:UIControlStateNormal];
//    [LoginRequestManager SendVerificationCodeRequestWithParams:nil success:^(NSURLSessionDataTask * _Nonnull task, BaseRequestSuccessModel * _Nonnull successModel) {
//        if (successModel.code == kRequestResultCode_0) {
//
//            [sender startTime:kVerificationCodeCountdown title:@"重新获取" waitTittle:@""];
//            if (self.isRegistered) {
//                [ShowSVProgressHUD showInteractiveInfoWithImageName:nil status:successModel.message.length == 0 ? @"用户不存在，请联系管理员" : successModel.message];
//            }else{
//                [self.codeInputView becomeFirstResponderTextField];
//            }
//        }
//    } failure:^(NSURLSessionDataTask * _Nonnull task, BaseRequestFailModel * _Nonnull failModel) {
//
//    }];
}

#pragma mark - 懒加载
- (UIImageView *)logo{
    if (!_logo) {
        _logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo5"]];
    }
    return _logo;
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = kPingFangSC_Semibold_27;
        _titleLab.text = loginTitle;
    }
    return _titleLab;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setBackgroundImage:[UIImage imageWithColor:kFF5065DE] forState:(UIControlStateNormal)];
        [_loginBtn setBackgroundImage:[UIImage imageWithColor:kFFDDDDDD] forState:(UIControlStateDisabled)];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = kFZCYSJW_16;
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.clipsToBounds = YES;
        _loginBtn.enabled = NO;
        [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}


- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:kThemeColor forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = kFZCYSJW_18;
        [_registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerBtn;
}

- (UIButton *)smsLoginBtn {
    if (!_smsLoginBtn) {
        _smsLoginBtn = [[UIButton alloc] init];
        [_smsLoginBtn setTitle:@"短信验证码登录" forState:UIControlStateNormal];
        [_smsLoginBtn setTitleColor:kFF666666 forState:UIControlStateNormal];
        _smsLoginBtn.titleLabel.font = kFZXIYSJW_16;
        [_smsLoginBtn addTarget:self action:@selector(smsLoginClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _smsLoginBtn;
}

- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:kFF666666 forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = kFZXIYSJW_16;
        [_forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _forgetBtn;
}



@end
