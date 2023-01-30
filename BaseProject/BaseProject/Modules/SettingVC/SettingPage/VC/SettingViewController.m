//
//  SettingViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/3/23.
//

#import "SettingViewController.h"
#import "ModifyPwdViewController.h"
#import "AboutVC.h"
#import "HeaderView.h"
#import "ShowView.h"
#import "ClickView.h"
#import "LaunchManager.h"
#import "MainPageRequestManager.h"

#import "UserInspectTeamModel.h"

@interface SettingViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong)HeaderView *headerView;
@property (nonatomic, strong)ShowView *nameView;
@property (nonatomic, strong)ShowView *phoneView;
@property (nonatomic, strong)ShowView *accountView;
@property (nonatomic, strong)ShowView *groupView;
@property (nonatomic, strong)ShowView *groupLeaderView;
@property (nonatomic, strong)ShowView *groupLeaderPhoneView;

@property (nonatomic, strong)ClickView *modifyView;
@property (nonatomic, strong)ClickView *aboutView;

@property (nonatomic, strong)PBUser *userModel;

@property (nonatomic, copy) ChooseImage chooseBlock;
@property (nonatomic, copy) ChooseImages chooseImagesBlock;
@property (nonatomic, copy) ChooseVideo chooseBlockVideo;

@property (nonatomic, copy) UserInspectTeamModel *userInspectTeam;

@property (nonatomic, strong)UIButton *logoutBtn;

@property (nonatomic, copy)NSArray *showViewArray;

@property (nonatomic, copy)NSArray *clickViewArray;

@end

@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.title = @"我的";
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    [self.view setBackgroundColor:kFFF7F8FA];
    [self buildUI];
    [self refreshUserInfo];
    
    kWeakSelf(self);
    [self.headerView tt_touchUpInside:^(id sender) {
        [weakSelf phoneLibraryAndCapture];
    }];
    
    [self getUserInfoDetails];
    [self requestDepartmentInfo];
}

- (void)buildUI{
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.nameView];
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.accountView];
    
    [self.view addSubview:self.groupView];
    [self.view addSubview:self.groupLeaderView];
    [self.view addSubview:self.groupLeaderPhoneView];
    
//    [self.view addSubview:self.modifyView];
    [self.view addSubview:self.aboutView];
    [self.view addSubview:self.logoutBtn];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.customNavBar.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(84));
    }];
    [self.nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    
    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountView.mas_bottom).offset(Adaptation_6(12));
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    [self.groupLeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    [self.groupLeaderPhoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupLeaderView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    
//    [self.modifyView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.groupLeaderPhoneView.mas_bottom).offset(Adaptation_6(12));
//        make.left.right.equalTo(self.view);
//        make.height.mas_equalTo(Adaptation_6(48));
//    }];
//    [self.aboutView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.modifyView.mas_bottom);
//        make.left.right.equalTo(self.view);
//        make.height.mas_equalTo(Adaptation_6(48));
//    }];
    
    [self.aboutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupLeaderPhoneView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    
    [self.logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.aboutView.mas_bottom).offset(Adaptation_6(20));
        make.left.equalTo(self.view).offset(Adaptation_6(12));
        make.right.equalTo(self.view).offset(Adaptation_6(-12));
        make.height.mas_equalTo(Adaptation_6(48));
    }];
    
    _headerView.textLabel.text = @"头像";
    _nameView.textLabel.text = @"用户姓名";
    _phoneView.textLabel.text = @"用户手机号";
    _accountView.textLabel.text = @"账号名称";
    
    _groupView.textLabel.text = @"巡检组";
    _groupLeaderView.textLabel.text = @"巡检组负责人";
    _groupLeaderPhoneView.textLabel.text = @"负责人电话";
    
    _modifyView.textLabel.text = @"修改密码";
    _aboutView.textLabel.text = @"关于app";
    
}

