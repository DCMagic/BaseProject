//
//  TaskModel.m
//  BaseProject
//
//  Created by dongchao on 2022/11/10.
//

#import "TaskModel.h"

@implementation TaskModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"taskId" : @"id"};
}

@end
