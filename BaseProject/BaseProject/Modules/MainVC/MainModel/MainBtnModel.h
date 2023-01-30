//
//  MainBtnModel.h
//  BaseProject
//
//  Created by dongchao on 2022/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainBtnModel : NSObject

@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *itemCode;
@property (nonatomic, assign)BOOL available;

@end

NS_ASSUME_NONNULL_END
