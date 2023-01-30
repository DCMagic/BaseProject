//
//  HomeTableViewCell.m
//  BaseProject
//
//  Created by dongchao on 2022/12/14.
//

#import "HomeTableViewCell.h"
#import "MainItemClickManager.h"

@interface HomeTableViewCell ()

@property (nonatomic, strong)UILabel *titleLab;
@property (nonatomic, strong)UIView *itemsView;

@property (nonatomic, strong)UIButton *item01;
@property (nonatomic, strong)UIButton *item02;
@property (nonatomic, strong)UIButton *item03;

@end

NSString * const kHomeTableViewCell = @"kHomeTableViewCell";

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (void)buildView{
    self.contentBtnArray = [NSMutableArray array];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.itemsView];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(Adaptation_6(12));
        make.left.equalTo(self.contentView).offset(Adaptation_6(16));
        make.right.equalTo(self.contentView).offset(Adaptation_6(-16));
    }];
    
    [self.itemsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(Adaptation_6(12));
        make.left.equalTo(self.contentView).offset(Adaptation_6(16));
        make.right.equalTo(self.contentView).offset(Adaptation_6(-16));
        make.bottom.equalTo(self.contentView).offset(Adaptation_6(-12));
        make.height.mas_equalTo(Adaptation_6(80));
    }];
    
    [self.itemsView addSubview:self.item01];
    [self.itemsView addSubview:self.item02];
    [self.itemsView addSubview:self.item03];
    [self.item01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.itemsView).offset(Adaptation_6(12));
        make.top.equalTo(self.itemsView).offset(Adaptation_6(9));
        make.bottom.equalTo(self.itemsView).offset(Adaptation_6(-9));
        make.width.mas_equalTo(Adaptation_6(90));
    }];
    
    [self.item02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.itemsView);
        make.top.equalTo(self.itemsView).offset(Adaptation_6(9));
        make.bottom.equalTo(self.itemsView).offset(Adaptation_6(-9));
        make.width.mas_equalTo(Adaptation_6(90));
    }];
    
    [self.item03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.itemsView).offset(Adaptation_6(-12));
        make.top.equalTo(self.itemsView).offset(Adaptation_6(9));
        make.bottom.equalTo(self.itemsView).offset(Adaptation_6(-9));
        make.width.mas_equalTo(Adaptation_6(90));
    }];
    [self.contentBtnArray addObjectsFromArray:@[self.item01,self.item02,self.item03]];
}

- (void)loadDataWith:(HomeListModel *)model{
    if (model) {
        self.titleLab.text = model.title;
        for (int i = 0; i < model.btnList.count; i++) {
            HomeBtnModel *btnModel = model.btnList[i];
            UIButton *btn = self.contentBtnArray[i];
            UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:btnModel.image]];
            UILabel *lab = createLabel(kPingFangSC_Regular_13, KFF1C2331);
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text = btnModel.title;
            [btn addSubview:imgView];
            [btn addSubview:lab];
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(btn);
                make.top.equalTo(btn).offset(Adaptation_6(7));
                make.width.height.mas_equalTo(Adaptation_6(26));
            }];
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(btn);
                make.bottom.equalTo(btn);
            }];
//            [btn tt_touchUpInside:^(id sender) {
//                UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//                if ([rootVC isKindOfClass:NSClassFromString(@"HomeVC")]) {
//                    [MainItemClickManager jumpDetailVCWith:(UINavigationController *)rootVC vcName:btnModel.vcName];
//                }
//                
//            }];
        }
    }
}


#pragma mark 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = createLabel(kPingFangSC_Regular_18, KFF1C2331);
    }
    return _titleLab;
}

- (UIView *)itemsView {
    if (!_itemsView) {
        _itemsView = [[UIView alloc]init];
        _itemsView.layer.cornerRadius = Adaptation_6(4);
        _itemsView.layer.borderColor = KFFE5E6EB.CGColor;
        _itemsView.backgroundColor = kFFF8F9FF;
        _itemsView.layer.borderWidth = Adaptation_6(1);
        _itemsView.clipsToBounds = YES;
    }
    return _itemsView;
}

- (UIButton *)item01{
    if (!_item01) {
        _item01 = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _item01;
}

- (UIButton *)item02{
    if (!_item02) {
        _item02 = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _item02;
}

- (UIButton *)item03{
    if (!_item03) {
        _item03 = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _item03;
}

@end
