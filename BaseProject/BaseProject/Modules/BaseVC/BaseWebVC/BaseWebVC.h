//
//  BaseWebVC.h
//  BaseProject
//
//  Created by dongchao on 2022/4/13.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebVC : BaseVC

@property (nonatomic, copy)NSString *urlStr;

@property (nonatomic, copy)NSString *type;

- (void)setTitleLabTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
