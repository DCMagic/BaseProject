//
//  ErrorPrintResultVC.m
//  jingcaiyuanyu
//
//  Created by dongchao on 2018/9/13.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import "ErrorPrintResultVC.h"

@interface ErrorPrintResultVC ()

@property (nonatomic, strong) UILabel *resultLab; /**< 扫描结果 */

@end

@implementation ErrorPrintResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫描结果";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(Adaptation_6(20));
        make.left.equalTo(self.view).offset(Adaptation_6(16));
        make.right.equalTo(self.view).offset(Adaptation_6(-16));
    }];
    _resultLab.text = _resultStr;
}

-(UILabel *)resultLab{
    if (!_resultLab) {
        _resultLab = [[UILabel alloc] init];
        _resultLab.textColor = [UIColor blackColor];
        _resultLab.textAlignment = NSTextAlignmentLeft;
        _resultLab.font = [UIFont fontWithName:kPingFangSC_Regular size:16];
    }
    return _resultLab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
