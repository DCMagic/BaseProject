//
//  ScanQRVC.m
//  BaseProject
//
//  Created by dongchao on 2022/11/11.
//

#import "ScanQRVC.h"
#import "SGQRCode.h"
#import "SGQRCodeScanView.h"
#import "InspectionTaskRequestManager.h"

@interface ScanQRVC (){
    SGQRCodeObtain *obtain;
}

@property(nonatomic, strong) SGQRCodeScanView *scanView; /**< 二维码扫描器 */
@property(nonatomic, strong) UILabel *promptLab; /**< 提示文字 */
@property (nonatomic, strong)UIButton *imageBtn; /**< 相册获取二维码*/

@property (nonatomic, strong)UIView *scanMaskView;
@property (nonatomic, strong)UIImageView *scanFrameView;

@property (nonatomic, strong)UIButton *inputBtn; /**< 跳转输入*/
@property(nonatomic, assign) BOOL stop;

@property (nonatomic, strong)UIView *maskBgView;

@end

@implementation ScanQRVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    kWeakSelf(self)
    [CommonlyUsedMethod checkCamera:weakSelf];
    if (self.stop) {
        [obtain startRunningWithBefore:^{
            
        } completion:^{
            
        }];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.scanView addTimer];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.scanView removeTimer];
}

-(void)dealloc{
    NSLog(@"扫描界面释放");
    [self removeScanningView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.title = @"扫一扫";
    self.customNavBar.barBackgroundColor = UIColor.clearColor;
    [self.customNavBar tt_setTintColor:kFFFFFFFF];
    [self.customNavBar tt_setBottomLineHidden:YES];
    self.view.backgroundColor = [UIColor blackColor];
    obtain = [SGQRCodeObtain QRCodeObtain];
    [self setupQRCodeScan];
    [self.view addSubview:self.scanView];
    [self.view addSubview:self.promptLab];
    
//    [self.view addSubview:self.imageBtn];
//    [self.imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(Adaptation_6(40));
//        make.right.equalTo(self.view).offset(Adaptation_6(-45));
//        make.bottom.equalTo(self.view).offset(Adaptation_6(-71));
//    }];
    
    [self.view addSubview:self.inputBtn];
    [self.inputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(Adaptation_6(16));
        make.right.equalTo(self.view).offset(Adaptation_6(-16));
        make.height.mas_equalTo(Adaptation_6(49));
        make.bottom.equalTo(self.view).offset(Adaptation_6(-34));
    }];
    
//    [self.view addSubview:self.scanMaskView];
//    [self.scanMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
    [self.view addSubview:self.scanFrameView];
    [self.scanFrameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(Adaptation_6(260));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(Adaptation_6(207));
    }];
    
    [self.promptLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scanFrameView);
        make.top.equalTo(self.scanFrameView.mas_bottom).offset(Adaptation_6(12));
    }];
    [self.view addSubview:self.maskBgView];
    
    [self.inputBtn addTarget:self action:@selector(inputBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)inputBtnClicked:(UIButton *)sender {
    self.maskBgView.hidden = NO;
    kWeakSelf(self);
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"城市部件编号" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (weakSelf.scanResultBlock) {
            weakSelf.scanResultBlock(alertVC.textFields.firstObject.text);
            [weakSelf.navigationController popViewControllerAnimated:true];
        }
        else {
            [weakSelf reportInspectionWith:alertVC.textFields.firstObject.text];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.maskBgView.hidden = YES;
    }];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入";
    }];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:sureAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)reportInspectionWith:(NSString *)assetsStdCode {
    
}


/**
 添加、设置扫描
 */
- (void)setupQRCodeScan {
    __weak typeof(self) weakSelf = self;

    SGQRCodeObtainConfigure *configure = [SGQRCodeObtainConfigure QRCodeObtainConfigure];
    configure.openLog = YES;
    configure.rectOfInterest = CGRectMake(0.05, 0.2, 0.7, 0.6);
    // 这里只是提供了几种作为参考（共：13）；需什么类型添加什么类型即可
    NSArray *arr = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    configure.metadataObjectTypes = arr;

    [obtain establishQRCodeObtainScanWithController:self configure:configure];
    [obtain startRunningWithBefore:^{
        // 在此可添加 HUD
    } completion:^{
        // 在此可移除 HUD
    }];
    [obtain setBlockWithQRCodeObtainScanResult:^(SGQRCodeObtain *obtain, NSString *result) {
        if (result) {
            [obtain stopRunning];
            weakSelf.stop = YES;
            [obtain playSoundName:@"SGQRCode.bundle/sound.caf"];
            
            if ([result hasPrefix:@"https://"]) {
                NSArray *strArr = [result componentsSeparatedByString:@"?"];
                if (strArr.count==2) {
                    NSArray *codeArr = [strArr.lastObject componentsSeparatedByString:@"&"];
                    if (codeArr.count == 2) {
                        NSArray *stdCodeArr = [codeArr.firstObject componentsSeparatedByString:@"="];
                        if (stdCodeArr.count == 2) {
                            NSString * stdCodeStr = stdCodeArr.lastObject;
                            if ([stdCodeStr hasPrefix:@"110120"]) {
                                if (weakSelf.scanResultBlock) {
                                    weakSelf.scanResultBlock(stdCodeStr);
                                    [weakSelf.navigationController popViewControllerAnimated:true];
                                }
                                else {
                                    [weakSelf reportInspectionWith:stdCodeStr];
                                }
                                return;
                            }
                        }
                    }
                }
            }
            [SVProgressHUD showErrorWithStatus:@"二维码不合法"];
            return;
            
        }else{
            [ShowSVProgressHUD showInteractiveInfoWithImageName:nil status:@"暂未识别出二维码，请查看您的摄像头是否对准二维码"];
        }
    }];
    
}

