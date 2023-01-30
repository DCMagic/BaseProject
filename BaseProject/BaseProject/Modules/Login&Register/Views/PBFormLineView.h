//
//  PBFormLineView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/17.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBFormItemBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PBFormLineView : PBFormItemBaseView

TT_CHAINAPI_TYPE PBFormLineView *(^ backgColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormLineView *(^ lineHeight)(CGFloat);

+ (PBFormLineView * (^)(void))line;

@end

NS_ASSUME_NONNULL_END
