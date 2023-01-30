//
//  BaseVC.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "BaseVC.h"

@interface BaseVC ()<UINavigationControllerDelegate>

@property (nonatomic, strong)UIScreenEdgePanGestureRecognizer *popRecognizer;

@end

@implementation BaseVC

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.allTask = [NSMutableArray array];
    if (self.popRecognizer) {
        //拿到navigationController原有的pop手势
        UIGestureRecognizer *gesture = self.navigationController.interactivePopGestureRecognizer;
        //拿到手势的view
        UIView *gestureView = gesture.view;
        [gestureView removeGestureRecognizer:self.popRecognizer];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.customNavBar];
    if (self.navigationController.childViewControllers.count != 1) {
        self.customNavBar.isShowBack = YES;
    }
    
    if (@available(iOS 11.0, *)) {
        //scrollerView在导航栏透明时不下压
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

-(void)addTaskWith :(NSURLSessionDataTask *)newTask{
    for (int i = 0; i<self.allTask.count; i++) {
        NSURLSessionDataTask *oldTask = self.allTask[i];
        if ([oldTask.currentRequest.URL.absoluteString isEqualToString:newTask.currentRequest.URL.absoluteString]) {
            [oldTask cancel];
            [self.allTask removeObject:oldTask];
        }
    }
    [self.allTask addObject:newTask];
}

-(void)removeTask{
    for (NSURLSessionDataTask *task in self.allTask) {
        [task cancel];
    }
}

- (void)dismissNoDataView{
    if (self.noDataView) {
        [self.noDataView removeFromSuperview];
    }
}

-(void)dismissNoDataNetworkView {
    if (self.noDataNetworkView) {
        [self.view sendSubviewToBack:self.noDataNetworkView];
        [self.noDataNetworkView removeFromSuperview];
        self.noDataNetworkView = nil;
    }
}

// 结束刷新
-(void)endRefresh{
    [self.mj_headr endRefreshing];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if (self.mj_headr.isRefreshing) {
//            [self.mj_headr endRefreshing];
//        }
//        if (self.mj_footer.isRefreshing) {
//            [self.mj_footer endRefreshing];
//        }
//    });
}

// 下拉刷新事件，子类重写
-(void)mj_headRefreshAction {
    
}

// 上啦刷新事件，子类重写
-(void)mj_footerRefreshAction {
    
}

-(MJRefreshNormalHeader *)mj_headr{
    if (!_mj_headr) {
        _mj_headr = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(mj_headRefreshAction)];
    }
    return _mj_headr;
}

-(MJRefreshBackNormalFooter *)mj_footer{
    if (!_mj_footer) {
        _mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(mj_footerRefreshAction)];
    }
    return _mj_footer;
}

- (CustomNavigationBar *)customNavBar {
    if (_customNavBar == nil) {
        _customNavBar = [CustomNavigationBar CustomNavigationBar];
        //_customNavBar.barBackgroundImage = [UIImage imageNamed:@"home_header_bg"];
        [_customNavBar tt_setTintColor:UIColor.whiteColor];
    }
    return _customNavBar;
}

- (UIImageView *)noDataView{
    if (!_noDataView) {
        _noDataView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nodata"]];
    }
    return _noDataView;
}

#pragma mark - 获取接口requestNo
- (NSString *)getRequestNo {
    //获取当前时间戳
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeSp = [NSString stringWithFormat:@"%.0f", time];
    
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));

    NSString *requestNoStr = [NSString stringWithFormat:@"%@-%@",timeSp,result];
    return requestNoStr;
}

- (NSString *)getVersionString {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
