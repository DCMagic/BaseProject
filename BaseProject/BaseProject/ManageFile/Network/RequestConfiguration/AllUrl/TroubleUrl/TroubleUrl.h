//
//  TroubleUrl.h
//  BaseProject
//
//  Created by yangyang on 2022/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TroubleUrl : NSObject

// 巡检故障-新增故障
FOUNDATION_EXPORT NSString *const inspectTaskCheckPointAssetsInfoSave;

// 巡检故障-删除故障
FOUNDATION_EXPORT NSString *const inspectTaskCheckPointAssetsInfoDelete;

// 巡检故障-查看故障
FOUNDATION_EXPORT NSString *const inspectTaskCheckPointAssetsInfoDetail;

// 巡检故障-查看故障
FOUNDATION_EXPORT NSString *const inspectTaskCheckPointAssetsInfoAssetsPage;

// 获取故障类型字典
FOUNDATION_EXPORT NSString *const inspectBaseInfoGetDictionaryNodeList;

//单文件上传
FOUNDATION_EXPORT NSString *const uploadFilePath;


@end

NS_ASSUME_NONNULL_END
