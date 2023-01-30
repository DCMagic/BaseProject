//
//  MainVC.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "MainVC.h"

#import "XJTaskingTableViewCell.h"
#import "TaskModel.h"

#import "MainListModel.h"
#import "MainBtnModel.h"
#import "MainItemClickManager.h"
#import "MainPageRequestManager.h"
#import "SettingViewController.h"
#import "PersonalWorkNumModel.h"
#import "InspectionTaskRequestManager.h"
#import "MainItemClickManager.h"

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong)UITableView  *tableView;
@property (nonatomic, strong)NSMutableArray *executingDataSource;
@property (nonatomic, strong)NSMutableArray *notBeginDataSource;
@property (nonatomic, strong)UIButton *navRightBtn;
@property(nonatomic, strong) NSArray *configArray; // 配置数据

@end

@implementation MainVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)mj_headRefreshAction {
    [super mj_headRefreshAction];
    [self requestData];
}

-(void)mj_footerRefreshAction {
    [super mj_footerRefreshAction];
    [self requestData];
}

- (void)endRefresh{
    [self.mj_headr endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)setNoDataView{
    [self.tableView addSubview:self.noDataView];
    [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(Adaptation_6(150));
        make.height.mas_equalTo(Adaptation_6(136));
        make.center.equalTo(self.tableView);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.customNavBar setTitle:@"巡检"];
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    [self setNavRightBtn];
    UIView *divide = [UIView new];
    divide.backgroundColor = kFFF2F3F5;
    [self.customNavBar addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.customNavBar);
        make.height.mas_equalTo(Adaptation_6(3));
    }];
    
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = self.mj_headr;
    
    self.executingDataSource = [NSMutableArray array];
    self.notBeginDataSource = [NSMutableArray array];
    
    [self requestData];
}

- (void)setNavRightBtn {
    [self.customNavBar addSubview:self.navRightBtn];
    [self.navRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.customNavBar).offset(Adaptation_6(-12));
        make.bottom.equalTo(self.customNavBar);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(Adaptation_6(60));
    }];
}

#pragma mark - 网络数据请求

- (void)requestData {
    
}


#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XJTaskingTableViewCell *cell = [[XJTaskingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kXJTaskingTableViewCell];
    if (indexPath.section == 0) {
        TaskModel *model = self.executingDataSource[indexPath.row];
        model.type = 0;
        [cell loadDataWithModel:model];
    }else {
        TaskModel *model = self.notBeginDataSource[indexPath.row];
        model.type = 1;
        [cell loadDataWithModel:model];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Adaptation_6(47);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return Adaptation_6(0);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = UIColor.whiteColor;
    UILabel *titleLab = createLabel(kPingFangSC_Medium_18, KFF1C2331);
    [headView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView).offset(Adaptation_6(16));
        make.top.equalTo(headView).offset(Adaptation_6(16));
    }];
    titleLab.text = section == 0? @"执行中任务" : @"待开始";
    return headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.executingDataSource.count;
    }else {
        return self.notBeginDataSource.count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar + Adaptation_6(2), PhoneScreen_WIDTH, PhoneScreen_HEIGHT- Height_TabBar  - SAFEAREA_INSETS_BOTTOM - Height_NavBar) style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, SAFEAREA_INSETS_BOTTOM, 0);
        _tableView.backgroundColor = kBackgColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
    }
    return _tableView;
}

- (UIButton *)navRightBtn {
    if (!_navRightBtn) {
        _navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_navRightBtn setTitle:@"任务列表" forState:UIControlStateNormal];
        [_navRightBtn setTitleColor:kFF4E5969 forState:UIControlStateNormal];
        [_navRightBtn.titleLabel setFont:kPingFangSC_Regular_15];
        [_navRightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navRightBtn;
}


@end


