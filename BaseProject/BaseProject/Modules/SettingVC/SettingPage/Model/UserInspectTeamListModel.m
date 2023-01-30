//
//  UserInspectTeamListModel.m
//  BaseProject
//
//  Created by yangyang on 2022/11/21.
//

#import "UserInspectTeamListModel.h"

@implementation UserInspectTeamListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"userList" : UserInspectTeamListUserModel.class
    };
}

- (id)copyWithZone:(NSZone *)zone {
 return [self yy_modelCopy];
}

@end
