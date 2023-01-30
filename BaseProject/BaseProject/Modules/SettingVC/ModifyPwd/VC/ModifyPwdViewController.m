//
//  ModifyPwdViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import "ModifyPwdViewController.h"
#import "PBFormView.h"
#import "PBFormInputView.h"
#import "LoginRequestManager.h"
#import "LaunchManager.h"
//#import "PBResultVC.h"

@interface ModifyPwdViewController ()

@property (nonatomic, strong) PBFormInputView  *opwdInputView;  // 原密码
@property (nonatomic, strong) PBFormInputView  *npwdInputView;  // 新密码
@property (nonatomic, strong) PBFormInputView  *apwdInputView;  // 确认密码
@property (nonatomic, strong) UILabel  *titleLab;
@property (nonatomic, strong) UIButton *saveBtn;          // 下一步按钮

@end

@implementation ModifyPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.title = @"修改密码";
    [self.customNavBar tt_setTintColor:[UIColor blackColor]];
    [self.customNavBar setBarBackgroundColor:[UIColor whiteColor]];
    
    [self buildUI];
    [self.opwdInputView becomeFirstResponderTextField];
}

- (void)buildUI{
    
    @WeakObj(self);
    self.opwdInputView = PBFormInputView.input()
    .placeholder(@"请输入原密码")
    .keyboardType(UIKeyboardTypeDefault)
    .font(kFZXIYSJW_15)
    .maxCount(16)
    .textColor(UIColor.blackColor)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftText(@"原密码")
    .lineColor(kLineColor)
    .secureTextEntry(NO)
    .lineEdgeInsets(UIEdgeInsetsMake(10, 20, 0, 0))
    .valueChangedBlock(^(UITextField *sender){
        [selfWeak valueChanged];
    });
    
    self.npwdInputView = PBFormInputView.input()
    .placeholder(@"请输入6-16数字加字母组成的密码")
    .keyboardType(UIKeyboardTypeDefault)
    .font(kFZXIYSJW_15)
    .maxCount(16)
    .textColor(UIColor.blackColor)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftText(@"新密码")
    .lineEdgeInsets(UIEdgeInsetsMake(10, 20, 0, 0))
    .secureTextEntry(NO)
    .lineColor(kLineColor)
    .valueChangedBlock(^(UITextField *sender){
        [selfWeak valueChanged];
    });
    
    self.apwdInputView = PBFormInputView.input()
    .placeholder(@"确认新密码")
    .keyboardType(UIKeyboardTypeDefault)
    .font(kFZXIYSJW_15)
    .maxCount(16)
    .textColor(UIColor.blackColor)
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .leftText(@"确认密码")
    .lineEdgeInsets(UIEdgeInsetsMake(10, 20, 0, 0))
    .secureTextEntry(NO)
    .lineColor(kLineColor)
    .valueChangedBlock(^(UITextField *sender){
        [selfWeak valueChanged];
    });
    
    PBFormView *formView =  PBFormView.form().margin(20)
    .addInput(self.opwdInputView)
    .addInput(self.npwdInputView)
    .addInput(self.apwdInputView);
    
    [self.view addSubview:formView];
    
    // 下一步按钮
    [self.view addSubview:self.saveBtn];
    
    [self.view addSubview:self.titleLab];
    
    // 布局
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.customNavBar.mas_bottom).offset(Adaptation_6(40));
        make.centerX.equalTo(self.view);
    }];
    
    [formView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(Adaptation_6(207));
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo([formView maxHeight]);
    }];
    
    
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(formView.mas_bottom).with.offset(Adaptation_6(55));
        make.left.equalTo(self.view.mas_left).with.offset(12);
        make.right.equalTo(self.view.mas_right).with.offset(-12);
        make.height.mas_equalTo(49);
    }];
}

- (void)requestData{
    PBUserInfo *user = [PBUserInfo userInfoFromSandbox];
    NSString *oldPwd = [self.opwdInputView.textFieldText.trimmingWhitespace md5String];
    NSString *oldPwdMD5 = [[NSString stringWithFormat:@"%@%@",user.user.loginName,oldPwd] md5String];
    NSString *newPwd = [self.npwdInputView.textFieldText.trimmingWhitespace md5String];
    NSString *newPwdMD5 = [[NSString stringWithFormat:@"%@%@",user.user.loginName,newPwd] md5String];
    
    NSDictionary *dic = @{
        @"oldPwd": self.opwdInputView.textFieldText.trimmingWhitespace,
        @"pwd": self.npwdInputView.textFieldText.trimmingWhitespace,
//        @"id": user.user.userID
    };
    
    [LoginRequestManager ModifyPwdRequestWithParams:dic success:^(NSURLSessionDataTask * _Nonnull task, BaseRequestSuccessModel * _Nonnull successModel) {
        if (successModel.code == kRequestResultCode_0) {
            [SVProgressHUD showSuccessWithStatus:@"修改成功"];
            [[LaunchManager sharedInstance] loginOut];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, BaseRequestFailModel * _Nonnull failModel) {
        
    }];
}

// 输入改变
- (void)valueChanged {
    self.saveBtn.enabled = YES;
//    if ([self.opwdInputView.textFieldText tt_isPassword] && [self.npwdInputView.textFieldText tt_isPassword] && [self.apwdInputView.textFieldText tt_isPassword]) {
//        self.saveBtn.enabled = YES;
//    }else {
//        self.saveBtn.enabled = NO;
//    }
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = createLabel(kPingFangSC_Regular_24, UIColor.blackColor);
        _titleLab.text = @"登录密码修改";
    }
    return _titleLab;
}

- (UIButton *)saveBtn{
    if (!_saveBtn) {
        _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveBtn.layer.cornerRadius = Adaptation_6(4);
        [_saveBtn setBackgroundColor:kFF5065DE];
        [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [_saveBtn addTarget:self action:@selector(requestData) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveBtn;
}

@end
