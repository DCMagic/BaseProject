//
//  UserInspectTeamListUserModel.h
//  BaseProject
//
//  Created by yangyang on 2022/11/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInspectTeamListUserModel : NSObject

//用户id
@property (nonatomic, copy) NSString *userId;
//用户姓名
@property (nonatomic, copy) NSString *userName;
//用户手机号
@property (nonatomic, copy) NSString *userPhone;

@end

NS_ASSUME_NONNULL_END
