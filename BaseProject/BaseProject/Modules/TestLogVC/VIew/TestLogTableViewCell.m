//
//  TestLogTableViewCell.m
//  BaseProject
//
//  Created by dongchao on 2022/12/30.
//

#import "TestLogTableViewCell.h"

@interface TestLogTableViewCell ()

@property (nonatomic, strong)UILabel *titleLab;

@end

NSString * const kTestLogTableViewCell = @"kTestLogTableViewCell";

@implementation TestLogTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (void)loadDataWithTitle:(NSString *)title{
    self.titleLab.text = title;
}

- (void)buildView{
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = createLabel(kPingFangSC_Regular_14, kFF333333);
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

@end
