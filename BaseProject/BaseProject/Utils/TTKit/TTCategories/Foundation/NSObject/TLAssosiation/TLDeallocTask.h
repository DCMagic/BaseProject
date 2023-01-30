//
//  TLDeallocTask.h
//  TTKit
//
//  Created by tao6 on 2017/7/12.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Dealloc.h"

@interface TLDeallocTask : NSObject

- (void)addTask:(TLDeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)removeTaskForTarget:(id)target key:(NSString *)key;

@end
