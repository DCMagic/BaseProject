//
//  UserInspectTeamModel.m
//  BaseProject
//
//  Created by yangyang on 2022/11/21.
//

#import "UserInspectTeamModel.h"

@implementation UserInspectTeamModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"teamList" : UserInspectTeamListModel.class
    };
}

- (id)copyWithZone:(NSZone *)zone {
 return [self yy_modelCopy];
}

@end
