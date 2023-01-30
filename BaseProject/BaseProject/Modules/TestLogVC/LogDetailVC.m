//
//  LogDetailVC.m
//  BaseProject
//
//  Created by dongchao on 2022/12/30.
//

#import "LogDetailVC.h"

@interface LogDetailVC ()

@property (nonatomic, strong)UIScrollView *scollView;
@property (nonatomic, strong)UILabel *lab;

@end

@implementation LogDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar setTitle:@"请求日志"];
    [self.customNavBar tt_setTintColor:kFF333333];
    [self buildView];
}

- (void)buildView{
    [self.view addSubview:self.scollView];
    [self.scollView addSubview:self.lab];
    
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.scollView);
    }];
    // dic 为初始字典
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.dict options:NSJSONWritingPrettyPrinted error:nil];
    // json 为 转换后的 字符串
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    self.lab.text = json;
    [self.scollView setContentSize:CGSizeMake(PhoneScreen_WIDTH, self.lab.height)];
}

- (UIScrollView *)scollView{
    if (!_scollView) {
        _scollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, Height_NavBar, PhoneScreen_WIDTH, PhoneScreen_HEIGHT)];
    }
    return _scollView;
}

- (UILabel *)lab{
    if (!_lab) {
        _lab = createLabel(kPingFangSC_Regular_14, kFF333333);
        _lab.numberOfLines = 0;
    }
    return _lab;
}

@end
