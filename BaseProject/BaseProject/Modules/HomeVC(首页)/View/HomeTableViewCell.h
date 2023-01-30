//
//  HomeTableViewCell.h
//  BaseProject
//
//  Created by dongchao on 2022/12/14.
//

#import <UIKit/UIKit.h>
#import "HomeListModel.h"
#import "HomeBtnModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong)NSMutableArray *contentBtnArray;

- (void)loadDataWith:(HomeListModel *)model;

@end

NS_ASSUME_NONNULL_END
