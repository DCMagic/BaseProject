//
//  HomeBtnModel.h
//  BaseProject
//
//  Created by dongchao on 2022/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeBtnModel : NSObject

@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *itemCode;
@property (nonatomic, copy)NSString *vcName;
@property (nonatomic, copy)NSString *btnCode;
@property (nonatomic, assign)BOOL available;
@property (nonatomic, copy)NSString *linkUrl;

@end

NS_ASSUME_NONNULL_END
