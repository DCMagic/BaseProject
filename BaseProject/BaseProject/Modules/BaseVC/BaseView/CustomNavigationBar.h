//
//  CustomNavigationBar.h
//  BaseProject
//
//  Created by dongchao on 2022/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef enum :NSInteger{
    
    TTContentModeCenter,  // 居中  默认
    TTContentModeAllSide  // 填充
    
} TTContentMode;


@interface CustomNavigationBar : UIView

// 返回按钮点击事件
@property (nonatomic, copy) void(^onClickBackButton)(void);

@property (nonatomic, copy)   NSString  *title;              // 标题
@property (nonatomic, strong) UIView    *titleView;          // 中间视图
@property (nonatomic, assign) TTContentMode  contentMode;       // 中间视图模式
@property (nonatomic, strong) UIColor   *titleLabelColor;    // title字体颜色
@property (nonatomic, strong) UIFont    *titleLabelFont;     // title字体大小
@property (nonatomic, strong) UIColor   *barBackgroundColor; // 背景颜色
@property (nonatomic, strong) UIImage   *barBackgroundImage; // 背景图片
@property (nonatomic, assign) BOOL      isShowBack;          // 是否显示返回按钮 默认 NO
@property (nonatomic, copy) NSArray<UIView *> *leftItems;          // 左侧按钮集合
@property (nonatomic, copy) NSArray<UIView *> *rightItems;         // 右侧按钮集合

@property (nonatomic, strong) UIView      *backgroundView;



@property (nonatomic, copy) void(^onClickRightButton)(void);


+ (instancetype)CustomNavigationBar;

- (void)tt_setBottomLineHidden:(BOOL)hidden;
- (void)tt_setBackgroundAlpha:(CGFloat)alpha;
- (void)tt_setTitleAlpha:(CGFloat)alpha;
- (void)tt_setTintColor:(UIColor *)color;

- (void)tt_setBackButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted;
- (void)tt_setBackButtonWithImage:(UIImage *)image;
- (void)tt_setBackButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;


@end

NS_ASSUME_NONNULL_END
