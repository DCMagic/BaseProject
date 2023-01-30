//
//  ScanQRVC.h
//  BaseProject
//
//  Created by dongchao on 2022/11/11.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SGQRCodeResultBlock)(NSString *result);

@interface ScanQRVC : BaseVC

@property (nonatomic, copy) SGQRCodeResultBlock scanResultBlock;

@property (nonatomic, copy)NSString *taskId;

@end

NS_ASSUME_NONNULL_END
