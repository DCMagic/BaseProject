//
//  UILabel+CountDown.m
//  LotteryManagement
//
//  Created by 刘涛 on 16/11/8.
//  Copyright © 2016年 iwgroup. All rights reserved.
//

#import "UILabel+CountDown.h"
#import <objc/runtime.h>

@implementation UILabel (CountDown)


static char labelTimerKey;

-(void)startTime:(long long int)timeout endTitle:(NSString *)tittle endBlock:(void(^)())endBlock{
    
    if (self.labelTimer) {
        dispatch_source_cancel(self.labelTimer);
        self.labelTimer = nil;
    }
    
    __block long long int timeOut = timeout / 1000; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    self.labelTimer = _timer;
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面显示 根据自己需求设置
                NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:tittle];
                self.attributedText = attrStr;
                if (endBlock) {
                    endBlock();
                }
                
            });
        }else{
            NSString *strTime;
            int days = (int)timeOut / (24 * 60 * 60);
            int hour = (int)(timeOut - days * (24 * 60 * 60)) / (60 * 60);
            int minute = (int)(timeOut - days * (24 * 60 * 60) - hour * (60 * 60)) / 60;
            int second = (int)(timeOut - days * (24 * 60 * 60) - hour * (60 * 60)) - minute * 60;
            
            if (days) {
                strTime = [NSString stringWithFormat:@"剩余时间：%d天%d小时%d分", days, hour, minute];
            }else if (hour) {
                strTime = [NSString stringWithFormat:@"剩余时间：%d小时%d分%d秒", hour, minute, second];
            }else if (minute) {
                strTime = [NSString stringWithFormat:@"剩余时间：%d分%d秒", minute, second];
            }else {
                strTime = [NSString stringWithFormat:@"剩余时间：%d秒", second];
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的显示 根据自己需求设置
                
                self.text = strTime;
            });
            
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);

}




-(void)labelNoStylestartTime:(long long int)timeout endTitle:(NSString *)tittle endBlock:(void(^)())endBlock{
    
    if (self.labelTimer) {
        dispatch_source_cancel(self.labelTimer);
        self.labelTimer = nil;
    }
    
    __block long long int timeOut = timeout / 1000; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    self.labelTimer = _timer;
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面显示 根据自己需求设置
                self.text = tittle;
                endBlock();
            });
        }else{
            int days = (int)timeOut / (24 * 60 * 60);
            int hour = (int)(timeOut - days * (24 * 60 * 60)) / (60 * 60);
            int minute = (int)(timeOut - days * (24 * 60 * 60) - hour * (60 * 60)) / 60;
            int second = (int)(timeOut - days * (24 * 60 * 60) - hour * (60 * 60)) - minute * 60;
       
            NSMutableString *strTimeM = [[NSMutableString alloc] init];
            if (days) {
                [strTimeM appendString:[NSString stringWithFormat:@"%@天", @(days)]];
            }
            
            if (hour) {
                [strTimeM appendString:[NSString stringWithFormat:@"%@小时", @(hour)]];
            }
            
            if (minute) {
                [strTimeM appendString:[NSString stringWithFormat:@"%@分", @(minute)]];
            }
            
            if (second) {
                [strTimeM appendString:[NSString stringWithFormat:@"%@秒", @(second)]];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的显示 根据自己需求设置
                self.text = strTimeM.copy;
            });
            
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
}


- (void)cancelTimer {
    if (self.labelTimer) {
        dispatch_source_cancel(self.labelTimer);
        self.labelTimer = nil;
    }
}

- (dispatch_source_t)labelTimer {
    return objc_getAssociatedObject(self, &labelTimerKey);
}

- (void)setLabelTimer:(dispatch_source_t)labelTimer {
    objc_setAssociatedObject(self, &labelTimerKey,
                             labelTimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
