//
//  AddressBookViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/3/31.
//

#import "AddressBookViewController.h"
#import "AddressBookTableViewCell.h"
#import "ChineseString.h"
#import "ScreenPeopleViewController.h"

@interface AddressBookViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSMutableArray *indexArray;

@property (nonatomic, strong) UILabel *sectionTitleView;
@property (nonatomic, strong)NSMutableArray *letterResultArr;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong)UIButton *screenBtn;
@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _dataSource = [NSMutableArray array];
    self.customNavBar.title = @"添加检查人";
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    [self.view addSubview:self.tableView];
    
    self.sectionTitleView = ({
            UILabel *sectionTitleView = [[UILabel alloc] initWithFrame:CGRectMake((MainScreen_Width-100)/2, (MainScreen_Height-100)/2,100,100)];
            sectionTitleView.textAlignment = NSTextAlignmentCenter;
            sectionTitleView.font = [UIFont boldSystemFontOfSize:60];
            sectionTitleView.textColor = [UIColor blueColor];
            sectionTitleView.backgroundColor = [UIColor whiteColor];
            sectionTitleView.layer.cornerRadius = 6;
            sectionTitleView.layer.borderWidth = 1.f/[UIScreen mainScreen].scale;
            _sectionTitleView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        sectionTitleView;
    });
    
    NSArray *stringsToSort = [NSArray arrayWithObjects:
                              @"￥hhh, .$",@" ￥Chin ese ",@"开源中国 ",@"www.oschina.net",
                              @"开源技术",@"社区",@"开发者",@"传播",
                              @"2014",@"a1",@"100",@"中国",@"暑假作业",
                              @"键盘", @"鼠标",@"hello",@"world",@"b1",
                              nil];
    self.indexArray = [ChineseString IndexArray:stringsToSort];
    self.letterResultArr = [ChineseString LetterSortArray:stringsToSort];
    
    [self.customNavBar addSubview:self.screenBtn];
    [self.screenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Adaptation_6(44));
        make.right.bottom.equalTo(self.customNavBar);
        make.width.mas_equalTo(Adaptation_6(54));
    }];
}

- (void)screenBtnClicked:(UIButton *)sender{
    ScreenPeopleViewController *screenVC = [[ScreenPeopleViewController alloc]init];
    [self.navigationController pushViewController:screenVC animated:YES];
}

#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [UILabel new];
    lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lab.text = [self.indexArray objectAtIndex:section];
    lab.textColor = [UIColor whiteColor];
    return lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"---->%@",[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]);
//
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
//                                                    message:[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
//                                                   delegate:nil
//                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
//    [alert show];
}

#pragma mark - UITableViewDataSource

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.indexArray;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [self.indexArray objectAtIndex:section];
    return key;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.indexArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.letterResultArr objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAddressBookTableViewCell];
    cell.textLabel.text = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [self showSectionTitle:title];
    return index;
}

#pragma mark - private
- (void)timerHandler:(NSTimer *)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.3 animations:^{
            self.sectionTitleView.alpha = 0;
        } completion:^(BOOL finished) {
            self.sectionTitleView.hidden = YES;
        }];
    });
}

-(void)showSectionTitle:(NSString*)title{
    [self.sectionTitleView setText:title];
    self.sectionTitleView.hidden = NO;
    self.sectionTitleView.alpha = 1;
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar, PhoneScreen_WIDTH, PhoneScreen_HEIGHT- Height_NavBar - SAFEAREA_INSETS_BOTTOM)];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.backgroundColor = kBackgColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[AddressBookTableViewCell class] forCellReuseIdentifier:kAddressBookTableViewCell];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
    }
    return _tableView;
}

- (UIButton *)screenBtn{
    if (!_screenBtn) {
        _screenBtn = createButton(kPingFangSC_Regular_15, kFF5065DE, self, @selector(screenBtnClicked:));
        [_screenBtn setTitle:@"筛选" forState:UIControlStateNormal];
    }
    return _screenBtn;
}

@end
