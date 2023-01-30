//
//  MainItemClickManager.m
//  BaseProject
//
//  Created by dongchao on 2022/3/24.
//

#import "MainItemClickManager.h"

@implementation MainItemClickManager

+ (void)jumpDetailVCWith:(UIViewController *)currentVC itemCode:(NSString *)itemCode currentModel:(id)currentModel{
    if (true) {
        
    }
}

+(void)jumpDetailVCWith:(UINavigationController *)currentVC vcName:(NSString *)vcName{
    if (vcName.length) {
        Class cls = NSClassFromString(vcName);
        UIViewController *vc;
        if ([cls isKindOfClass:[UIViewController class]]) {
            vc = [[cls alloc] init];
            [currentVC pushViewController:vc animated:YES];
        }else{
            return;
        }
    }
}


@end
