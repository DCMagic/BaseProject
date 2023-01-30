//
//  HomeListModel.h
//  BaseProject
//
//  Created by dongchao on 2022/12/14.
//

#import <Foundation/Foundation.h>
#import "HomeBtnModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeListModel : NSObject

@property (nonatomic, copy) NSString *title;    // 名称
@property (nonatomic, copy) NSArray <HomeBtnModel*>*btnList;
@property (nonatomic, copy) NSString *action;   // 方法名称
@property (nonatomic, assign)BOOL isBuild;
@property (nonatomic, strong) NSMutableArray<HomeBtnModel *> *itemList;  //按钮列表


@property (nonatomic, assign) BOOL isShowLine;  // 是否显示line

// 快速构造函数
+ (instancetype)modelWithTitle:(NSString *)title action:(NSString *)action showLine:(BOOL)isShowLine;

// 快速构造函数
+ (instancetype)modelWithTitle:(NSString *)title itemList:(NSArray<HomeBtnModel *> *)itemList;;

+ (instancetype)modelWithTitle:(NSString *)title itemDicArray:(NSArray*)itemDicArray;

@end

NS_ASSUME_NONNULL_END
