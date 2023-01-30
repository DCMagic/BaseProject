//
//  TestLog2VC.m
//  BaseProject
//
//  Created by dongchao on 2022/12/30.
//

#import "TestLog2VC.h"
#import "TestLogTableViewCell.h"
#import "LogDetailVC.h"

@interface TestLog2VC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation TestLog2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar setTitle:@"请求日志"];
    [self.customNavBar tt_setTintColor:kFF333333];
    [self.view addSubview:self.tableView];
    [self requestData];
}

- (void)requestData {
    self.dataSource = [NSMutableArray array];
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestLogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestLogTableViewCell forIndexPath:indexPath];
    // dic 为初始字典
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.dict options:NSJSONWritingPrettyPrinted error:nil];
    // json 为 转换后的 字符串
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    [cell loadDataWithTitle:json];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
