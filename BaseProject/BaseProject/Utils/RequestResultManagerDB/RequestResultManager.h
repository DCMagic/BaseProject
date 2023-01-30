//
//  RequestResultManager.h
//  jingcaieyuan
//
//  Created by dongchao on 2018/9/21.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestResultManagerModel.h"

@interface RequestResultManager : NSObject

//插入数据
+(void)insertDataWithResultModel :(BaseRequestResultManagerModel *)model;

//查询
+(NSMutableArray<BaseRequestResultManagerModel *>*)queryDataSource;

// 删除数据库
+(void)deleteDatabse;

@end
