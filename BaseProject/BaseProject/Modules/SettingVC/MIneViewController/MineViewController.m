//
//  MineViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/11/17.
//

#import "MineViewController.h"
#import "LaunchManager.h"
#import "MainPageRequestManager.h"
#import "UserInspectTeamModel.h"

@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIScrollView *inspectTeamScrollView;


@property (nonatomic, copy) UserInspectTeamModel *userInspectTeam;
@property (nonatomic, strong)PBUser *userModel;

@end

@implementation MineViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getUserInfoDetails];
    [self requestDepartmentInfo];
}

-(void)initInspectTeamView:(UserInspectTeamListModel *)model withIndex:(NSInteger)index  {
    
    NSLog(@"%ld",16*index+130*(index+1));
    CGFloat scrollViewContentSizeHeight = 16*index+130*(index+1);
    self.inspectTeamScrollView.contentSize = CGSizeMake(self.inspectTeamScrollView.frame.size.width, scrollViewContentSizeHeight);
    
    CGFloat backViewHeight = 94+scrollViewContentSizeHeight+16;
    NSLog(@"%f", backViewHeight);
    [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(backViewHeight);
    }];
    
    if (backViewHeight > (PhoneScreen_HEIGHT-274-SAFEAREA_INSETS_BOTTOM)) {
        [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo((PhoneScreen_HEIGHT-274-SAFEAREA_INSETS_BOTTOM));
        }];
    }
    
    UIView *inspectTeamView = [[UIView alloc]init];
    inspectTeamView.backgroundColor = kFFF7F8FA;
    inspectTeamView.layer.cornerRadius = 8;
    [self.inspectTeamScrollView addSubview:inspectTeamView];
    inspectTeamView.frame = CGRectMake(0, index*(130+16),self.inspectTeamScrollView.frame.size.width, 130);
    
    UILabel * inspectionGroupTitle = [[UILabel alloc]init];
    inspectionGroupTitle.font = kPingFangSC_Regular_14;
    inspectionGroupTitle.textColor = kFF4E5969;
    inspectionGroupTitle.textAlignment = NSTextAlignmentLeft;
    inspectionGroupTitle.text = @"巡检组：";
    [inspectTeamView addSubview:inspectionGroupTitle];
    [inspectionGroupTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inspectTeamView).offset(Adaptation_6(16));
        make.left.equalTo(inspectTeamView).offset(Adaptation_6(16));
        make.height.mas_equalTo(Adaptation_6(17));
        make.width.mas_equalTo(Adaptation_6(85));
    }];

    UILabel * inspectionGroupContent = [[UILabel alloc]init];
    inspectionGroupContent.font = kPingFangSC_Regular_14;
    inspectionGroupContent.textColor = kFF4E5969;
    inspectionGroupContent.textAlignment = NSTextAlignmentRight;
    inspectionGroupContent.text = model.inspectTeamName;
    [inspectTeamView addSubview:inspectionGroupContent];
    [inspectionGroupContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inspectTeamView).offset(Adaptation_6(16));
        make.right.equalTo(inspectTeamView).offset(Adaptation_6(-16));
        make.height.mas_equalTo(Adaptation_6(17));
        make.left.mas_equalTo(inspectionGroupTitle.mas_right);
    }];

    UILabel * leaderNameTitle = [[UILabel alloc]init];
    leaderNameTitle.font = kPingFangSC_Regular_14;
    leaderNameTitle.textColor = kFF4E5969;
    leaderNameTitle.textAlignment = NSTextAlignmentLeft;
    leaderNameTitle.text = @"巡检组负责人：";
    [inspectTeamView addSubview:leaderNameTitle];
    [leaderNameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(inspectionGroupTitle.mas_bottom).offset(Adaptation_6(16));
        make.left.equalTo(inspectTeamView).offset(Adaptation_6(16));
        make.height.mas_equalTo(Adaptation_6(17));
        make.width.mas_equalTo(Adaptation_6(100));
    }];

    UILabel * leaderNameContent = [[UILabel alloc]init];
    leaderNameContent.font = kPingFangSC_Regular_14;
    leaderNameContent.textColor = kFF4E5969;
    leaderNameContent.textAlignment = NSTextAlignmentRight;
    leaderNameContent.text = model.leaderUserName;
    [inspectTeamView addSubview:leaderNameContent];
    [leaderNameContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(inspectionGroupTitle.mas_bottom).offset(Adaptation_6(16));
        make.right.equalTo(inspectTeamView).offset(Adaptation_6(-16));
        make.height.mas_equalTo(Adaptation_6(17));
        make.left.mas_equalTo(leaderNameTitle.mas_right);
    }];

    UILabel * leaderPhoneTitle = [[UILabel alloc]init];
    leaderPhoneTitle.font = kPingFangSC_Regular_14;
    leaderPhoneTitle.textColor = kFF4E5969;
    leaderPhoneTitle.textAlignment = NSTextAlignmentLeft;
    leaderPhoneTitle.text = @"负责人电话：";
    [inspectTeamView addSubview:leaderPhoneTitle];
    [leaderPhoneTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(leaderNameTitle.mas_bottom).offset(Adaptation_6(16));
        make.left.equalTo(inspectTeamView).offset(Adaptation_6(16));
        make.height.mas_equalTo(Adaptation_6(17));
    }];

    UIButton * leaderPhoneContent = [UIButton buttonWithType:UIButtonTypeCustom];
    leaderPhoneContent.tag = index;
    [leaderPhoneContent setTitleColor:kFF4E5969 forState:UIControlStateNormal];
    leaderPhoneContent.titleLabel.font = kPingFangSC_Regular_14;
    [leaderPhoneContent setImage:[UIImage imageNamed:@"list_phone"] forState:UIControlStateNormal];
    [leaderPhoneContent setTitle:model.leaderUserPhone forState:UIControlStateNormal];
    [inspectTeamView addSubview:leaderPhoneContent];
    [leaderPhoneContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(leaderNameTitle.mas_bottom).offset(Adaptation_6(16));
        make.right.equalTo(inspectTeamView).offset(Adaptation_6(-16));
        make.height.mas_equalTo(Adaptation_6(17));
        make.width.mas_equalTo(110);
    }];
    
    [leaderPhoneContent addTarget:self action:@selector(leaderPhoneBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar tt_setBackgroundAlpha:0];
    [self.view setBackgroundColor:kFFF7F8FA];
}

