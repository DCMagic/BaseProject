//
//  DCSaveData.h
//  BaseProject
//
//  Created by dongchao on 2023/1/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    DCFolderTypeDocument = 0,
    DCFolderTypeLibraryCache,
    DCFolderTypeLibraryPrefences,
    DCFolderTypeTmp,
}DCFolderType;

@interface DCSaveData : NSObject


+ (BOOL)searchFileIsExistWithFolderType:(DCFolderType)type FileName:(NSString *)fileName;

/// 保存数据到tmp文件夹
/// - Parameters:
///   - fileName: 文件名称
///   - data: 缓存数据
+(BOOL)saveArrayDataToTmpWithFileName:(NSString *)fileName fileData:(NSArray *)data;

/// 读取保存到缓存中的数据
/// - Parameter fileName: 文件名称
+ (NSArray *)readArrayDataToTmpWithFileName:(NSString *)fileName;

/// 保存数据到tmp文件夹
/// - Parameters:
///   - fileName: 文件名称
///   - data: 缓存数据
+(BOOL)saveDictionaryDataToTmpWithFileName:(NSString *)fileName fileData:(NSDictionary *)data;

/// 读取保存到缓存中的数据
/// - Parameter fileName: 文件名称
+ (NSDictionary *)readDictionaryDataToTmpWithFileName:(NSString *)fileName;

/// 清空缓存数据
+(void)clearTmpDirectory;

@end

NS_ASSUME_NONNULL_END
