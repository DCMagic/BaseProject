//
//  AddressBookTableViewCell.m
//  BaseProject
//
//  Created by dongchao on 2022/3/31.
//

#import "AddressBookTableViewCell.h"

@interface AddressBookTableViewCell ()

@property (nonatomic, strong)UILabel *nameLab;
@property (nonatomic, strong)UILabel *subTitleLab;
@property (nonatomic, strong)UILabel *numLab;

@end

NSString * const kAddressBookTableViewCell = @"kAddressBookTableViewCell";

@implementation AddressBookTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (void)buildView{
    
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.subTitleLab];
    [self.contentView addSubview:self.numLab];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(Adaptation_6(20));
        make.top.equalTo(self.contentView).offset(Adaptation_6(12));
        make.right.equalTo(self.contentView).offset(Adaptation_6(-20));
    }];
    
    [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameLab);
        make.bottom.equalTo(self.contentView).offset(Adaptation_6(-12));
        
    }];
    
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(Adaptation_6(-20));
        make.bottom.equalTo(self.subTitleLab);
    }];
    
}

- (void)loadData{
    self.nameLab.text = @"";
    self.subTitleLab.text = @"";
    self.numLab.text = @"";
}

#pragma mark 懒加载
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = createLabel(kPingFangSC_Regular_17, kFF333333);
        _nameLab.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLab;
}

- (UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = createLabel(kPingFangSC_Regular_15, kFF999999);
        _subTitleLab.textAlignment = NSTextAlignmentLeft;
    }
    return _subTitleLab;
}

- (UILabel *)numLab{
    if (!_numLab) {
        _numLab = createLabel(kPingFangSC_Regular_15, kFF999999);
        _numLab.textAlignment = NSTextAlignmentRight;
    }
    return _numLab;
}

@end
