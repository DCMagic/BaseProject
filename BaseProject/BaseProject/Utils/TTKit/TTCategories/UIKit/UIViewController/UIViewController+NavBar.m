//
//  UIViewController+NavBar.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "UIViewController+NavBar.h"

@implementation UIViewController (NavBar)

- (void)addDismissBarButtonWithTitle:(NSString *)title
{
    __weak typeof(self) weakSelf = self;
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain actionBlick:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.navigationItem setLeftBarButtonItem:barButton];
}

- (void)addLeftBarButtonWithTitle:(NSString *)title actionBlick:(TTBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setLeftBarButtonItem:barButton];
}

- (void)addLeftBarButtonWithImage:(UIImage *)image actionBlick:(TTBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setLeftBarButtonItem:barButton];
}

- (void)addRightBarButtonWithTitle:(NSString *)title actionBlick:(TTBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setRightBarButtonItem:barButton];
}

- (void)addRightBarButtonWithImage:(UIImage *)image actionBlick:(TTBarButtonActionBlock)actionBlock
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain actionBlick:actionBlock];
    [self.navigationItem setRightBarButtonItem:barButton];
}


@end
