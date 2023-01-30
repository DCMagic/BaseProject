//
//  CustomNavigationBar.m
//  BaseProject
//
//  Created by dongchao on 2022/3/22.
//

#import "CustomNavigationBar.h"
#import "sys/utsname.h"

#define kTTDefaultTitleSize 18
#define kTTDefaultTitleColor [UIColor whiteColor]
#define kTTDefaultBackgroundColor kThemeColor
#define kTTScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation UIViewController (TTRoute)

- (void)tt_toLastViewController
{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if(self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

+ (UIViewController*)tt_currentViewController {
    UIViewController* rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self tt_currentViewControllerFrom:rootViewController];
}

+ (UIViewController*)tt_currentViewControllerFrom:(UIViewController*)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self tt_currentViewControllerFrom:navigationController.viewControllers.lastObject];
    }
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self tt_currentViewControllerFrom:tabBarController.selectedViewController];
    }
    else if (viewController.presentedViewController != nil) {
        return [self tt_currentViewControllerFrom:viewController.presentedViewController];
    }
    else {
        return viewController;
    }
}

@end


@interface CustomNavigationBar()

@property (nonatomic, strong) UILabel     *titleLabel;      // 标题
@property (nonatomic, strong) UIView      *leftItemsView; // 左边items显示集合
@property (nonatomic, strong) UIView      *rightItemsView; // 右边items显示集合
@property (nonatomic, strong) UIButton    *backButton;
@property (nonatomic, strong) UIView      *bottomLine;
//@property (nonatomic, strong) UIView      *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, assign) CGFloat titleViewW;       // 保存的titleView宽度


@end

@implementation CustomNavigationBar

+ (instancetype)CustomNavigationBar {
    CustomNavigationBar *navigationBar = [[self alloc] initWithFrame:CGRectMake(0, 0, kTTScreenWidth, [CustomNavigationBar navBarBottom])];
    return navigationBar;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setupView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(void)setupView {

    [self addSubview:self.backgroundView];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.leftItemsView];
    [self addSubview:self.rightItemsView];
    [self addSubview:self.bottomLine];
    [self updateFrame];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView.backgroundColor = kFFFFFFFF;
}


