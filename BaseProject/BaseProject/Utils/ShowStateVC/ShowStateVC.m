//
//  ShowStateVC.m
//  BaseProject
//
//  Created by dongchao on 2022/4/25.
//

#import "ShowStateVC.h"

@interface ShowStateVC ()<CAAnimationDelegate>

@property (nonatomic, strong)UITextField *emailTextField;

@property (nonatomic, strong)UIImageView *stateImageView;
@property (nonatomic, strong)UILabel *stateLab;
@property (nonatomic, strong)UIButton *backBtn;

@end

@implementation ShowStateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar setTitle:@"分享"];
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    [self buildView];
    [self showAnimation];
}

- (void)buildView{
    [self.view addSubview:self.stateImageView];
    [self.view addSubview:self.stateLab];
    [self.view addSubview:self.backBtn];
    
    [self.stateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.customNavBar.mas_bottom).offset(Adaptation_6(55));
        make.centerX.equalTo(self.view);
        make.height.width.mas_equalTo(Adaptation_6(142));
    }];
    
    [self.stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.stateImageView.mas_bottom).offset(Adaptation_6(13));
        make.centerX.equalTo(self.view);
    }];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.stateLab.mas_bottom).offset(Adaptation_6(67));
        make.left.equalTo(self.view).offset(Adaptation_6(12));
        make.right.equalTo(self.view).offset(Adaptation_6(-12));
        make.height.mas_equalTo(Adaptation_6(49));
        make.centerX.equalTo(self.view);
    }];
}

- (void)shareSuccess{
    
}

- (void)showAnimation{
    NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:0];
    for(NSInteger i = 1; i < 7; i++){
        UIImage *image;
        image = [UIImage imageNamed:[NSString stringWithFormat:@"success%ld",(long)i]];
        
        CGImageRef cgImage = image.CGImage;
        [imageArr addObject:(__bridge UIImage * _Nonnull)(cgImage)];
    }
    
    // UIImageView 关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    // 动画结束之后的回调
    animation.delegate = self;
    animation.duration = .5;
    animation.repeatCount = 1;
    // 设置animation的唯一标示，这样在delegate回调的时候能够区分开来
    [animation setValue:@"animation1" forKey:@"customType"];
    animation.values = imageArr;
    [self.stateImageView.layer addAnimation:animation forKey:@""];
}

- (void)backToMainPage{
    
}

#pragma mark 懒加载

- (UIImageView *)stateImageView{
    if (!_stateImageView) {
        _stateImageView = [[UIImageView alloc]init];
        [_stateImageView setImage:[UIImage imageNamed:@"success6"]];
    }
    return _stateImageView;
}

- (UILabel *)stateLab{
    if (!_stateLab) {
        _stateLab = createLabel(kPingFangSC_Regular_18, kFF333333);
        _stateLab.textAlignment = NSTextAlignmentCenter;
        _stateLab.text = @"提交成功";
    }
    return _stateLab;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundColor:kFF5065DE];
        [_backBtn setTitleColor:kFFFFFFFF forState:UIControlStateNormal];
        [_backBtn.titleLabel setFont:kPingFangSC_Regular_18];
        _backBtn.layer.cornerRadius = Adaptation_6(4);
        _backBtn.clipsToBounds = YES;
        [_backBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    }
    return _backBtn;
}

@end
