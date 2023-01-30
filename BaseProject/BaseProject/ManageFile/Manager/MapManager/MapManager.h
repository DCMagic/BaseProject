//
//  MapManager.h
//  BaseProject
//
//  Created by dongchao on 2022/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapManager : NSObject

+ (MapManager *)sharedInstance;

- (void)openMapWithLocation:(NSString *)address;

@end

NS_ASSUME_NONNULL_END
