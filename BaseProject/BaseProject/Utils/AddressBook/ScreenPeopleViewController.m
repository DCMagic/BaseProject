//
//  ScreenPeopleViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/3/31.
//

#import "ScreenPeopleViewController.h"

@interface ScreenPeopleViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UIButton *resetBtn;
@property (nonatomic, strong)UIButton *sureBtn;

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation ScreenPeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.title = @"筛选";
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    [self.view setBackgroundColor:kFFF5F5F5];
    
    _dataSource = [NSMutableArray arrayWithArray:@[@"综合监管XX科室",@"综合监管XX科室",@"综合监管XX科室",@"综合监管XX科室",@"综合监管XX科室",@"综合监管XX科室",@"综合监管XX科室"]] ;
    
    
    [self buildView];
}

- (void)buildView{
    UIView *bottomView = [[UIView alloc]init];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = kFFFFFFFF;
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(Adaptation_6(73) + SAFEAREA_INSETS_BOTTOM);
    }];
    
    float item_width = (MainScreen_Width - Adaptation_6(36))/2;
    
    [bottomView addSubview:self.resetBtn];
    [bottomView addSubview:self.sureBtn];
    
    [self.resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView).offset(Adaptation_6(24));
        make.left.equalTo(bottomView).offset(Adaptation_6(12));
        make.bottom.equalTo(bottomView).offset(Adaptation_6(-24));
        make.width.mas_equalTo(item_width);
    }];
    
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView).offset(Adaptation_6(24));
        make.right.equalTo(bottomView).offset(Adaptation_6(-12));
        make.bottom.equalTo(bottomView).offset(Adaptation_6(-24));
        make.width.mas_equalTo(item_width);
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.customNavBar.mas_bottom).offset(Adaptation_6(12));
        make.bottom.equalTo(bottomView.mas_top).offset(Adaptation_6(-12));
    }];
    
}

- (void)reSetBtnClicked:(UIButton *)sender{
    
}

- (void)sureBtnClicked:(UIButton *)sender{
    
}


#pragma mark 懒加载
- (UIButton *)resetBtn{
    if (!_resetBtn) {
        _resetBtn = createButton(kPingFangSC_Regular_18, kFFFFFFFF, self, @selector(reSetBtnClicked:));
        _resetBtn.backgroundColor = kFF5065DE;
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        _resetBtn.layer.cornerRadius = Adaptation_6(4);
        _resetBtn.clipsToBounds = YES;
    }
    return _resetBtn;
}

- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = createButton(kPingFangSC_Regular_18, kFFFFFFFF, self, @selector(reSetBtnClicked:));
        _sureBtn.backgroundColor = kFF5065DE;
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _sureBtn.layer.cornerRadius = Adaptation_6(4);
        _resetBtn.clipsToBounds = YES;
    }
    return _sureBtn;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, MainScreen_Width, MainScreen_Height - Height_NavBar - SAFEAREA_INSETS_BOTTOM - Adaptation_6(73)) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:kFFFFFFFF];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"kdepartmentCollectionCell"];
    }
    return _collectionView;
}

#pragma mark UICollectionViewDelegate
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kdepartmentCollectionCell" forIndexPath:indexPath];
    if (@available(iOS 13.0, *)) {
        [cell setLargeContentTitle:[NSString stringWithFormat:@"%ld", indexPath.row]];
    } else {
        // Fallback on earlier versions
    }
    UILabel *label = createLabel(kPingFangSC_Regular_15, kFF5065DE);
    label.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    [cell addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(cell);
    }];
    cell.backgroundColor = kFFF5F5F5;
    cell.layer.cornerRadius = Adaptation_6(4);
    cell.clipsToBounds = YES;
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark  定义每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dataSource.count == 0) {
//        return CGSizeMake(0, 0);
//    }
    CGFloat width = (PhoneScreen_WIDTH - Adaptation_6(16)*2 - Adaptation_6(47))/2;
    CGFloat height = Adaptation_6(38);
    return CGSizeMake(width, height);
}

#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(Adaptation_6(16), Adaptation_6(16),Adaptation_6(16), Adaptation_6(16));
}

#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return Adaptation_6(47);
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return Adaptation_6(16);
}

@end
