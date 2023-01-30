//
//  InspectionTaskUrl.h
//  BaseProject
//
//  Created by dongchao on 2022/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InspectionTaskUrl : NSObject

// 巡检任务-任务列表
FOUNDATION_EXPORT NSString *const kInspectTaskList;

// 巡检首页
FOUNDATION_EXPORT NSString *const kInspectMainList;

// 巡检任务-任务详情
FOUNDATION_EXPORT NSString *const kInspectTaskDetail;

// 巡检任务-巡检资产、道路（树）
FOUNDATION_EXPORT NSString *const kInspectTaskTree;

// 巡检任务-巡检记录（树）
FOUNDATION_EXPORT NSString *const kInspectRecordTree;

// 巡检任务详情-巡检点
FOUNDATION_EXPORT NSString *const kInspectPoint;

// 巡检任务详情-获取打卡半径
FOUNDATION_EXPORT NSString *const kGetPunchRadius;

// 巡检任务-巡检点及打卡点上报
FOUNDATION_EXPORT NSString *const kReportPoint;

// 定向巡检-巡检记录上报
FOUNDATION_EXPORT NSString *const kReportPlan;

// 定向巡检-扫码获取资产信息
FOUNDATION_EXPORT NSString *const kGetCheckInfo;

// 定向巡检-检查记录
FOUNDATION_EXPORT NSString *const kGetCheckPointInfo;

@end

NS_ASSUME_NONNULL_END
