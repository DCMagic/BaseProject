//
//  MainListModel.m
//  BaseProject
//
//  Created by dongchao on 2022/3/23.
//

#import "MainListModel.h"

@implementation MainListModel

// 快速构造函数
+ (instancetype)modelWithTitle:(NSString *)title action:(NSString *)action showLine:(BOOL)isShowLine {
    MainListModel *model = [[MainListModel alloc] init];
    model.title = title;
    model.action = action;
    model.isShowLine = isShowLine;
    
    return model;
}

+ (instancetype)modelWithTitle:(NSString *)title itemList:(NSArray<MainBtnModel *> *)itemList{
    MainListModel *model = [[MainListModel alloc]init];
    model.title = title;
    
    return model;
}

+ (instancetype)modelWithTitle:(NSString *)title itemDicArray:(NSArray*)itemDicArray{
    MainListModel *model = [[MainListModel alloc]init];
    model.title = title;
    model.itemList = [NSMutableArray array];
    for (NSDictionary *item in itemDicArray) {
        MainBtnModel *btnModel = [MainBtnModel yy_modelWithDictionary:item];
        [model.itemList addObject:btnModel];
    }
    
    return model;
}

@end
