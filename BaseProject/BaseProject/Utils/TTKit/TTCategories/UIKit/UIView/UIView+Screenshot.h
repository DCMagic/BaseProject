//
//  UIView+Screenshot.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/**
 *  截屏
 *
 *  线程安全的
 */
- (UIImage *)captureImage;

@end
