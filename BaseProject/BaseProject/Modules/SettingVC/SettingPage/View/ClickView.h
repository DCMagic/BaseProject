//
//  ClickView.h
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClickView : UIButton

@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIImageView *moreImage;

- (void)setClickViewWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
