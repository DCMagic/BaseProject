//
//  ShowSVProgressHUD.m
//  jingcaiyuanyu
//
//  Created by dongchao on 2018/8/20.
//  Copyright © 2018年 dongchao. All rights reserved.
//

#import "ShowSVProgressHUD.h"

static NSTimeInterval const showMessageDuration  = 1.5;

@implementation ShowSVProgressHUD

+(void)showWithStatus :(NSString*)status {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:status];
}

+(void)showInteractiveWithStatus :(NSString*)status {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:status];
}

+(void)showInfoWithImageName :(NSString *)imageName status :(NSString *)status{

    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    if (imageName && imageName.length != 0) {
        [SVProgressHUD setInfoImage:[UIImage imageNamed:imageName]];
    }
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showInteractiveInfoWithImageName :(NSString *)imageName status :(NSString *)status{
    if (status.length == 0) {
        return;
    }
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    if (imageName && imageName.length != 0) {
        [SVProgressHUD setInfoImage:[UIImage imageNamed:imageName]];
    }
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showNoImageInfoWithStatus :(NSString *)status{
    if (status.length == 0) {
        return;
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showInteractiveNoImageInfoWithStatus :(NSString *)status{
    if (status.length == 0) {
        return;
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showErrorWithImageName :(NSString *)imageName message :(NSString *)message{
    if (message.length == 0) {
        return;
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    if (imageName.length != 0) {
        [SVProgressHUD setErrorImage:[UIImage imageNamed:imageName]];
    }
    [SVProgressHUD showErrorWithStatus:message];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showInteractiveErrorWithImageName :(NSString *)imageName message :(NSString *)message{
    if (message.length == 0 || message == nil) {
        return;
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    if (imageName.length != 0 && imageName != nil) {
        [SVProgressHUD setErrorImage:[UIImage imageNamed:imageName]];
    }
    [SVProgressHUD showErrorWithStatus:message];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showSuccessWithImageName :(NSString *)imageName message :(NSString *)message {
    if (message.length == 0) {
        return;
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    if (imageName.length != 0) {
        [SVProgressHUD setSuccessImage:[UIImage imageNamed:message]];
    }
    [SVProgressHUD showSuccessWithStatus:message];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)showInteractiveSuccessWithImageName :(NSString *)imageName message :(NSString *)message {
    if (message.length == 0) {
        return;
    }
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    if (imageName.length != 0) {
        [SVProgressHUD setSuccessImage:[UIImage imageNamed:message]];
    }
    [SVProgressHUD showSuccessWithStatus:message];
    [SVProgressHUD dismissWithDelay:showMessageDuration];
}

+(void)svpPopActivity{
    [SVProgressHUD popActivity];
}

+(void)svpDismiss {
    [SVProgressHUD dismiss];
}

@end
