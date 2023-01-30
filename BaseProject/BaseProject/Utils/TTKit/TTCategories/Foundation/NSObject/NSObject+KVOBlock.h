//
//  NSObject+KVOBlock.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TLKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (KVOBlock)

- (void)tt_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(TLKVOBlock)block;

-(void)tt_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

-(void)tt_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(TLKVOBlock)block;

-(void)tt_removeBlockObserverForKeyPath:(NSString *)keyPath;


@end
