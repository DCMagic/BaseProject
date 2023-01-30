//
//  PBFormCheckboxView.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/15.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBFormItemBaseView.h"

@interface PBFormCheckboxView : PBFormItemBaseView

TT_CHAINAPI_TYPE PBFormCheckboxView *(^ font)(UIFont *);

TT_CHAINAPI_TYPE PBFormCheckboxView *(^ textColor)(UIColor *);

TT_CHAINAPI_TYPE PBFormCheckboxView *(^ options)(NSArray<NSString *> *optionTitles);


@end