-(void)updateFrame {
    NSInteger top = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    NSInteger margin = 0;
    NSInteger buttonHeight = 44;
    NSInteger buttonWidth = 44;
    NSInteger titleLabelHeight = 44;
    NSInteger titleLabelWidth = 0;
    
    self.backgroundView.frame = self.bounds;
    self.backgroundImageView.frame = self.bounds;
    self.backButton.frame = CGRectMake(margin, 0, buttonWidth, buttonHeight);
    CGFloat left_d = self.isShowBack == NO ? margin : buttonWidth + margin;
    // 处理左视图
    [self.leftItemsView removeAllSubviews];
    self.leftItemsView.frame = CGRectMake(0, top, 10, 44);
    self.backButton.hidden = !self.isShowBack;
    if (self.isShowBack) {
        [self.leftItemsView addSubview:self.backButton];
    }
    for (int i = 0; i < self.leftItems.count; i++) {
        UIView *leftItem = self.leftItems[i];
        if (i > 0) {
            UIView *lastItem = self.leftItems[i - 1];
            left_d = lastItem.maxX;
        }
        leftItem.top = 0;
        leftItem.left = left_d;
        [self.leftItemsView addSubview:leftItem];
    }
    self.leftItemsView.width = self.leftItemsView.subviews.lastObject.maxX;
    
    
    // 处理右视图
    CGFloat right_d = margin;
    [self.rightItemsView removeAllSubviews];
    self.rightItemsView.frame = CGRectMake(0, top, 10, 44);
    for (int i = 0; i < self.rightItems.count; i++) {
        UIView *rightItem = self.rightItems[i];
        if (i > 0) {
            UIView *lastItem = self.rightItems[i - 1];
            right_d = lastItem.maxX;
        }
        rightItem.top = 0;
        rightItem.left = right_d;
        [self.rightItemsView addSubview:rightItem];
    }
    self.rightItemsView.width = self.rightItemsView.subviews.lastObject.maxX;
    self.rightItemsView.left = kTTScreenWidth - self.rightItemsView.width;
    
    // 处理titleLabel
    [self.titleLabel sizeToFit];
    titleLabelWidth = self.titleLabel.width;
    CGFloat maxItemViewW = MAX(self.leftItemsView.width, self.rightItemsView.width);
    CGFloat maxTitleW = kTTScreenWidth - maxItemViewW * 2;
    self.titleLabel.height = titleLabelHeight;
//    titleLabelWidth = MAX(titleLabelWidth, maxTitleW);
    
    if (_contentMode == TTContentModeAllSide) {
        
        CGFloat remainW = kTTScreenWidth - self.leftItemsView.width - self.rightItemsView.width;
        CGFloat titleWidth = MIN(maxTitleW, remainW);
        self.titleLabel.width = titleWidth;
        if (self.titleLabel.width > maxTitleW) {
            self.titleLabel.left = self.leftItemsView.width;
            self.titleLabel.top = top;
        }
        
    }else {
        
        CGFloat titleWidth = maxTitleW;
        self.titleLabel.width = titleWidth;
        self.titleLabel.left = (kTTScreenWidth - titleWidth) / 2;
        self.titleLabel.top = top;
    }
    
    
//    self.titleLabel.frame = CGRectMake((kTTScreenWidth - titleLabelWidth) / 2, top, titleLabelWidth, titleLabelHeight);
    
    // 处理titleView
    if (self.titleView != nil) {
        if (self.titleViewW == 0) {
            self.titleViewW = self.titleView.width;
        }
        self.titleView.width = self.titleViewW; // 重置titleView的宽度
        if (_contentMode == TTContentModeAllSide) {
            CGFloat remainW = kTTScreenWidth - self.leftItemsView.width - self.rightItemsView.width;
            CGFloat titleViewWidth = MIN(self.titleView.width, remainW);
            self.titleView.width = titleViewWidth;
            self.titleView.center = self.titleLabel.center;
            if (self.titleView.width > maxTitleW) {
                self.titleView.left = self.leftItemsView.width;
            }
            
        }else {
            CGFloat titleViewWidth = MIN(maxTitleW, self.titleView.width);
            self.titleView.width = titleViewWidth;
            self.titleView.center = self.titleLabel.center;
        }
    }

    self.bottomLine.frame = CGRectMake(0, (CGFloat)(self.bounds.size.height-1), kTTScreenWidth, 1);
}

#pragma mark - 导航按钮事件
-(void)clickBack {
    if (self.onClickBackButton) {
        self.onClickBackButton();
    } else {
        UIViewController *currentVC = [UIViewController tt_currentViewController];
        [currentVC tt_toLastViewController];
    }
}

- (void)tt_setBottomLineHidden:(BOOL)hidden {
    self.bottomLine.hidden = hidden;
}

- (void)tt_setBackgroundAlpha:(CGFloat)alpha {
    self.backgroundView.alpha = alpha;
    self.backgroundImageView.alpha = alpha;
    self.bottomLine.alpha = alpha;
}
- (void)tt_setTitleAlpha:(CGFloat)alpha {
    self.titleLabel.alpha = alpha;
    self.titleView.alpha = alpha;
}

- (void)tt_setTintColor:(UIColor *)color {
    [self.backButton setImage:[self backButtonImageWithColor:color] forState:(UIControlStateNormal)];
    [self.backButton setTitleColor:color forState:UIControlStateNormal];
    [self.titleLabel setTextColor:color];
}

#pragma mark - 左右按钮
- (void)tt_setBackButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted title:(NSString *)title titleColor:(UIColor *)titleColor {
    self.backButton.hidden = NO;
    [self.backButton setImage:normal forState:UIControlStateNormal];
    [self.backButton setImage:highlighted forState:UIControlStateHighlighted];
    [self.backButton setTitle:title forState:UIControlStateNormal];
    [self.backButton setTitleColor:titleColor forState:UIControlStateNormal];
}

- (void)tt_setBackButtonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    [self tt_setBackButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}

