//
//  TTFormItemBaseView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTFormViewConfig.h"
//#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTFormItemBaseView : UIView

@property (nonatomic, assign, readonly) CGFloat maxHeight;


- (void)layoutView;


@end

NS_ASSUME_NONNULL_END
