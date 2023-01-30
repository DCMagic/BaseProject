//
//  SettingViewController.h
//  BaseProject
//
//  Created by dongchao on 2022/3/23.
//

#import "BaseVC.h"
#import "HeaderView.h"
#import "ShowView.h"
#import "ClickView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ChooseImage)(UIImage *image);
typedef void (^ChooseImages)(NSMutableArray<UIImage *> *imageList);
typedef void (^ChooseVideo)(NSData *player);

@interface SettingViewController : BaseVC

@end

NS_ASSUME_NONNULL_END
