//
//  DCGestureRecognizer.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2022/1/30.
//  Copyright © 2022 智能院. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DCGestureRecognizerState) {
    DCGestureRecognizerStateBegan,
    DCGestureRecognizerStateMoved,
    DCGestureRecognizerStateEnded,
    DCGestureRecognizerStateCancelled,
};

@interface DCGestureRecognizer : UIGestureRecognizer

@property (nonatomic, readonly) CGPoint startPoint;
@property (nonatomic, readonly) CGPoint lastPoint;
@property (nonatomic, readonly) CGPoint currentPoint;

@property (nullable, nonatomic, copy) void (^action)(DCGestureRecognizer *gesture, DCGestureRecognizerState state);

- (void)cancel;

@end

NS_ASSUME_NONNULL_END
