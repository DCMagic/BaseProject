//
//  NoticeView.m
//  BaseProject
//
//  Created by dongchao on 2022/3/22.
//

#import "NoticeView.h"

@interface NoticeView ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIImageView *videoIcon;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NoticeView

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildView];
    }
    return self;
}

- (void)buildView{
    [self addSubview:self.videoIcon];
    [self addSubview:self.textScrollView];
    [self addSubview:self.moreBtn];
//    self.containView = [[UIView alloc] init];
//    [self.containView addSubview:self.textLabel];
//    [self.textScrollView addSubview:self.containView];
    
    [self.videoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(Adaptation_6(12));
        make.width.height.mas_equalTo(Adaptation_6(18.5));
    }];
    
    [self.textScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoIcon.mas_right).offset(Adaptation_6(8));
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(Adaptation_6(-60));
        make.height.equalTo(self.videoIcon);
    }];
    
//    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.textScrollView);
//    }];
//    
//    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.equalTo(self.videoIcon.mas_right).offset(Adaptation_6(8));
////        make.centerY.equalTo(self);
////        make.right.equalTo(self).offset(Adaptation_6(60));
//        make.top.left.bottom.offset(0);
//    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(Adaptation_6(-10));
        make.top.equalTo(self).offset(Adaptation_6(10));
        make.centerY.equalTo(self);
    }];
}



///// 主页通知消息滚动
//- (void)scrollNoticeView{
//    kWeakSelf(self);
//    [NSTimer scheduledTimerWithTimeInterval:0.05 block:^(NSTimer *timer) {
//        CGPoint offset = weakSelf.textScrollView.contentOffset;
//        offset.x += Adaptation_6(6);
//        [weakSelf.textScrollView setContentOffset:offset animated:YES];
////        if (offset.x > weakSelf.textLabel.width) {
////            offset.x = 0;
////            [weakSelf.textScrollView setContentOffset:offset animated:YES];
////        }
//    } repeats:YES];
//}

//- (void)setNotice:(NSString *)notice{
//    if (notice.length > 0) {
//        self.textLabel.text = notice;
//
//        [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.textLabel.mas_right);
//        }];
//    }
//
//}



- (UIImageView *)videoIcon{
    if (!_videoIcon) {
        _videoIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"voice"]];
    }
    return _videoIcon;
}

- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        [_textLabel setFont:kPingFangSC_Regular_15];
        [_textLabel setTextColor:kFF4055CE];
        _textLabel.text = @"公告正文内容不超过一行";
    }
    return _textLabel;
}

- (DCHorizontalScrollText *)textScrollView{
    if (!_textScrollView) {
        _textScrollView = [[DCHorizontalScrollText alloc]init];
        _textScrollView.moveDirection = DCTextScrollMoveLeft;
        _textScrollView.moveMode = DCTextScrollContinuous;
        [_textScrollView setTextColor:kFF4055CE];
        [_textScrollView setTextFont:kPingFangSC_Regular_15];
    
    }
    
    return _textScrollView;
}

- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
    }
    return _moreBtn;
}

@end
