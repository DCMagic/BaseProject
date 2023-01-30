//
//  NSBundle+AppIcon.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (AppIcon)

@property (nonatomic, strong, readonly) NSString *appIconPath;

@property (nonatomic, strong, readonly) UIImage *appIcon;

@end
