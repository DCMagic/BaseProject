//
//  TaskModel.h
//  BaseProject
//
//  Created by dongchao on 2022/11/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskModel : NSObject

@property (nonatomic, copy)NSString *taskId;
@property (nonatomic, copy)NSString *gmtCreate;
@property (nonatomic, copy)NSString *gmtModified;
@property (nonatomic, copy)NSString *sort;
@property (nonatomic, copy)NSString *notes;
@property (nonatomic, copy)NSString *creator;
@property (nonatomic, copy)NSString *editor;
@property (nonatomic, copy)NSString *taskName;
@property (nonatomic, assign)NSInteger planType;
@property (nonatomic, copy)NSString *planTypeName;
@property (nonatomic, copy)NSString *taskStartTime;
@property (nonatomic, copy)NSString *taskEndTime;
@property (nonatomic, assign)NSInteger inspectPlanInfoId;
@property (nonatomic, copy)NSString *inspectPlanInfoName;
@property (nonatomic, assign)NSInteger inspectTeamId;
@property (nonatomic, copy)NSString *inspectTeamName;
@property (nonatomic, assign)NSInteger taskStatus;
@property (nonatomic, copy)NSString *taskStatusName;
@property (nonatomic, assign)NSInteger exceptCheckPointCount;
@property (nonatomic, assign)NSInteger exceptCheckStreetCount;
@property (nonatomic, assign)NSInteger checkCount;
@property (nonatomic, assign)NSInteger unCheckPointCount;
@property (nonatomic, assign)NSInteger checkStreetCount;
@property (nonatomic, assign)NSInteger unCheckStreetCount;
@property (nonatomic, assign)NSInteger assetsFaultCount;
@property (nonatomic, assign)NSInteger inspectLeaderUserId;
@property (nonatomic, copy)NSString *inspectLeaderUserName;
@property (nonatomic, copy)NSString *inspectLeaderUserPhone;
@property (nonatomic, copy)NSString *processRate;
@property (nonatomic, assign)float processRateValue;

@property (nonatomic, copy)NSString *planName;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, assign)NSInteger progress;
@property (nonatomic, copy)NSString *time;

@end

NS_ASSUME_NONNULL_END
