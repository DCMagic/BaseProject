//
//  DCSaveData.m
//  BaseProject
//
//  Created by dongchao on 2023/1/18.
//

#import "DCSaveData.h"

@implementation DCSaveData

+ (BOOL)searchFileIsExistWithFolderType:(DCFolderType)type FileName:(NSString *)fileName{
    NSString *fullpath;
    if (type == DCFolderTypeDocument) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        fullpath = [NSString stringWithFormat:@"%@%@.plist",path,fileName];
    }else if(type == DCFolderTypeLibraryCache) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        fullpath = [NSString stringWithFormat:@"%@/cache/%@.plist",path,fileName];
    }else if (type == DCFolderTypeLibraryPrefences){
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) firstObject];
        fullpath = [NSString stringWithFormat:@"%@/preference/%@.plist",path,fileName];
    }else if (type == DCFolderTypeTmp){
        NSString *path = NSTemporaryDirectory();
        fullpath = [NSString stringWithFormat:@"%@%@.plist",path,fileName];
    }
    return [[NSFileManager defaultManager] fileExistsAtPath:fullpath];
}

+ (BOOL)saveArrayDataToTmpWithFileName:(NSString *)fileName fileData:(NSArray *)data{
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@",tmpPath);
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.plist",tmpPath,fileName];
    if (data) {
        [data writeToFile:fullPath atomically:YES];
    }
    return YES;
}

+(BOOL)saveDictionaryDataToTmpWithFileName:(NSString *)fileName fileData:(NSDictionary *)data{
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@",tmpPath);
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.plist",tmpPath,fileName];
    if (data) {
        [data writeToFile:fullPath atomically:YES];
    }
    return YES;
}

+ (NSDictionary *)readDictionaryDataToTmpWithFileName:(NSString *)fileName{
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@",tmpPath);
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.plist",tmpPath,fileName];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:fullPath];
    return dict;
}

+ (NSArray *)readArrayDataToTmpWithFileName:(NSString *)fileName{
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@",tmpPath);
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.plist",tmpPath,fileName];
    NSArray *array = [NSArray arrayWithContentsOfFile:fullPath];
    return array;
}

+ (void)clearTmpDirectory{
    NSArray *tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:nil];
    for (NSString *file in tmpDirectory) {
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:nil];
    }
}

@end
