//
//  PBUserInfo.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/2/25.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "PBUserInfo.h"
#import <UIKit/UIKit.h>
#define USER_INFO_NAME @"userInfo.data"

@implementation PBUserInfo

- (instancetype)init{
    
    self = [super init];
    if (self) {
        _roleIds = @[];
        _identityIds = @[];
        _businessIdentityIds = @[];
        _menuCodeList = @[];
        _user = [[PBUser alloc] init];
        _buttonCodeList = @[];
        _token = @"";
        
//        _identitys = @[];
//        _moduleResource = @[];
//        _roles = @[];
//        _apiResource = @[];
//        _departments = @[];
//        _token = @"";
//        _user = [[PBUser alloc] init];
    }
    return self;
}

+ (instancetype)shareManager{
    
    static PBUserInfo *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance= [PBUserInfo userInfoFromSandbox];
        if (_instance == nil) {
            _instance = [[PBUserInfo alloc] init];
        }
    });
    return _instance;
}

// 包含其他model，设置其解析包含的类
+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"user" : PBUser.class
             };
}

- (void)updateUserInfo {

    for (NSString *memberNameStr in [PBUserInfo shareManager].tt_propertyKeys) {
        NSDictionary *propertyDict = self.tt_propertyDictionary;

        id value = propertyDict[memberNameStr];

        [[PBUserInfo shareManager] setValue:value forKey:memberNameStr];

    }
}


// 存储当前授权模型
- (BOOL)save{
    [self updateUserInfo];
    
    NSDictionary *userDict = [self yy_modelToJSONObject];
    // 存储数据
    return  [PBUserInfo writePlistWith:userDict];
}

// 获取模型
+ (PBUserInfo *)userInfoFromSandbox {
    NSDictionary *obj = [PBUserInfo readLocalPlist];
    PBUserInfo *userInfo = [PBUserInfo yy_modelWithJSON:obj];
    return userInfo;
}

// 退出登陆
+ (void)exitLogin {
    [self clearData];
    [PBUserInfo shareManager].token = @"";
    [PBUserInfo shareManager].user = nil;
}


// 删除文件
+ (BOOL)clearData {
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    BOOL isRemove;
    // 1.获取存储路径
    NSString *filePath = [USER_INFO_NAME appendDocumentDir];
    if ([defaultManager fileExistsAtPath:filePath]){
        isRemove = [defaultManager removeItemAtPath:filePath error:nil];
    }else{
        isRemove = YES;
    }
    
    return isRemove;
}

// 将数据写入文件中
+ (BOOL)writePlistWith:(NSDictionary *)dataDict {
    NSString *dataPath = [USER_INFO_NAME appendDocumentDir];
    return [dataDict writeToFile:dataPath atomically:YES];
}

// 本地数据的读取
+ (NSDictionary *)readLocalPlist {
    NSString *dataPath = [USER_INFO_NAME appendDocumentDir];
    return [NSDictionary dictionaryWithContentsOfFile:dataPath];
}


@end
