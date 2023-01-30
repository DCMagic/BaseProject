//
//  HomeListModel.m
//  BaseProject
//
//  Created by dongchao on 2022/12/14.
//

#import "HomeListModel.h"

@implementation HomeListModel

// 快速构造函数
+ (instancetype)modelWithTitle:(NSString *)title action:(NSString *)action showLine:(BOOL)isShowLine {
    HomeListModel *model = [[HomeListModel alloc] init];
    model.title = title;
    model.action = action;
    model.isShowLine = isShowLine;
    
    return model;
}

+ (instancetype)modelWithTitle:(NSString *)title itemList:(NSArray<HomeBtnModel *> *)itemList{
    HomeListModel *model = [[HomeListModel alloc]init];
    model.title = title;
    model.btnList = [itemList copy];
    return model;
}

+ (instancetype)modelWithTitle:(NSString *)title itemDicArray:(NSArray*)itemDicArray{
    HomeListModel *model = [[HomeListModel alloc]init];
    model.title = title;
    model.itemList = [NSMutableArray array];
    for (NSDictionary *item in itemDicArray) {
        HomeBtnModel *btnModel = [HomeBtnModel yy_modelWithDictionary:item];
        [model.itemList addObject:btnModel];
    }
    
    return model;
}

@end
