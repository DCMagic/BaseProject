//
//  ScanQRCodeVC.m
//  jingcaiyuanyu
//
//  Created by dongchao on 2018/8/20.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import "ScanQRCodeVC.h"
#import "SGQRCode.h"
#import "SGQRCodeScanView.h"
#import "ErrorPrintResultVC.h"

@interface ScanQRCodeVC (){
    SGQRCodeObtain *obtain;
}

@property(nonatomic, strong) SGQRCodeScanView *scanView; /**< 二维码扫描器 */
@property(nonatomic, strong) UILabel *promptLab; /**< 提示文字 */
@property(nonatomic, assign) BOOL stop;

@end

@implementation ScanQRCodeVC

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
    self.customNavBar.title = @"扫描二维码";
    self.view.backgroundColor = [UIColor blackColor];
    obtain = [SGQRCodeObtain QRCodeObtain];
    [self setupQRCodeScan];
    [self.view addSubview:self.scanView];
    [self.view addSubview:self.promptLab];
    
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
            
            [ShowSVProgressHUD showInteractiveInfoWithImageName:nil status:result];
            
//            if ([result hasPrefix:@"http://"] || [result hasPrefix:@"https://"]) {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:result]];
//            }else{
//
//                NSArray *resultArr = [result componentsSeparatedByString:@"/"];
//                if (resultArr.count == 4) {
//                    if ([resultArr.firstObject isEqualToString:@"pocketbook"] && [resultArr[1] isEqualToString:@"30"] && [resultArr[2] isEqualToString:@"6"]) {
//        //                去往活动详情
//
//                    }
//                }
//                else {
//                    ErrorPrintResultVC *vc = [[ErrorPrintResultVC alloc] init];
//                    vc.resultStr = result;
//                    [weakSelf.navigationController pushViewController:vc animated:YES];
//                }
//            }
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
            if ([result hasPrefix:@"http://"] || [result hasPrefix:@"https://"]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:result]];
            }else{
                ErrorPrintResultVC *vc = [[ErrorPrintResultVC alloc] init];
                vc.resultStr = result;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
            
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
        _promptLab.text = @"扫描活动二维码";
    }
    return _promptLab;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
