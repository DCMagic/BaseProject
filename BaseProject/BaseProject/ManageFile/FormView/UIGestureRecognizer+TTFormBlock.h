//
//  UIGestureRecognizer+TTFormBlock.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TTGestureBlock)(void);

@interface UIGestureRecognizer (TTFormBlock)

+ (instancetype)tt_gestureRecognizerWithBlock:(TTGestureBlock)block;

@end

NS_ASSUME_NONNULL_END
