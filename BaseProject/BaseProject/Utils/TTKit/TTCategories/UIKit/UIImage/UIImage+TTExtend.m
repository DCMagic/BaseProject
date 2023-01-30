//
//  UIImage+TTExtend.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/3/19.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIImage+TTExtend.h"

static const int AssociatedImageTarget_key;

@implementation UIImage (TTExtend)


- (void)savedPhotosAlbumByResult:(TTSaveResultBlock)saveResult {
    [self addBlock:saveResult];
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


- (void)addBlock:(TTSaveResultBlock)block {
    if (block) {
        objc_setAssociatedObject(self, &AssociatedImageTarget_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    TTSaveResultBlock block = objc_getAssociatedObject(self, &AssociatedImageTarget_key);
    if (block) {
        block(error);
    }
}


@end
