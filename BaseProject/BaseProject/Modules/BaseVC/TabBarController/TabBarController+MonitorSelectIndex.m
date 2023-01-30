//
//  TabBarController+MonitorSelectIndex.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/4/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "TabBarController+MonitorSelectIndex.h"
#import <objc/message.h>

@implementation TabBarController (MonitorSelectIndex)

+ (void)load{
    
    Method originalMethod =class_getInstanceMethod(self,@selector(setSelectedIndex:));
    
    Method swizzledMethod =class_getInstanceMethod(self,@selector(newSetSelectedIndex:));
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}

- (void)newSetSelectedIndex:(NSInteger)index{
    
    if(index >=self.childViewControllers.count|| index <0) {
        return;
    }
    
    if(self.delegate==nil) {
        //如果没有代理，直接调用修改index的方法
        [self willChangeValueForKey:@"selectedViewController"];
        
        [self newSetSelectedIndex:index];
        
        [self didChangeValueForKey:@"selectedViewController"];
        
    }else{
        
        //即将被选中的controller
        UIViewController *willBeSelectController = self.childViewControllers[index];
        
        //如果可以被选中，则继续下一步操作
        if([self canSelectController:willBeSelectController]) {
            
            //手动发送将修改通知
            [self willChangeValueForKey:@"selectedViewController"];
            
            //修改index
            [self newSetSelectedIndex:index];
            
            //如果delegate实现了这个代理方法，调用该代理方法
            if([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
                
                [self.delegate tabBarController:self didSelectViewController:willBeSelectController];
                
            }
            
            //发送已经修改内容通知
            [self didChangeValueForKey:@"selectedViewController"];
            
        }
        
    }
    
}

/**
 判断即将被选中的controller是否可以被选中

 @param willBeSelectController 即将被选中的controller
 @return 是否可以被选中
 */
- (BOOL)canSelectController:(UIViewController*)willBeSelectController{
    
    //如果delegate实现了判断是否可选中的方法，用代理的方法判断
    if([self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) {
        
        return[self.delegate tabBarController:self shouldSelectViewController:willBeSelectController];
        
    }else{
        
        //如果delegate没有实现是否允许选中controller的方法，则默认为可以选中
        return YES;
        
    }
}

@end
