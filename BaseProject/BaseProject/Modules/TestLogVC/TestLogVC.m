//
//  TestLogVC.m
//  BaseProject
//
//  Created by dongchao on 2022/12/30.
//

#import "TestLogVC.h"
#import "TestLogTableViewCell.h"
#import "LogDetailVC.h"
#import "TestLog2VC.h"

@interface TestLogVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation TestLogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar setTitle:@"请求日志"];
    [self.customNavBar tt_setTintColor:kFF333333];
    [self.view addSubview:self.tableView];
    [self requestData];
}

- (void)requestData {
    self.dataSource = [NSMutableArray array];
    if (self.logList.count) {
        [self.dataSource addObjectsFromArray:self.logList];
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestLogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestLogTableViewCell forIndexPath:indexPath];
    if(self.dataSource.count) {
        NSString *str = [NSString stringWithFormat:@"%@ --- %@",((NSDictionary *)self.dataSource[indexPath.row])[@"time"],((NSDictionary *)self.dataSource[indexPath.row])[@"state"]];
        [cell loadDataWithTitle:str];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestLog2VC *vc = [[TestLog2VC alloc]init];
    vc.dict = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar, PhoneScreen_WIDTH, PhoneScreen_HEIGHT - Height_NavBar - SAFEAREA_INSETS_BOTTOM) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.layer.cornerRadius = Adaptation_6(8);
        _tableView.clipsToBounds = YES;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
        _tableView.backgroundColor = UIColor.clearColor;
        
        [_tableView registerClass:[TestLogTableViewCell class] forCellReuseIdentifier:kTestLogTableViewCell];
    }
    return _tableView;
}

@end