/**
 移除扫描
 */
- (void)removeScanningView {
    [self.scanView removeTimer];
    [self.scanView removeFromSuperview];
    self.scanView = nil;
}


/**
 打开相册
 */
-(void)openPhotoAlbum :(UIButton*)btn{
    /// 获取相册的权限
    [obtain establishAuthorizationQRCodeObtainAlbumWithController:nil];
    if (obtain.isPHAuthorization == YES) {
        [self.scanView removeTimer];
    }
    kWeakSelf(self)
    [obtain setBlockWithQRCodeObtainAlbumDidCancelImagePickerController:^(SGQRCodeObtain *obtain) {
        [weakSelf.view addSubview:weakSelf.scanView];
    }];
    [obtain setBlockWithQRCodeObtainAlbumResult:^(SGQRCodeObtain *obtain, NSString *result) {
        if (result == nil) {
            [ShowSVProgressHUD showInteractiveInfoWithImageName:nil status:@"暂未识别出二维码"];
        } else {

        }
    }];
}

- (SGQRCodeScanView *)scanView {
    if (!_scanView) {
        _scanView = [[SGQRCodeScanView alloc] initWithFrame:CGRectMake(0, Height_NavBar, self.view.frame.size.width, self.view.frame.size.height - Height_NavBar)];
        _scanView.scanAnimationStyle = ScanAnimationStyleDefault;
        _scanView.cornerLocation = CornerLoactionOutside;
        _scanView.cornerColor = [UIColor orangeColor];
    }
    return _scanView;
}

- (UIButton *)imageBtn{
    if (!_imageBtn) {
        _imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageBtn setImage:[UIImage imageNamed:@"scanQR_image"] forState:UIControlStateNormal];
        [_imageBtn addTarget:self action:@selector(openPhotoAlbum:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageBtn;
}

- (UIButton *)inputBtn {
    if (!_inputBtn) {
        _inputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_inputBtn setTitle:@"城市部件编号" forState:UIControlStateNormal];
        [_inputBtn setBackgroundColor:KFF1677FF];
        [_inputBtn setTitleColor:kFFFFFFFF forState:UIControlStateNormal];
        [_inputBtn.titleLabel setFont:kPingFangSC_Regular_16];
        _inputBtn.layer.cornerRadius = Adaptation_6(8);
        _inputBtn.clipsToBounds = YES;
    }
    return _inputBtn;
}

- (UILabel *)promptLab {
    if (!_promptLab) {
        _promptLab = [[UILabel alloc] init];
        _promptLab.backgroundColor = [UIColor clearColor];
        CGFloat promptLabelX = 0;
        CGFloat promptLabelY = 0.73 * self.view.frame.size.height;
        CGFloat promptLabelW = self.view.frame.size.width;
        CGFloat promptLabelH = Adaptation_6(40);
        _promptLab.numberOfLines = 0;
        _promptLab.frame = CGRectMake(promptLabelX, promptLabelY, promptLabelW, promptLabelH);
        _promptLab.textAlignment = NSTextAlignmentCenter;
        _promptLab.font = [UIFont boldSystemFontOfSize:15.0];
        _promptLab.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _promptLab.text = @"将取景框对准二维码，即可自动扫描";
    }
    return _promptLab;
}

- (UIView *)scanMaskView {
    if (!_scanMaskView) {
        _scanMaskView = [[UIView alloc]init];
        [_scanMaskView setBackgroundColor:UIColor.blackColor];
        _scanMaskView.alpha = 0.5;
    }
    return _scanMaskView;
}

- (UIImageView *)scanFrameView {
    if (!_scanFrameView) {
        _scanFrameView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scan_frame"]];
    }
    return _scanFrameView;
}

- (UIView *)maskBgView {
    if (!_maskBgView) {
        _maskBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PhoneScreen_WIDTH, PhoneScreen_HEIGHT)];
        _maskBgView.hidden = YES;
    }
    return _maskBgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
