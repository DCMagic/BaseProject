//
//  ShowView.m
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import "ShowView.h"

@implementation ShowView

-(instancetype)init{
    if (self = [super init]) {
        [self buildUI];
        [self setBackgroundColor:UIColor.whiteColor];
    }
    return self;
}

- (void)buildUI{
    [self addSubview:self.textLabel];
    [self addSubview:self.content];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(Adaptation_6(12));
        make.centerY.equalTo(self);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(Adaptation_6(-12));
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
- (void)setShowViewWithText:(NSString *)text content:(NSString *)content{
    self.textLabel.text = text;
    self.content.text = content;
}

#pragma mark 懒加载
- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = createLabel(kPingFangSC_Regular_15, UIColor.blackColor);
        [_textLabel setTextAlignment:NSTextAlignmentLeft];
    }
    return _textLabel;
}

- (UILabel *)content{
    if (!_content) {
        _content = createLabel(kPingFangSC_Regular_15, kFFAEB3C2);
        [_content setTextAlignment:NSTextAlignmentRight];
        [_content sizeToFit];
    }
    return _content;
}

@end
