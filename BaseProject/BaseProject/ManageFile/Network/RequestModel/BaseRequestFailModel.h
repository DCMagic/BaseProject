//
//  BaseRequestFailModel.h
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequestFailModel : NSObject

@property (nonatomic, copy) NSString *urlStr; /**< 失败的url */
@property (nonatomic, copy) NSString *failDescription; /**< 失败原因 */
@property (nonatomic, copy) NSHTTPURLResponse *respone; /**< 失败响应,由于yymodel无法解析NSHTTPURLResponse数据类型，需自己赋值 */
@property (nonatomic, assign) NSInteger code; /**< 外层失败code */

@end

NS_ASSUME_NONNULL_END
