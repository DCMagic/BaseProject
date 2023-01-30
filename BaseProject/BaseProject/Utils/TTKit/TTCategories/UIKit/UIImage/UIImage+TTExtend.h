//
//  UIImage+TTExtend.h
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/3/19.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TTSaveResultBlock)(NSError *error);

@interface UIImage (TTExtend)

- (void)savedPhotosAlbumByResult:(TTSaveResultBlock)saveResult;

@end
