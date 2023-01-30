//
//  HomeVC.m
//  BaseProject
//
//  Created by dongchao on 2022/12/14.
//

#import "HomeVC.h"
#import "HomeTableViewCell.h"
#import "HomeBtnModel.h"
#import "BaseWebVC.h"

@interface HomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic, strong)NSMutableArray *btnsList;
@property(nonatomic, strong)NSMutableArray *itemsList;
@property(nonatomic, strong)NSMutableArray *btnCodeList;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar setTitle:@"首页"];
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    [self setItems];
    [self getButtonPermissions];
    [self buildView];
}

- (void)getButtonPermissions{
    self.btnCodeList = [NSMutableArray array];
    [self.btnCodeList removeAllObjects];
    PBUserInfo *a = [PBUserInfo userInfoFromSandbox];
    [self.btnCodeList addObjectsFromArray:a.buttonCodeList];
    NSMutableArray *arr = [NSMutableArray array];
    for (HomeBtnModel *bnModel in self.itemsList) {
        if ([self.btnCodeList containsObject:bnModel.btnCode]){
            [arr addObject:bnModel];
        }
    }
    self.itemsList = arr;
    
    NSMutableArray *arr01 = [NSMutableArray array];
    for (HomeBtnModel *bnModel in ((HomeListModel *)self.btnsList[0]).btnList) {
        if ([self.btnCodeList containsObject:bnModel.btnCode]){
            [arr01 addObject:bnModel];
        }
    }
    ((HomeListModel *)self.btnsList[0]).btnList = arr01;
    
    NSMutableArray *arr02 = [NSMutableArray array];
    for (HomeBtnModel *bnModel in ((HomeListModel *)self.btnsList[1]).btnList) {
        if ([self.btnCodeList containsObject:bnModel.btnCode]){
            [arr02 addObject:bnModel];
        }
    }
    ((HomeListModel *)self.btnsList[1]).btnList = arr02;
}

- (void)setItems{
    self.btnsList = [NSMutableArray array];
    NSArray *arr01 = [NSArray yy_modelArrayWithClass:[HomeBtnModel class] json:
    @[@{
        @"image": @"normal_pole_item",
        @"title": @"普通杆管理",
        @"vcName": @"OrdinaryPoleVC",
        @"btnCode": @".12.4.1"
    },@{
        @"image": @"intelligence_pole_item",
        @"title": @"多功能综合杆管理",
        @"vcName": @"MutifunctionPoleVC",
        @"btnCode": @".12.4.2"
    },@{
        @"image": @"intelligence_box_item",
        @"title": @"智慧综合箱管理",
        @"vcName": @"IntelligentBoxVC",
        @"btnCode": @".12.4.3"
    }]];
    HomeListModel *model01 = [HomeListModel modelWithTitle:@"资产管理中心" itemList:arr01];
    NSArray *arr02 = [NSArray yy_modelArrayWithClass:[HomeBtnModel class] json:
    @[@{
        @"image": @"intelligence_box_control",
        @"title": @"智能箱控",
        @"vcName": @"IntelligenceBoxManageVC",
        @"btnCode": @".12.5.1"
    },@{
        @"image": @"intelligence_power",
        @"title": @"智能分压电源",
        @"vcName": @"IntelligencePowerControlVC",
        @"btnCode": @".12.5.2"
    },@{
        @"image": @"intelligence_gateway",
        @"title": @"智慧综合网关",
        @"vcName": @"IntelligenceGatewayVC",
        @"btnCode": @".12.5.3"
    }]];
    HomeListModel *model02 = [HomeListModel modelWithTitle:@"资产监控中心" itemList:arr02];
    [self.btnsList addObject:model01];
    [self.btnsList addObject:model02];
    
    self.itemsList = [NSMutableArray array];
    NSArray *arr03 = [NSArray yy_modelArrayWithClass:[HomeBtnModel class] json:
    @[@{
        @"image": @"group_01",
        @"title": @"贴牌管理",
        @"vcName": @"IntelligenceBoxManageVC",
        @"btnCode": @".12.3.1",
        @"linkUrl":@"1"
    },@{
        @"image": @"group_02",
        @"title": @"设备标签更换",
        @"vcName": @"IntelligencePowerControlVC",
        @"btnCode": @".12.3.2",
        @"linkUrl":@"2"
    },@{
        @"image": @"group_03",
        @"title": @"防水改造拍照",
        @"vcName": @"IntelligenceGatewayVC",
        @"btnCode": @".12.3.3",
        @"linkUrl":@"3"
    },@{
        @"image": @"group_04",
        @"title": @"设备摸排拍照",
        @"vcName": @"IntelligenceGatewayVC",
        @"btnCode": @".12.3.4",
        @"linkUrl":@"4"
    },@{
        @"image": @"group_05",
        @"title": @"杆体整体拆除",
        @"vcName": @"IntelligenceGatewayVC",
        @"btnCode": @".12.3.5",
        @"linkUrl":@"5"
    },@{
        @"image": @"group_06",
        @"title": @"挂载设备管理",
        @"vcName": @"IntelligenceGatewayVC",
        @"btnCode": @".12.3.6",
        @"linkUrl":@"6"
    }]];
    [self.itemsList addObjectsFromArray:arr03];
    
}