- (void)tt_setBackButtonWithNormal:(UIImage *)normal highlighted:(UIImage *)highlighted {
    [self tt_setBackButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}

- (void)tt_setBackButtonWithImage:(UIImage *)image {
    [self tt_setBackButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}

- (void)tt_setBackButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self tt_setBackButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}

#pragma mark - setter
-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.hidden = NO;
    self.titleView.hidden = YES;
    self.titleLabel.text = _title;
    [self updateFrame];
}

- (void)setTitleView:(UIView *)titleView {
    [_titleView removeFromSuperview];
    
    _titleView = titleView;
    self.titleView.hidden = NO;
    self.titleLabel.hidden = YES;
    [self addSubview:_titleView];
    [self updateFrame];
}

- (void)setLeftItems:(NSArray<UIView *> *)leftItems {
    _leftItems = leftItems;
    [self updateFrame];
}

- (void)setRightItems:(NSArray<UIView *> *)rightItems {
    _rightItems = rightItems;
    [self updateFrame];
}

- (void)setIsShowBack:(BOOL)isShowBack {
    _isShowBack = isShowBack;
    _backButton.hidden = !isShowBack;
    [self updateFrame];
}

- (void)setContentMode:(TTContentMode)contentMode {
    _contentMode = contentMode;
    [self updateFrame];
}

- (void)setTitleLabelColor:(UIColor *)titleLabelColor {
    _titleLabelColor = titleLabelColor;
    self.titleLabel.textColor = _titleLabelColor;
}
- (void)setTitleLabelFont:(UIFont *)titleLabelFont {
    _titleLabelFont = titleLabelFont;
    self.titleLabel.font = _titleLabelFont;
}

-(void)setBarBackgroundColor:(UIColor *)barBackgroundColor {
    self.backgroundImageView.hidden = YES;
    _barBackgroundColor = barBackgroundColor;
    self.backgroundView.hidden = NO;
    self.backgroundView.backgroundColor = _barBackgroundColor;
}

- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage {
    self.backgroundView.hidden = YES;
    _barBackgroundImage = barBackgroundImage;
    self.backgroundImageView.hidden = NO;
    self.backgroundImageView.image = _barBackgroundImage;
}



+ (int)navBarBottom {
    
    return 44 + CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}




#pragma mark - # 方法

// 根据颜色 生成返回按钮图片
- (UIImage *)backButtonImageWithColor:(UIColor *)color; {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 10.0f, 18.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(rect.size.width,0);
    CGPoint middlePoint = CGPointMake(0, rect.size.height * 0.5);
    CGPoint endPoint = CGPointMake(rect.size.width, rect.size.height);
    
    [path moveToPoint:startPoint];
    [path addLineToPoint:middlePoint];
    
    [path moveToPoint:endPoint];
    [path addLineToPoint:middlePoint];
    
    [path closePath];
    path.lineWidth = 1;
    UIColor *fillColor = color;
    [fillColor set];
    [path stroke];
    CGContextDrawPath(context, kCGPathStroke);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

#pragma mark - #控件懒加载

-(UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        _backButton.imageView.contentMode = UIViewContentModeCenter;
        [_backButton setImage:[self backButtonImageWithColor:UIColor.blackColor] forState:(UIControlStateNormal)];
        _backButton.hidden = !self.isShowBack;
    }
    return _backButton;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kTTDefaultTitleColor;
        _titleLabel.font = [UIFont systemFontOfSize:kTTDefaultTitleSize];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.hidden = YES;
    }
    return _titleLabel;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor colorWithRed:(CGFloat)(218.0/255.0) green:(CGFloat)(218.0/255.0) blue:(CGFloat)(218.0/255.0) alpha:1.0];
        _bottomLine.hidden = NO;
    }
    return _bottomLine;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
    }
    return _backgroundView;
}
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.hidden = YES;
    }
    return _backgroundImageView;
}


- (UIView *)leftItemsView {
    if (!_leftItemsView) {
        _leftItemsView = [[UIView alloc] init];
        _leftItemsView.backgroundColor = UIColor.clearColor;
    }
    
    return _leftItemsView;
}

- (UIView *)rightItemsView {
    if (!_rightItemsView) {
        _rightItemsView = [[UIView alloc] init];
        _rightItemsView.backgroundColor = UIColor.clearColor;
    }
    
    return _rightItemsView;
}




@end
