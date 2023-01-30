//
//  HeaderView.m
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import "HeaderView.h"

@interface HeaderView ()

@end

@implementation HeaderView

-(instancetype)init{
    if (self = [super init]) {
        [self buildUI];
        [self setBackgroundColor:UIColor.whiteColor];
    }
    return self;
}

- (void)buildUI{
    [self addSubview:self.textLabel];
    [self addSubview:self.headImage];
    [self addSubview:self.moreBtn];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(Adaptation_6(12));
        make.centerY.equalTo(self);
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(Adaptation_6(-12));
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(Adaptation_6(22));
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moreBtn.mas_left).offset(Adaptation_6(-8));
        make.width.height.mas_equalTo(Adaptation_6(60));
        make.centerY.equalTo(self);
    }];
    
    UIView *divide = [[UIView alloc]init];
    [self addSubview:divide];
    [divide setBackgroundColor:kFFF4F5FA];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Adaptation_6(1));
        make.left.right.equalTo(self);
    }];
    [self.moreBtn setHidden:YES];
}

- (void)setHeaderViewWithImage:(NSString *)headerImageString{
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:headerImageString] placeholderImage:[UIImage imageNamed:@"header_bitmap"]];
}

#pragma mark 懒加载
- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = createLabel(kPingFangSC_Regular_15, UIColor.blackColor);
        [_textLabel sizeToFit];
    }
    return _textLabel;
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header_bitmap"]];
        _headImage.layer.cornerRadius = Adaptation_6(30);
        _headImage.clipsToBounds = YES;
    }
    return _headImage;
}

- (UIImageView *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next"]];
        [_moreBtn setUserInteractionEnabled:YES];
    }
    return _moreBtn;
}

@end