- (void)buildView {
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [[HomeTableViewCell alloc]init];
    HomeListModel *model = self.btnsList[indexPath.row];
    [cell loadDataWith:model];
    
    for (int i = 0; i < model.btnList.count; i++) {
        Class cls = NSClassFromString(model.btnList[i].vcName);
        UIButton *btn = cell.contentBtnArray[i];
        [btn tt_touchUpInside:^(id sender) {
            UIViewController *vc = [[cls alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return section == 0?Adaptation_6(320): Adaptation_6(47);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return Adaptation_6(0);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *headerView = [[UIView alloc]init];
        headerView.backgroundColor = kFFFFFFFF;
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = kFFF8F9FF;
        [headerView addSubview:bgView];
        UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo5"]];
        [bgView addSubview:logo];
        UILabel *cm = createLabel(kPingFangSC_Semibold_24, KFF1C2331);
        UILabel *cf = createLabel(kPingFangSC_Semibold_15, KFF86909C);
        cm.textAlignment = NSTextAlignmentRight;
        cf.textAlignment = NSTextAlignmentRight;
        cm.text = @"常用功能";
        cf.text = @"Common functions";
        [bgView addSubview:cm];
        [bgView addSubview:cf];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(headerView).insets(UIEdgeInsetsMake(Adaptation_6(27), Adaptation_6(16), Adaptation_6(12), Adaptation_6(16)));
        }];
        
        [logo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headerView);
            make.left.equalTo(bgView);
            make.width.height.mas_equalTo(Adaptation_6(138));
        }];
        
        [cm mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView).offset(Adaptation_6(22.5));
            make.right.equalTo(bgView).offset(Adaptation_6(-17.5));
        }];
        
        [cf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cm.mas_bottom);
            make.right.equalTo(bgView).offset(Adaptation_6(-17.5));
        }];
        
        for (int i = 0; i < self.itemsList.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [bgView addSubview:btn];
            UIImageView *btnImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:((HomeBtnModel *)self.itemsList[i]).image]];
            UILabel *lab = createLabel(kPingFangSC_Regular_13, KFF1C2331);
            [btn addSubview:btnImg];
            [btn addSubview:lab];
            [btnImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(btn);
                make.top.equalTo(btn);
                make.width.mas_equalTo(Adaptation_6(35.5));
                make.height.mas_equalTo(Adaptation_6(35.5));
            }];
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(btn);
            }];
            lab.text = ((HomeBtnModel *)self.itemsList[i]).title;
            lab.textAlignment = NSTextAlignmentCenter;
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo((PhoneScreen_WIDTH - Adaptation_6(24))/3);
                make.height.mas_equalTo(Adaptation_6(60));
                if (i == 0) {
                    make.left.equalTo(bgView);
                    make.top.equalTo(logo.mas_bottom);
                }else if (i == 1) {
                    make.centerX.equalTo(bgView);
                    make.top.equalTo(logo.mas_bottom);
                }else if (i == 2) {
                    make.right.equalTo(bgView);
                    make.top.equalTo(logo.mas_bottom);
                }else if (i == 3) {
                    make.left.equalTo(bgView);
                    make.top.equalTo(logo.mas_bottom).offset(Adaptation_6(76));
                }else if (i == 4) {
                    make.centerX.equalTo(bgView);
                    make.top.equalTo(logo.mas_bottom).offset(Adaptation_6(76));
                }else if (i == 5) {
                    make.right.equalTo(bgView);
                    make.top.equalTo(logo.mas_bottom).offset(Adaptation_6(76));
                }
            }];
            [btn tt_touchUpInside:^(id sender) {
                BaseWebVC *webVc = [[BaseWebVC alloc]init];
                webVc.type = ((HomeBtnModel *)self.itemsList[i]).linkUrl;
                [self.navigationController pushViewController:webVc animated:YES];
            }];
            
        }
        
        return headerView;
    }
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = UIColor.whiteColor;
    UILabel *titleLab = createLabel(kPingFangSC_Medium_18, KFF1C2331);
    [headView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView).offset(Adaptation_6(16));
        make.top.equalTo(headView).offset(Adaptation_6(16));
    }];
    titleLab.text = @"我的工单";
    return headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0?2:0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar + Adaptation_6(2), PhoneScreen_WIDTH, PhoneScreen_HEIGHT- Height_TabBar - Height_NavBar) style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
@end
