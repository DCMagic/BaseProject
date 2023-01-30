//
//  ClickView.m
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import "ClickView.h"

@implementation ClickView

-(instancetype)init{
    if (self = [super init]) {
        [self buildUI];
        [self setBackgroundColor:UIColor.whiteColor];
    }
    return self;
}

- (void)buildUI{
    [self addSubview:self.textLabel];
    [self addSubview:self.moreImage];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(Adaptation_6(12));
        make.centerY.equalTo(self);
    }];
    
    [self.moreImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(Adaptation_6(-12));
        make.width.height.mas_equalTo(Adaptation_6(18));
        make.centerY.equalTo(self);
    }];
    
    UIView *divide = [[UIView alloc]init];
    [self addSubview:divide];
    [divide setBackgroundColor:kFFF4F5FA];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Adaptation_6(1));
        make.left.right.equalTo(self);
    }];
}

- (void)setClickViewWithText:(NSString *)text{
    self.textLabel.text = text;
}

#pragma mark 懒加载
- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = createLabel(kPingFangSC_Regular_15, UIColor.blackColor);
        [_textLabel setTextAlignment:NSTextAlignmentLeft];
    }
    return _textLabel;
}

- (UIImageView *)moreImage{
    if (!_moreImage) {
        _moreImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next"]];
        
    }
    return _moreImage;
}

@end
