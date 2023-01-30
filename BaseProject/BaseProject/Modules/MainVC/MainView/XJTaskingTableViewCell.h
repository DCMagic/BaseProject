//
//  XJTaskingTableViewCell.h
//  BaseProject
//
//  Created by dongchao on 2022/11/10.
//

#import <UIKit/UIKit.h>
#import "TaskModel.h"

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString * const kXJTaskingTableViewCell;

@interface XJTaskingTableViewCell : UITableViewCell

- (void)loadDataWithModel:(TaskModel *)model;

@end

NS_ASSUME_NONNULL_END
