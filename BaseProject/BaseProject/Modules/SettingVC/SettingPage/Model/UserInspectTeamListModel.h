//
//  UserInspectTeamListModel.h
//  BaseProject
//
//  Created by yangyang on 2022/11/21.
//

#import <Foundation/Foundation.h>
#import "UserInspectTeamListUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInspectTeamListModel : NSObject

//巡检组id
@property (nonatomic, copy) NSString *inspectTeamId;
//巡检组名称
@property (nonatomic, copy) NSString *inspectTeamName;
//巡检组负责人id
@property (nonatomic, copy) NSString *leaderUserId;
//巡检组负责人姓名
@property (nonatomic, copy) NSString *leaderUserName;
//巡检组负责人手机号
@property (nonatomic, copy) NSString *leaderUserPhone;
//巡检组成员
@property (nonatomic, copy) NSArray<UserInspectTeamListUserModel *> *userList;

@end

NS_ASSUME_NONNULL_END
