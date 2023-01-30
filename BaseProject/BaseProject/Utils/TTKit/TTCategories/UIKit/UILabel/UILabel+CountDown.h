//
//  UILabel+CountDown.h
//  LotteryManagement
//
//  Created by 刘涛 on 16/11/8.
//  Copyright © 2016年 iwgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CountDown)

@property (strong, nonatomic) dispatch_source_t labelTimer;

-(void)startTime:(long long int)timeout endTitle:(NSString *)tittle endBlock:(void(^)())endBlock;

- (void)cancelTimer;
@end
