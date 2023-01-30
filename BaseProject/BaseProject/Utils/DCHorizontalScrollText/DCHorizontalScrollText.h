//
//  DCHorizontalScrollText.h
//  BaseProject
//
//  Created by dongchao on 2022/4/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 描述字符串滚动前端起始位置：
 */
typedef enum {
    DCTextScrollContinuous,     // 从控件内开始连续滚动
    DCTextScrollIntermittent,   // 从控件内开始间断滚动
    DCTextScrollFromOutside,    // 从控件外开始滚动
    DCTextScrollWandering       // 在控件中往返滚动（不受设置方向影响）
}DCTextScrollMode;

/**
 描述字符串移动的方向
 */
typedef enum {
    DCTextScrollMoveLeft,
    DCTextScrollMoveRight
}DCTextScrollMoveDirection;

@interface DCHorizontalScrollText : UIView

@property (nonatomic,copy)   NSString  * text;
@property (nonatomic,copy)   UIFont  * textFont;
@property (nonatomic,copy)   UIColor * textColor;

@property (nonatomic,assign) CGFloat speed;

@property (nonatomic,assign) DCTextScrollMode moveMode;
@property (nonatomic,assign) DCTextScrollMoveDirection moveDirection;

- (void)move;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
