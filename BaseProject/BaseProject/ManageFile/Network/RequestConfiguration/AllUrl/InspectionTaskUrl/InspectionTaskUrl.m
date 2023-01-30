//
//  InspectionTaskUrl.m
//  BaseProject
//
//  Created by dongchao on 2022/11/18.
//

#import "InspectionTaskUrl.h"

@implementation InspectionTaskUrl

// 巡检任务-任务列表
NSString *const kInspectTaskList = @"/multi/inspectTask/app/page";

// 巡检任务-任务信息
NSString *const kInspectTaskDetail = @"/multi/inspectTask/app/detail";

// 巡检任务-巡检资产、道路（树）
NSString *const kInspectTaskTree = @"/multi/inspectTask/app/getNodeList";

// 巡检首页
NSString *const kInspectMainList = @"/multi/inspectTask/app/getInspectTaskList";

// 巡检任务-巡检记录（树）
NSString *const kInspectRecordTree = @"/multi/inspectTask/app/getCheckedNodeList";

// 巡检任务详情-巡检点
NSString *const kInspectPoint = @"/multi/inspectTask/app/getGcjMap";

// 巡检任务详情-获取打卡半径
NSString *const kGetPunchRadius = @"/multi/inspectBaseInfo/getCheckPointScope";

// 巡检任务-巡检点及打卡点上报
NSString *const kReportPoint = @"/multi/inspectTaskCheckPointLog/app/checkAndWalk";

// 定向巡检-巡检记录上报
NSString *const kReportPlan = @"/multi/inspectTaskCheckPointAssetsInfo/app/save";

// 定向巡检-扫码获取资产信息
NSString *const kGetCheckInfo = @"/multi/inspectTaskCheckPoint/app/detailByAssetsStdCode";

// 定向巡检-检查记录
NSString *const kGetCheckPointInfo = @"/multi/inspectTaskCheckPoint/app/detail";

@end
