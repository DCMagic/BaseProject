//
//  NSObject+data.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

@import Foundation;

/**
 给所有对象添加data运行时属性
 给一个view赋值data 只需要在view的.m文件中重写dataDidChange方法取得self.data即可进行界面赋值 有点mvvm的感觉
 */
@interface NSObject (data)

@property (nonatomic, strong) id data;

- (void)dataWillChange;

- (void)dataDidChange;

@end
