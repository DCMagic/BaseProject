//
//  BaseRequestSuccessModel.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequestSuccessModel : NSObject

@property (nonatomic, assign) NSInteger code; /**< 请求标志，0成功 */
@property (nonatomic, copy) NSString *message; /**< 提示语 */
@property (nonatomic, strong) id body; /**< 请求后的数据，可为list，可为字典 */
@property (nonatomic, strong) id rows; /**< 请求后的数据，可为list，可为字典 */
@property (nonatomic, strong) id data;

@end

NS_ASSUME_NONNULL_END
