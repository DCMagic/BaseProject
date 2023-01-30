//
//  DCSelectItemView.m
//  BaseProject
//
//  Created by dongchao on 2022/3/30.
//

#import "DCSelectItemView.h"

#define IS_IPHONE_X (812 == [UIScreen mainScreen].bounds.size.height && 375 == [UIScreen mainScreen].bounds.size.width)

static const CGFloat kRowHeight = 46.0f;
static const CGFloat kRowLineHeight = 0.5f;
static const CGFloat kSeparatorHeight = 6.0f;
static const CGFloat kTitleFontSize = 13.0f;
static const CGFloat kButtonTitleFontSize = 16.0f;
static const NSTimeInterval kAnimateDuration = 0.5f;

@interface DCSelectItemView ()


/** 背景图片 */
@property (strong, nonatomic) UIView *backgroundView;
/** 弹出视图 */
@property (strong, nonatomic) UIView *bottomSelectView;

@end

@implementation DCSelectItemView


#pragma mark - 快速构建并显示选择视图

#pragma mark - 视图展示
- (void)show {
    // 在主线程中处理,否则在viewDidLoad方法中直接调用,会先加本视图,后加控制器的视图到UIWindow上,导致本视图无法显示出来,这样处理后便会优先加控制器的视图到UIWindow上
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows) {
            BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
            BOOL windowIsVisible = !window.hidden && window.alpha > 0;
            BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
            
            if(windowOnMainScreen && windowIsVisible && windowLevelNormal) {
                [window addSubview:self];
                break;
            }
        }
        
        [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:1.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.backgroundView.alpha = 1.0f;
            self.bottomSelectView.frame = CGRectMake(0, self.frame.size.height-self.bottomSelectView.frame.size.height, self.frame.size.width, self.bottomSelectView.frame.size.height);
        } completion:nil];
    }];
}

#pragma mark - 视图收起（隐藏）
- (void)dismiss {
    [UIView animateWithDuration:kAnimateDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.alpha = 0.0f;
        self.bottomSelectView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.bottomSelectView.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
