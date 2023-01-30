//
//  AboutVC.m
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import "AboutVC.h"

@interface AboutVC ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *versionLabel;

@end

@implementation AboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.title = @"关于";
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    
    [self buildUI];
    [self loadData];
}

- (void)buildUI{
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.versionLabel];
    
    UIView *divide = [[UIView alloc]init];
    divide.backgroundColor = kFFDDDDDD;
    [self.view addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.customNavBar.mas_bottom);
        make.height.mas_equalTo(Adaptation_6(0.5));
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(Adaptation_6(64));
//        make.right.equalTo(self.view).offset(Adaptation_6(-64));
        make.top.equalTo(self.customNavBar.mas_bottom).offset(Adaptation_6(76));
        make.centerX.equalTo(self.view);
        make.height.width.mas_equalTo(Adaptation_6(82));
    }];
    
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.imageView.mas_bottom).offset(Adaptation_6(31));
    }];
}

- (void)loadData{
    [self.imageView setImage:[UIImage imageNamed:@"aboutlogo"]];
    self.versionLabel.text = @"综合监管 Version 1.0.0";
}

#pragma mark 懒加载
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        
    }
    return _imageView;
}

- (UILabel *)versionLabel{
    if (!_versionLabel) {
        _versionLabel = createLabel(kPingFangSC_Semibold_26, UIColor.blackColor);
        _versionLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _versionLabel;
}

@end
