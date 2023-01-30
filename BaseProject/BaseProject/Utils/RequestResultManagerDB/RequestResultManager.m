//
//  RequestResultManager.m
//  jingcaieyuan
//
//  Created by dongchao on 2018/9/21.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import "RequestResultManager.h"
#import "FMDatabase.h"


//地址
#define DB_Path [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"AllRequestResult.sqlite"]
//表名
#define RequestResultManagerSQLName @"RequestResultManager"
//表单条id
#define RequestResultManagerID  @"id"

/* ***存储的数据*** */
// url
#define RequestUrl @"url"
// 请求的参数
#define RequestParams @"params"
// 是否需要token
#define IsToken @"isToken"
// 请求的格式
#define ContentType @"contentType"
// 是否成功
#define IsSuccess @"isSuccess"
// 请求的结果
#define Result @"result"
// 时间
#define StorageDate @"storageDate"

@implementation RequestResultManager

//创建db
+(void)initializeDatabase{
    FMDatabase *db = [FMDatabase databaseWithPath:DB_Path];
    if ([db open]) {
        // 创建表
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT, '%@' TEXT, '%@' INTEGER, '%@' TEXT, '%@' INTEGER, '%@' TEXT, '%@' TEXT)",RequestResultManagerSQLName,RequestResultManagerID,RequestUrl,RequestParams,IsToken,ContentType,IsSuccess,Result,StorageDate];
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (!res) {
            NSLog(@"接口记录表创建失败！");
        } else {
            NSLog(@"接口记录表创建成功！");
        }
        
        [db close];
    }else{
        NSLog(@"打开数据库失败!");
    }
}

//插入数据
+(void)insertDataWithResultModel :(BaseRequestResultManagerModel *)model{
    [self initializeDatabase];
    FMDatabase *db = [FMDatabase databaseWithPath:DB_Path];
    if ([db open]) {
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *dateStr = [format stringFromDate:[NSDate new]];
        
        NSString *insertSql = [NSString stringWithFormat:
                               @"INSERT INTO '%@' ('%@', '%@', '%@', '%@', '%@', '%@', '%@') VALUES ('%@', '%@', '%d', '%@', '%d', '%@', '%@')",RequestResultManagerSQLName,RequestUrl,RequestParams,IsToken,ContentType,IsSuccess,Result,StorageDate,model.url,model.params,model.isToken ? 1 : 0,model.contentType,model.isSuccess ? 1 : 0,model.result,dateStr];
        
        BOOL res = [db executeUpdate:insertSql];
        if (!res) {
            NSLog(@"插入数据失败");
        } else {
            NSLog(@"插入数据成功");
        }
        [db close];
    }
}

//查询
+(NSMutableArray<BaseRequestResultManagerModel *>*)queryDataSource{
    
    FMDatabase *db = [FMDatabase databaseWithPath:DB_Path];
    NSMutableArray *returnArr = [NSMutableArray array];
    if ([db open]) {
        NSString * sql = [NSString stringWithFormat:
                          @"SELECT * FROM %@",RequestResultManagerSQLName];
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            BaseRequestResultManagerModel *model = [[BaseRequestResultManagerModel alloc] init];
            model.url = [rs stringForColumn:RequestUrl];
            model.params =  [rs stringForColumn:RequestParams];
            model.isToken = [[rs stringForColumn:IsToken] integerValue] == 1 ? YES : NO;
            model.contentType = [rs stringForColumn:ContentType];
            model.isSuccess = [[rs stringForColumn:IsSuccess] integerValue] == 1 ? YES : NO;
            model.result = [rs stringForColumn:Result];
            model.storageDate = [rs stringForColumn:StorageDate];
            [returnArr addObject:model];
        }
        [db close];
    }
    return [[[returnArr reverseObjectEnumerator] allObjects] mutableCopy];
}

// 删除数据库
+(void)deleteDatabse
{
    BOOL success;
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    FMDatabase *db = [FMDatabase databaseWithPath:DB_Path];
    // delete the old db.
    if ([fileManager fileExistsAtPath:DB_Path])
    {
        [db close];
        success = [fileManager removeItemAtPath:DB_Path error:&error];
        if (!success) {
            NSAssert1(0, @"Failed to delete old database file with message '%@'.", [error localizedDescription]);
        }else{
            NSLog(@"删除成功");
        }
    }
}

@end
