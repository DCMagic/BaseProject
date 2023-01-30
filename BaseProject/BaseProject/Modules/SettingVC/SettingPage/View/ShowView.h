//
//  ShowView.h
//  BaseProject
//
//  Created by dongchao on 2022/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowView : UIView

@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UILabel *content;

- (void)setShowViewWithText:(NSString *)text content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
