//
//  NSFileManager+Paths.h
//  TTKit
//
//  Created by tao6 on 2017/7/5.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Paths)


+ (NSURL *)documentsURL;
+ (NSString *)documentsPath;


+ (NSURL *)libraryURL;
+ (NSString *)libraryPath;


+ (NSURL *)cachesURL;
+ (NSString *)cachesPath;


+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path;

+ (double)availableDiskSpace;

@end
