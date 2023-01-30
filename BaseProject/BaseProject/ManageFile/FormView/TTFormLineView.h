//
//  TTFormLineView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/17.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "TTFormItemBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTFormLineView : TTFormItemBaseView

TT_CHAINAPI_TYPE TTFormLineView *(^ backgColor)(UIColor *);

TT_CHAINAPI_TYPE TTFormLineView *(^ lineHeight)(CGFloat);

+ (TTFormLineView * (^)(void))line;

@end

NS_ASSUME_NONNULL_END
