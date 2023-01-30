//
//  AssetManageUrl.m
//  BaseProject
//
//  Created by dongchao on 2022/12/19.
//

#import "AssetManageUrl.h"

@implementation AssetManageUrl

#pragma mark - 系统
/// 获取系统字典
NSString *const kGetDictItemList = @"/multi/sysConfig/app/getDicItemList";
// 获取系统字典2
NSString *const kGetDictItemList2 = @"/multi/iot/tenant/sysConfig/app/get";
#pragma mark - 普通杆
/// 资产管理-普通杆-列表
NSString *const kOrdinaryPoleList = @"/multi/assetMgt/app/pole/page";
/// 资产管理-普通杆-基本信息
NSString *const kOrdinaryPoleBaseInfo = @"/multi/assetManagement/app/pole/detail";
/// 资产管理-普通杆-挂载设备列表
NSString *const kOrdinaryPoleDeviceList = @"/multi/assetMgt/app/pole/mountList";
/// 资产管理-普通杆-挂载对象详情
NSString *const kOrdinaryPoleDeviceDetail = @"/multi/assetMgt/app/pole/mountDetail";
#pragma mark - 多功能综合杆
/// 资产管理-多功能综合杆-列表
NSString *const kMutifunctionPoleList = @"/multi/assetMgt/app/multiFunctionPole/page";
/// 资产管理-多功能综合杆-基本信息
NSString *const kMutifunctionPoleBaseInfo = @"/multi/assetMgt/app/multiFunctionPole/detail";
/// 资产管理-多功能综合杆-普通挂载设备列表
NSString *const kMutifunctionPoleDeviceList = @"/multi/assetMgt/app/multiFunctionPole/mountList";
/// 资产管理-多功能综合杆-普通挂载设备详情
NSString *const kMutifunctionPoleDeviceDetail = @"/multi/assetMgt/app/multiFunctionPole/mountDetail";
/// 资产管理-多功能综合杆-智能信控设备
NSString *const kMutifunctionPoleIntelligenceDevice = @"/multi/assetMgt/app/multiFunctionPole/smartDeviceList";
#pragma mark - 智能综合箱
/// 资产管理-智能综合箱-列表
NSString *const kIntellgentBoxList = @"/multi/assetMgt/app/sbox/page";
/// 资产管理-智能综合箱-基本信息
NSString *const kIntelligentBoxBaseInfo = @"/multi/assetMgt/app/sbox/detail";
/// 资产管理-智能综合箱-网关基本信息
NSString *const kIntelligentGetwayBaseInfo = @"/multi/assetMgt/app/gateway/detail";
/// 资产管理-智能综合箱-网关运行监控
NSString *const kIntelligentGetwayMonitoring = @"/multi/assetMgt/app/gateway/getLastData";
/// 资产管理-智能综合箱-打开、关闭门锁
NSString *const kIntelligentGetwayOpenLock = @"/multi/assetMgt/app/gateway/openLock";
/// 资产管理-智能综合箱-网关告警信息列表
NSString *const kIntelligentGetwayPageAlarm = @"/multi/assetMgt/app/gateway/alarmPage";
#pragma mark - 箱控
/// 资产监控-箱控-列表
NSString *const kIntelligenceBoxManageList = @"/multi/assetMonitoringMgt/app/smartControlBox/page";
/// 资产监控-箱控-基本信息
NSString *const kIntelligenceBoxManageBaseInfo = @"/multi/assetMonitoringMgt/app/smartControlBox/detail";
/// 资产监控-箱控-运行监控
NSString *const kIntelligenceBoxManageMonitoring =@"/multi/assetMonitoringCenter/app/smartBoxControl/getLastData";
/// 资产监控-箱控-告警信息列表
NSString *const kIntelligenceBoxManageAlarmList = @"/multi/assetMonitoringMgt/app/smartControlBox/alarmPage";
/// 资产监控-箱控-告警信息详情（包含告警记录）
NSString *const kIntelligenceBoxManageAlarmInfoDetail = @"/multi/assetMonitoringMgt/app/smartControlBox/alarmDetail";
#pragma mark - 电源
/// 资产监控-电源-分页查询列表
NSString *const kIntelligencePowerControlList = @"/multi/assetMonitoringMgt/app/power/page";
/// 资产监控-电源-基本信息
NSString *const kIntelligencePowerControlBaseInfo = @"/multi/assetMonitoringMgt/app/gateway/detail";
/// 资产监控-电源-运行监控
NSString *const kIntelligencePowerControlMonitoring = @"/multi/assetMonitoringCenter/app/power/synchronization";
/// 资产监控-电源-设置第二路检测方式
NSString *const kIntelligencePowerControlPattern = @"/multi/assetMonitoringCenter/app/power/pattern";
/// 资产监控-电源-输出通路开启
NSString *const kIntelligencePowerControlConnectPower = @"/multi/assetMonitoringCenter/app/power/connectPower";
/// 资产监控-电源-输出通路开启
NSString *const kIntelligencePowerControlBreakPower = @"/multi/assetMonitoringCenter/app/power/breakPower";
#pragma mark - 网关
/// 资产监控-网关-分页查询列表
NSString *const kIntelligenceGetwayList = @"/multi/assetMonitoringMgt/app/gateway/page";
/// 资产监控-网关-网关告警信息列表
NSString *const kIntelligenceGetwayAlarmList = @"/multi/assetMonitoringMgt/app/gateway/alarmPage";
/// 资产监控-网关-运行监控
NSString *const kIntelligenceGetwayControlMonitoring = @"/multi/assetMonitoringMgt/app/gateway/getLastData";
/// 资产监控-网关-网关告警基本信息、告警记录
NSString *const kIntelligenceGetwayAlarmDetail = @"/multi/assetMonitoringMgt/app/gateway/alarmDetail";

@end
