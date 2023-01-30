//
//  AppDelegate.m
//  LotteryManagement
//
//  Created by 刘涛 on 16/10/14.
//  Copyright © 2016年 iwgroup. All rights reserved.
//


#import "UIApplication+AppInfo.h"
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

@implementation UIApplication (AppInfo)

@dynamic window;

#pragma mark - app基本信息
- (NSString *)appName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
}

- (NSString *)appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)appBuild
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
- (NSString *)appBundleID
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

- (NSString *)documentsFolderSizeAsString
{
    NSString *folderPath = [self documentsDirectoryPath];
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    
    unsigned long long int folderSize = 0;
    
    for (NSString *fileName in filesArray) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        folderSize += [fileDictionary fileSize];
    }
    

    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:folderSize countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}

- (int)documentsFolderSizeInBytes
{
    
    NSString *folderPath = [self documentsDirectoryPath];
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    unsigned long long int folderSize = 0;
    
    for (NSString *fileName in filesArray) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        folderSize += [fileDictionary fileSize];
    }
    
    
    return (int)folderSize;
}
- (NSString *)applicationSize {
    unsigned long long docSize   =  [self sizeOfFolder:[self documentPath]];
    unsigned long long libSize   =  [self sizeOfFolder:[self libraryPath]];
    unsigned long long cacheSize =  [self sizeOfFolder:[self cachePath]];
    
    unsigned long long total = docSize + libSize + cacheSize;
    
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:total countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}


- (NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)libraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)cachePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}



-(unsigned long long)sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];
    
    NSString *file;
    unsigned long long folderSize = 0;
    
    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }
    return folderSize;
}

//#pragma mark - Privacy data access

- (BOOL)applicationHasAccessToLocationData
{
    
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied) {
        return NO;
    }
     #if __IPHONE_8_0
     #else
      if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorized)
          return YES;
     #endif
      
    return NO;
}

- (BOOL)applicationhasAccessToAddressBook
{
    BOOL hasAccess = NO;
#if __IPHONE_9_0
    if (@available(iOS 9.0, *)) {
        if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]==CNAuthorizationStatusAuthorized) {
            hasAccess=YES;
            
        }
    }
#else
    switch (ABAddressBookGetAuthorizationStatus())
    {
        case kABAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
#endif
    
    return hasAccess;
}

- (BOOL)applicationHasAccessToCalendar
{
    
    BOOL hasAccess = NO;
    
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}


- (BOOL)applicationHasAccessToReminders
{
    
    BOOL hasAccess = NO;
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}


- (BOOL)applicationHasAccessToPhotosLibrary
{
    BOOL hasAccess = NO;

#if __IPHONE_8_0
    int author = [PHPhotoLibrary authorizationStatus];
    if (author==PHAuthorizationStatusAuthorized || author == PHAuthorizationStatusNotDetermined) {
        hasAccess=YES;
    }
    
#else
    int author = [ALAssetsLibrary authorizationStatus];
    if(author== ALAuthorizationStatusAuthorized || author == ALAuthorizationStatusNotDetermined)
    {
        hasAccess=YES;
    }
#endif
    return hasAccess;
}


/**
 相机权限是否开启
 */
- (BOOL)applicationHasAccessToCapture {
    __block BOOL hasAccess = NO;
    
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//相机权限

    switch (AVstatus) {
        case AVAuthorizationStatusAuthorized:
            
            hasAccess = YES;
            break;
        case AVAuthorizationStatusDenied:

            hasAccess = NO;
            break;
        case AVAuthorizationStatusNotDetermined:
            
            hasAccess = YES;
            break;
        case AVAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        default:      
            break;
    }
    return hasAccess;
}


/**
 相机权限是否开启 不开启则提示用户
 */
+ (BOOL)hasToPhoneLibraryAlert {
    
    if (![[UIApplication sharedApplication] applicationHasAccessToCapture]) {
        NSString *appName = [[UIApplication sharedApplication] appName];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"无法使用相机" message:[NSString stringWithFormat:@"请在iPhone的“设置”-“隐私”-“相机”中，找到%@更改",appName] actionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            if (buttonIndex == 1) {
                [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
            }
            
        } cancelButtonTitle:@"取消" otherButtonTitles:@"前往", nil];
        
        [alertView show];
        
        return NO;
    }
    return YES;
}

/**
 相册权限是否开启 不开启则提示用户
 */
+ (BOOL)hasToCaptureAlert {
    NSString *appName = [[UIApplication sharedApplication] appName];

    if (![[UIApplication sharedApplication] applicationHasAccessToPhotosLibrary]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"无法使用相册" message:[NSString stringWithFormat:@"请在iPhone的“设置”-“隐私”-“照片””中，找到%@更改",appName] actionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            if (buttonIndex == 1) {
                [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
            }
            
        } cancelButtonTitle:@"取消" otherButtonTitles:@"前往", nil];
        
        [alertView show];
        
        return NO;
    }
    return YES;
    
}





/**
 *  麦克风开启
 *
 *  
 */
- (void)applicationHasAccessToMicrophone:(grantBlock)flag
{
    //检测麦克风功能是否打开
    [[AVAudioSession sharedInstance]requestRecordPermission:^(BOOL granted) {
      
        flag(granted);
        
    }];
}

- (NSString *)documentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return documentsPath;
}
-(void)registerNotifications
{
   #if __IPHONE_8_0

    //注册推送
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
    {
       // [UIApplication sharedApplication]
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                             categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        //远程推送
        
    }
    #else
    //这里还是原来的代码
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert| UIRemoteNotificationTypeBadge| UIRemoteNotificationTypeSound];
    #endif

}

- (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    //  Getting topMost ViewController
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    //  Returning topMost ViewController
    return topController;
}
//
- (UIViewController*)getCurrentViewConttoller
{
    UIViewController *currentViewController = [self topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
        while (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        }
    return currentViewController;
}

@end
