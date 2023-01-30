//
//  XJTaskingTableViewCell.m
//  BaseProject
//
//  Created by dongchao on 2022/11/10.
//

#import "XJTaskingTableViewCell.h"


@interface XJTaskingTableViewCell ()

@property (nonatomic, strong)UIView *outCardBgView;
@property (nonatomic, strong)UIView *cardBgView;

@property (nonatomic, strong)UILabel *typeLab;
@property (nonatomic, strong)UILabel *titleLab;
@property (nonatomic, strong)UILabel *taskLab;
@property (nonatomic, strong)UILabel *progressLab;
@property (nonatomic, strong)UILabel *timeLab;

@property (nonatomic, strong)UILabel *titleContent;
@property (nonatomic, strong)UILabel *taskContent;
@property (nonatomic, strong)UILabel *progressContent;
@property (nonatomic, strong)UILabel *timeContent;

@property (nonatomic, strong)UIView *progressView;
@property (nonatomic, strong)UIView *progressBgView;

@property (nonatomic, strong)UIImageView *nextBtn;

@end

NSString * const kXJTaskingTableViewCell = @"kXJTaskingTableViewCell";

@implementation XJTaskingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (void)buildView {
    self.outCardBgView = [[UIView alloc]init];
    [self.contentView addSubview:self.outCardBgView];
    self.outCardBgView.backgroundColor = kFFB4D0FC;
    self.outCardBgView.layer.cornerRadius = Adaptation_6(11);
    self.outCardBgView.clipsToBounds = YES;
    self.cardBgView = [[UIView alloc]init];
    [self.contentView addSubview:self.cardBgView];
    self.cardBgView.backgroundColor = KFF1677FF;
    self.cardBgView.layer.cornerRadius = Adaptation_6(11);
    self.cardBgView.layer.borderWidth = Adaptation_6(3);
    self.cardBgView.layer.borderColor = kFFB4D0FC.CGColor;
    self.cardBgView.clipsToBounds = YES;
    [self.cardBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(6, 15, 6, 15));
    }];
//    [self.cardBgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.outCardBgView).insets(UIEdgeInsetsMake(3, 3, 3, 3));
//    }];
    
    [self.cardBgView addSubview:self.typeLab];
    [self.cardBgView addSubview:self.titleLab];
    [self.cardBgView addSubview:self.taskLab];
    [self.cardBgView addSubview:self.progressLab];
    [self.cardBgView addSubview:self.timeLab];
    
    [self.cardBgView addSubview:self.titleContent];
    [self.cardBgView addSubview:self.taskContent];
    [self.cardBgView addSubview:self.progressContent];
    [self.cardBgView addSubview:self.timeContent];
    
    [self.cardBgView addSubview:self.progressBgView];
    [self.progressBgView addSubview:self.progressView];
    
    [self.cardBgView addSubview:self.nextBtn];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cardBgView);
        make.right.equalTo(self.cardBgView).offset(Adaptation_6(-18));
        make.height.width.mas_equalTo(Adaptation_6(21));
    }];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardBgView).offset(Adaptation_6(12));
        make.left.equalTo(self.cardBgView).offset(Adaptation_6(16));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLab.mas_bottom).offset(Adaptation_6(12));
        make.left.equalTo(self.cardBgView).offset(Adaptation_6(16));
    }];
    [self.taskLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(Adaptation_6(12));
        make.left.equalTo(self.cardBgView).offset(Adaptation_6(16));
    }];
    [self.progressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.taskLab.mas_bottom).offset(Adaptation_6(12));
        make.left.equalTo(self.cardBgView).offset(Adaptation_6(16));
    }];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressLab.mas_bottom).offset(Adaptation_6(12));
        make.left.equalTo(self.cardBgView).offset(Adaptation_6(16));
    }];
    
    [self.titleContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab);
        make.left.equalTo(self.titleLab.mas_right).offset(Adaptation_6(2));
    }];
    [self.taskContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.taskLab);
        make.left.equalTo(self.taskLab.mas_right).offset(Adaptation_6(2));
    }];
    [self.progressContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.progressLab);
        make.left.equalTo(self.progressLab.mas_right).offset(Adaptation_6(2));
    }];
    [self.timeContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLab);
        make.left.equalTo(self.timeLab.mas_right).offset(Adaptation_6(2));
    }];
    
    [self.progressBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressLab);
        make.left.equalTo(self.progressContent.mas_right).offset(Adaptation_6(2));
        make.height.mas_equalTo(Adaptation_6(7));
