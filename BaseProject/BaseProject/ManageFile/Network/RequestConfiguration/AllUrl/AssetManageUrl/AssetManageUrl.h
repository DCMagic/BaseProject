//
//  AssetManageUrl.h
//  BaseProject
//
//  Created by dongchao on 2022/12/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AssetManageUrl : NSObject

#pragma mark - 字典

/// 获取系统字典
FOUNDATION_EXPORT NSString *const kGetDictItemList;

/// 系统配置字典
FOUNDATION_EXPORT NSString *const kGetDictItemList2;

#pragma mark - 普通杆

/// 资产管理-普通杆-列表
FOUNDATION_EXPORT NSString *const kOrdinaryPoleList;

/// 资产管理-普通杆-基本信息
FOUNDATION_EXPORT NSString *const kOrdinaryPoleBaseInfo;

/// 资产管理-普通杆-挂载设备列表
FOUNDATION_EXPORT NSString *const kOrdinaryPoleDeviceList;

/// 资产管理-普通杆-挂载对象详情
FOUNDATION_EXPORT NSString *const kOrdinaryPoleDeviceDetail;

#pragma mark - 多功能综合杆

/// 资产管理-多功能综合杆-列表
FOUNDATION_EXPORT NSString *const kMutifunctionPoleList;

/// 资产管理-多功能综合杆-基本信息
FOUNDATION_EXPORT NSString *const kMutifunctionPoleBaseInfo;

/// 资产管理-多功能综合杆-普通挂载设备列表
FOUNDATION_EXPORT NSString *const kMutifunctionPoleDeviceList;

/// 资产管理-多功能综合杆-普通挂载设备详情
FOUNDATION_EXPORT NSString *const kMutifunctionPoleDeviceDetail;

/// 资产管理-多功能综合杆-智能信控设备
FOUNDATION_EXPORT NSString *const kMutifunctionPoleIntelligenceDevice;

#pragma mark - 智能综合箱

/// 资产管理-智能综合箱-列表
FOUNDATION_EXPORT NSString *const kIntellgentBoxList;

/// 资产管理-智能综合箱-基本信息
FOUNDATION_EXPORT NSString *const kIntelligentBoxBaseInfo;

/// 资产管理-智能综合箱-网关基本信息
FOUNDATION_EXPORT NSString *const kIntelligentGetwayBaseInfo;

/// 资产管理-智能综合箱-网关运行监控
FOUNDATION_EXPORT NSString *const kIntelligentGetwayMonitoring;

/// 资产管理-智能综合箱-打开、关闭门锁
FOUNDATION_EXPORT NSString *const kIntelligentGetwayOpenLock;

/// 资产管理-智能综合箱-网关告警信息列表
FOUNDATION_EXPORT NSString *const kIntelligentGetwayPageAlarm;



#pragma mark - 箱控

/// 资产监控-箱控-列表
FOUNDATION_EXPORT NSString *const kIntelligenceBoxManageList;

/// 资产监控-箱控-基本信息
FOUNDATION_EXPORT NSString *const kIntelligenceBoxManageBaseInfo;

/// 资产监控-箱控-运行监控
FOUNDATION_EXPORT NSString *const kIntelligenceBoxManageMonitoring;

/// 资产监控-箱控-告警信息列表
FOUNDATION_EXPORT NSString *const kIntelligenceBoxManageAlarmList;

/// 资产监控-箱控-告警信息详情（包含告警记录）
FOUNDATION_EXPORT NSString *const kIntelligenceBoxManageAlarmInfoDetail;

#pragma mark - 电源

/// 资产监控-电源-分页查询列表
FOUNDATION_EXPORT NSString *const kIntelligencePowerControlList;

/// 资产监控-电源-基本信息
FOUNDATION_EXPORT NSString *const kIntelligencePowerControlBaseInfo;

/// 资产监控-电源-运行监控
FOUNDATION_EXPORT NSString *const kIntelligencePowerControlMonitoring;

/// 资产监控-电源-设置第二路检测方式
FOUNDATION_EXPORT NSString *const kIntelligencePowerControlPattern;

/// 资产监控-电源-输出通路开启
FOUNDATION_EXPORT NSString *const kIntelligencePowerControlConnectPower;

/// 资产监控-电源-输出通路关闭
FOUNDATION_EXPORT NSString *const kIntelligencePowerControlBreakPower;

#pragma mark - 网关

/// 资产监控-网关-分页查询列表
FOUNDATION_EXPORT NSString *const kIntelligenceGetwayList;

/// 资产监控-网关-网关告警信息列表
FOUNDATION_EXPORT NSString *const kIntelligenceGetwayAlarmList;

/// 资产监控-网关-网关告警基本信息、告警记录
FOUNDATION_EXPORT NSString *const kIntelligenceGetwayAlarmDetail;

@end

NS_ASSUME_NONNULL_END