- (void)uploadHeadImage:(UIImage *)image{
    [SVProgressHUD showProgress:1.0];
    [MainPageRequestManager UploadImageByRequestWithImages:@[image] success:^(NSURLSessionDataTask * _Nonnull task, BaseRequestSuccessModel * _Nonnull successModel) {
        if (successModel.code == kRequestResultCode_0) {
            [SVProgressHUD showSuccessWithStatus:@"上传成功"];
            [self.headerView.headImage setImage:image];

//            [self.publishBtn setEnabled:YES];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, BaseRequestFailModel * _Nonnull failModel) {

    }];
}

- (void)refreshUserInfo{
    self.userModel = [PBUserInfo userInfoFromSandbox].user;
    NSLog(@"用户信息：%@",[PBUserInfo shareManager]);
    if (self.userModel.userID) {
        [self.headerView.imageView sd_setImageWithURL:[NSURL URLWithString:self.userModel.headPic] placeholderImage:[UIImage imageNamed:@"header_bitmap"]];
        _nameView.content.text = self.userModel.name;
        _phoneView.content.text = self.userModel.phone;
        _accountView.content.text = self.userModel.loginName;
        
        if (_userInspectTeam && _userInspectTeam.teamList.count > 0) {
            _groupView.content.text = [_userInspectTeam.teamList firstObject].inspectTeamName;
            _groupLeaderView.content.text = [_userInspectTeam.teamList firstObject].leaderUserName;
            _groupLeaderPhoneView.content.text = [_userInspectTeam.teamList firstObject].leaderUserPhone;
        }
    }
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

#pragma mark - 获取用户数据接口
- (void)getUserInfoDetails{
    NSDictionary *params = @{@"loginName":[PBUserInfo userInfoFromSandbox].user.loginName,
                            @"platformType": @"3",
                             @"id": [PBUserInfo userInfoFromSandbox].user.userID
                            };
    [MainPageRequestManager getLoginUserInfoRequestWithParams:params success:^(NSURLSessionDataTask * _Nonnull task, BaseRequestSuccessModel * _Nonnull successModel) {
            if (successModel.code == kRequestResultCode_0) {
                // 请求成功
                PBUserInfo *userInfo = [PBUserInfo yy_modelWithJSON:successModel.body];
                userInfo.token = [PBUserInfo userInfoFromSandbox].token;
                [userInfo save];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, BaseRequestFailModel * _Nonnull failModel) {
            
        }];
}

#pragma mark 选择头像
- (void)phoneLibraryAndCapture {
    
    TTActionSheet *sheet = [[TTActionSheet alloc] initWithTitle:@"" clickAction:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [self showCaptureToChooseImage:^(UIImage * _Nonnull image) {
                [self uploadHeadImage:image];
            }];
        }else if (buttonIndex == 1) {
            [self showPhoneLibraryToChooseImage:^(UIImage * _Nonnull image) {
                [self uploadHeadImage:image];
            }];
        }
    } cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册",nil];
    [sheet show];
}

#pragma mark 相册选择
- (void)showPhoneLibraryToChooseImage:(ChooseImage)chooseBlock {
    
    self.chooseBlock = chooseBlock;
    if (![UIApplication hasToPhoneLibraryAlert]) {
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];;
    imagePicker.navigationBar.translucent = NO;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

#pragma mark 相机拍照
- (void)showCaptureToChooseImage:(ChooseImage)chooseBlock {
    
    self.chooseBlock = chooseBlock;
    if (![UIApplication hasToCaptureAlert]) {
        return;
    }

    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

#pragma mark - <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
//用户选中图片后的回调
- (void)imagePickerController: (UIImagePickerController *)picker
didFinishPickingMediaWithInfo: (NSDictionary *)info
{
    //获得图片
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString*)kUTTypeImage]) {
        // 获取图片
        UIImage *headImage = [info objectForKey:UIImagePickerControllerEditedImage];
        // 获取到头像 上传头像
        if (self.chooseBlock) {
            self.chooseBlock(headImage);
        }
    }else {
        // 获取视频
        NSURL *URL = info[UIImagePickerControllerMediaURL];
        NSData *file = [NSData dataWithContentsOfURL:URL];
        if (self.chooseBlockVideo){
            self.chooseBlockVideo(file);
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 用户选择取消
- (void) imagePickerControllerDidCancel: (UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  调整图片尺寸和大小
 *
 *  @param maxImageSize 新图片最大尺寸
 *  @param maxSize      新图片最大存储大小
 *
 *  @return 新图片imageData
 */
- (UIImage *)reSizeImage:(UIImage *)image MaxImageSize:(CGFloat)maxImageSize maxSizeWithKB:(CGFloat) maxSize
{
    
    if (maxSize <= 0.0) maxSize = 1024.0;
    if (maxImageSize <= 0.0) maxImageSize = 1024.0;
    
    //先调整分辨率
    CGSize newSize = CGSizeMake(image.size.width, image.size.height);
    
    CGFloat tempHeight = newSize.height / maxImageSize;
    CGFloat tempWidth = newSize.width / maxImageSize;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(image.size.width / tempWidth, image.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(image.size.width / tempHeight, image.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
    CGFloat sizeOriginKB = imageData.length / 1024.0;
    
    CGFloat resizeRate = 0.9;
    while (sizeOriginKB > maxSize && resizeRate > 0.1) {
        imageData = UIImageJPEGRepresentation(newImage,resizeRate);
        sizeOriginKB = imageData.length / 1024.0;
        resizeRate -= 0.1;
    }
    
    return [UIImage imageWithData:imageData];
}

#pragma mark 懒加载
- (HeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[HeaderView alloc]init];
    }
    return _headerView;
}
- (ShowView *)nameView{
    if (!_nameView) {
        _nameView = [[ShowView alloc]init];
    }
    return _nameView;
}
- (ShowView *)phoneView{
    if (!_phoneView) {
        _phoneView = [[ShowView alloc]init];
    }
    return _phoneView;
}
- (ShowView *)accountView{
    if (!_accountView) {
        _accountView = [[ShowView alloc]init];
    }
    return _accountView;
}

- (ShowView *)groupView {
    if (!_groupView) {
        _groupView = [[ShowView alloc]init];
    }
    return _groupView;
}
- (ShowView *)groupLeaderView {
    if (!_groupLeaderView) {
        _groupLeaderView = [[ShowView alloc]init];
    }
    return _groupLeaderView;
}
- (ShowView *)groupLeaderPhoneView {
    if (!_groupLeaderPhoneView) {
        _groupLeaderPhoneView = [[ShowView alloc]init];
    }
    return _groupLeaderPhoneView;
}

- (ClickView *)modifyView{
    if (!_modifyView) {
        _modifyView = [[ClickView alloc]init];
        [_modifyView tt_touchUpInside:^(id sender) {
            ModifyPwdViewController *modifyVC = [[ModifyPwdViewController alloc]init];
            [self.navigationController pushViewController:modifyVC animated:YES];
        }];
    }
    return _modifyView;
}

- (ClickView *)aboutView{
    if (!_aboutView) {
        _aboutView = [[ClickView alloc]init];
        [_aboutView tt_touchUpInside:^(id sender) {
            AboutVC *aboutVC = [[AboutVC alloc]init];
            [self.navigationController pushViewController:aboutVC animated:YES];
        }];
    }
    return _aboutView;
}

- (UIButton *)logoutBtn{
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoutBtn setBackgroundColor:kFF1677FF];
        _logoutBtn.layer.cornerRadius = Adaptation_6(4);
        _logoutBtn.clipsToBounds = YES;
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:kFFFFFFFF forState:UIControlStateNormal];
        [_logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}

- (void)logout{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"退出登录" message:@"您确定要退出登录？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 退出登录
        [PBUserInfo exitLogin];
        [LAUNCH_MANAGER showLaunch];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alter addAction:sureAction];
    [alter addAction:cancelAction];
    [self presentViewController:alter animated:YES completion:nil];
}

@end
