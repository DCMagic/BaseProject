//
//  NoticeView.h
//  BaseProject
//
//  Created by dongchao on 2022/3/22.
//

#import <UIKit/UIKit.h>
#import "DCHorizontalScrollText.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoticeView : UIView

@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIButton *moreBtn;
@property (nonatomic, strong)UIView   *containView;
@property (nonatomic, strong)DCHorizontalScrollText *textScrollView;

- (void)setNotice:(NSString *)notice;

- (void)scrollNoticeView;

@end

NS_ASSUME_NONNULL_END