//        make.right.equalTo(cardBgView).offset(Adaptation_6(-53));
        make.width.mas_equalTo(Adaptation_6(221));
    }];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self.progressBgView);
        make.width.mas_equalTo(Adaptation_6(0));
    }];
    
    [self.cardBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeContent).offset(Adaptation_6(19));
    }];
    
    self.typeLab.text = @"定向巡检";
    self.titleLab.text = @"计划名称:";
    self.taskLab.text = @"任务名称:";
    self.progressLab.text = @"任务进度:";
    self.timeLab.text = @"任务起止时间:";
    
}

- (void)loadDataWithModel:(TaskModel *)model{
    self.typeLab.text = model.planTypeName;
    self.titleContent.text = model.inspectPlanInfoName;
    self.taskContent.text = model.taskName;
    self.progressContent.text = model.processRate;
    self.timeContent.text = [NSString stringWithFormat:@"%@-%@",model.taskStartTime,model.taskEndTime];
    
    [self.progressView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(Adaptation_6(2.21 * model.processRateValue));
    }];
    
    if (model.type == 1) {
        self.cardBgView.backgroundColor = kFFFFFFFF;
        self.cardBgView.layer.borderColor = kFFF7F8FA.CGColor;
        self.typeLab.textColor = KFF1C2331;
        self.titleLab.textColor = KFF86909C;
        self.taskLab.textColor = KFF86909C;
        self.progressLab.textColor = KFF86909C;
        self.timeLab.textColor = KFF86909C;
        self.titleContent.textColor = KFF86909C;
        self.taskContent.textColor = KFF86909C;
        self.timeContent.textColor = KFF86909C;
        self.timeLab.textColor = KFF86909C;
        self.progressContent.textColor = KFF86909C;
        self.progressBgView.backgroundColor = kFFF2F3F5;
        self.progressView.backgroundColor = KFF1677FF;
        [self.nextBtn setImage:[UIImage imageNamed:@"main_next"]];
    }else {
        [self.nextBtn setImage:[UIImage imageNamed:@"main_begin_next"]];
    }
}

#pragma mark - 懒加载
- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = createLabel(kPingFangSC_Medium_14, kFFFFFFFF);
    }
    return _typeLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = createLabel(kPingFangSC_Regular_11, kFFFFFFFF);
        [_titleLab sizeToFit];
    }
    return _titleLab;
}

- (UILabel *)taskLab {
    if (!_taskLab) {
        _taskLab = createLabel(kPingFangSC_Regular_11, kFFFFFFFF);
        [_taskLab sizeToFit];
    }
    return _taskLab;
}

- (UILabel *)progressLab {
    if (!_progressLab) {
        _progressLab = createLabel(kPingFangSC_Regular_11, kFFFFFFFF);
        [_progressLab sizeToFit];
    }
    return _progressLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = createLabel(kPingFangSC_Regular_11, kFFFFFFFF);
        [_timeLab sizeToFit];
    }
    return _timeLab;
}

- (UILabel *)titleContent {
    if (!_titleContent) {
        _titleContent = createLabel(kPingFangSC_Regular_12, kFFFFFFFF);
    }
    return _titleContent;
}

- (UILabel *)taskContent {
    if (!_taskContent) {
        _taskContent = createLabel(kPingFangSC_Regular_12, kFFFFFFFF);
    }
    return _taskContent;
}

- (UILabel *)progressContent {
    if (!_progressContent) {
        _progressContent = createLabel(kPingFangSC_Regular_12, kFFFFFFFF);
    }
    return _progressContent;
}

- (UILabel *)timeContent {
    if (!_timeContent) {
        _timeContent = createLabel(kPingFangSC_Regular_12, kFFFFFFFF);
    }
    return _timeContent;
}

- (UIImageView *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[UIImageView alloc]init];
    }
    return _nextBtn;
}

- (UIView *)progressView{
    if (!_progressView) {
        _progressView = [[UIView alloc]init];
        _progressView.backgroundColor = kFFFFFFFF;
        _progressView.layer.cornerRadius = Adaptation_6(3);
        _progressView.clipsToBounds = YES;
    }
    return _progressView;
}

- (UIView *)progressBgView{
    if (!_progressBgView) {
        _progressBgView = [[UIView alloc]init];
        _progressBgView.layer.cornerRadius = Adaptation_6(3);
        _progressBgView.clipsToBounds = YES;
        _progressBgView.backgroundColor = kFF94BFFF;
    }
    return _progressBgView;
}

@end
