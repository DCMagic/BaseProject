//
//  HeaderView.h
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIButton

@property (nonatomic, strong)UIImageView *headImage;
@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIImageView *moreBtn;

- (void)setHeaderViewWithImage:(NSString *)headerImageString;

@end

NS_ASSUME_NONNULL_END
