//
//  MainItemClickManager.h
//  BaseProject
//
//  Created by dongchao on 2022/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainItemClickManager : NSObject

+(void)jumpDetailVCWith:(UIViewController *) currentVC itemCode:(NSString *) itemCode currentModel:(id) currentModel;

+(void)jumpDetailVCWith:(UINavigationController *)currentVC vcName:(NSString *)vcName;

@end

NS_ASSUME_NONNULL_END
