//
//  TroubleUrl.m
//  BaseProject
//
//  Created by yangyang on 2022/11/17.
//

#import "TroubleUrl.h"

@implementation TroubleUrl

// 巡检故障-新增故障
NSString *const inspectTaskCheckPointAssetsInfoSave = @"/multi/inspectTaskCheckPointAssetsInfo/app/save";

// 巡检故障-删除故障
NSString *const inspectTaskCheckPointAssetsInfoDelete = @"/multi/inspectTaskCheckPointAssetsInfo/app/delete";

// 巡检故障-查看故障
NSString *const inspectTaskCheckPointAssetsInfoDetail = @"/multi/inspectTaskCheckPointAssetsInfo/app/detail";

// 巡检故障-故障列表
NSString *const inspectTaskCheckPointAssetsInfoAssetsPage = @"/multi/inspectTaskCheckPointAssetsInfo/app/assetsPage";

//获取故障类型字典
NSString *const inspectBaseInfoGetDictionaryNodeList = @"/multi/inspectBaseInfo/getDictionaryNodeList";

//单文件上传
NSString *const uploadFilePath = @"/system/server/new/upload";

@end
