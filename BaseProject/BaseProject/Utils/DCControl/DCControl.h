//
//  DCControl.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2022/1/30.
//  Copyright © 2022 智能院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCGestureRecognizer.h"

NS_ASSUME_NONNULL_BEGIN

@interface DCControl : UIImageView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) void (^touchBlock)(DCControl *view, DCGestureRecognizerState state, NSSet *touches, UIEvent *event);
@property (nonatomic, copy) void (^longPressBlock)(DCControl *view, CGPoint point);

@end

NS_ASSUME_NONNULL_END
