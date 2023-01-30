//
//  DCSelectItemView.h
//  BaseProject
//
//  Created by dongchao on 2022/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DCSelectItemView;

typedef void(^DCBottomSelectViewBlock) (DCSelectItemView *bootomSelectView, NSInteger index);

@interface DCSelectItemView : UIView

+ (void)showBottomSelectViewWithSelectArray:(NSArray *)selectArray;

@end

NS_ASSUME_NONNULL_END