#pragma mark - 获取用户数据接口
- (void)getUserInfoDetails{
    NSDictionary *params = @{@"loginName":[PBUserInfo userInfoFromSandbox].user.loginName,
                            @"os": @"3",
                             @"id": [PBUserInfo userInfoFromSandbox].user.userID
                            };
    [MainPageRequestManager getLoginUserInfoRequestWithParams:params success:^(NSURLSessionDataTask * _Nonnull task, BaseRequestSuccessModel * _Nonnull successModel) {
            if (successModel.code == kRequestResultCode_0) {
                // 请求成功
                PBUserInfo *userInfo = [PBUserInfo yy_modelWithJSON:successModel.body];
                userInfo.token = [PBUserInfo userInfoFromSandbox].token;
                [userInfo save];
                [self refreshUserInfo];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, BaseRequestFailModel * _Nonnull failModel) {
            
        }];
}

#pragma mark - 获取当前登录人巡检组信息
- (void)requestDepartmentInfo{
    NSDictionary *params = @{@"versionCode":[self getVersionString],
                            @"platformType": @"3",
                             @"requestNo": [self getRequestNo]
                            };
    [MainPageRequestManager getCurrentInfoRequestWithParams:params success:^(NSURLSessionDataTask * _Nonnull task, BaseRequestSuccessModel * _Nonnull successModel) {
            if (successModel.code == kRequestResultCode_0) {
                // 请求成功
                self.userInspectTeam = [UserInspectTeamModel yy_modelWithJSON:successModel.body];
                [self refreshUserInfo];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, BaseRequestFailModel * _Nonnull failModel) {
            
        }];
}

- (void)refreshUserInfo{
    self.userModel = [PBUserInfo userInfoFromSandbox].user;
    if (self.userModel.userID && [PBUserInfo userInfoFromSandbox].token) {
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:self.userModel.headPic] placeholderImage:[UIImage imageNamed:@"header_bitmap"]];
        self.nameLab.text = self.userModel.name;
        self.phoneLab.text = self.userModel.phone;
        if (_userInspectTeam && _userInspectTeam.teamList.count > 0) {
            for (int i = 0; i<_userInspectTeam.teamList.count; i++) {
                UserInspectTeamListModel *model = _userInspectTeam.teamList[i];
                [self initInspectTeamView:model withIndex:i];
            }
        }
    }
}



- (void)leaderPhoneBtnAction:(id)sender {
    if ([sender isKindOfClass:UIButton.class]) {
        NSInteger index = ((UIButton *)sender).tag;
        if (_userInspectTeam.teamList.count > index) {
            NSString *phoneNum = _userInspectTeam.teamList[index].leaderUserPhone;
            NSURL *phoneNumUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]];
            if (phoneNum.length > 0 && [[UIApplication sharedApplication] canOpenURL:phoneNumUrl]) {
                if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
                    //设备系统为IOS 10.0或者以上的
                    [[UIApplication sharedApplication] openURL:phoneNumUrl options:@{} completionHandler:nil];
                }else{
                    //设备系统为IOS 10.0以下的
                    [[UIApplication sharedApplication] openURL:phoneNumUrl];
                }
            }
        }
    }
}

- (IBAction)logoutBtnClicked:(id)sender {
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"退出登录" message:@"您确定要退出登录？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 退出登录
        [PBUserInfo exitLogin];
        [self popToRoot];
        [LAUNCH_MANAGER showLaunch];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alter addAction:sureAction];
    [alter addAction:cancelAction];
    [self presentViewController:alter animated:YES completion:nil];
}

-(void)popToRoot{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if ([window.rootViewController isKindOfClass:[UITabBarController class]]) {
        [((UINavigationController *)((UITabBarController *)window.rootViewController).selectedViewController) popToRootViewControllerAnimated:NO];
        ((UITabBarController *)window.rootViewController).selectedIndex = 0;
    }
    
}

@end
