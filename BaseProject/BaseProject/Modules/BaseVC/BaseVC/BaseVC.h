//
//  BaseVC.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseVC : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic, strong) CustomNavigationBar *customNavBar;

@property (nonatomic, strong, nullable) UIImageView *noDataNetworkView; /**< 无数据无网络提示 */

@property (nonatomic, strong) MJRefreshNormalHeader *mj_headr; /**< 下拉刷新 */
@property (nonatomic, strong) MJRefreshBackNormalFooter *mj_footer; /**< 上啦刷新 */
@property (nonatomic, strong) UIImageView *noDataView;

@property (nonatomic, strong) NSMutableArray <NSURLSessionDataTask *> *allTask;

@property (nonatomic, copy) NSDictionary *locDict;


/**
 隐藏无数据无网络提示
 */
-(void)dismissNoDataNetworkView;
// 下拉刷新事件，子类重写
-(void)mj_headRefreshAction;
// 上啦刷新事件，子类重写
-(void)mj_footerRefreshAction;
/**
 结束刷新
 */
-(void)endRefresh;

- (void)dismissNoDataView;

- (NSString *)getRequestNo;
- (NSString *)getVersionString;
- (void)getLocation;

@end

NS_ASSUME_NONNULL_END
