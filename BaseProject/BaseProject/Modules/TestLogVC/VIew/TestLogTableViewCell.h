//
//  TestLogTableViewCell.h
//  BaseProject
//
//  Created by dongchao on 2022/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString * const kTestLogTableViewCell;

@interface TestLogTableViewCell : UITableViewCell

- (void)loadDataWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
