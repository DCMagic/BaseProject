//
//  ScreenPeopleViewController.h
//  BaseProject
//
//  Created by dongchao on 2022/3/31.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

typedef (^SelectedDepartmentBlock) (NSInteger index);

@interface ScreenPeopleViewController : BaseVC

@property (nonatomic, copy)SelectedDepartmentBlock selectedDepartmentBlock;

@end

NS_ASSUME_NONNULL_END
