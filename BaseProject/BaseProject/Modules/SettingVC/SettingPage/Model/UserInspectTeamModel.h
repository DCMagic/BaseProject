//
//  UserInspectTeamModel.h
//  BaseProject
//
//  Created by yangyang on 2022/11/21.
//

#import <Foundation/Foundation.h>
#import "UserInspectTeamListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInspectTeamModel : NSObject

//当前登录者用户id
@property (nonatomic, copy) NSString *userId;
//当前登录者用户姓名
@property (nonatomic, copy) NSString *userName;
//当前登录者手机号
@property (nonatomic, copy) NSString *phone;
//当前登录者所属团队集合
@property (nonatomic, copy) NSArray<UserInspectTeamListModel *> *teamList;

@end

NS_ASSUME_NONNULL_END
