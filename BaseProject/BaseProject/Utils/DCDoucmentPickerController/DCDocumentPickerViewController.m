//
//  DCDocumentPickerViewController.m
//  BaseProject
//
//  Created by dongchao on 2022/5/16.
//

#import "DCDocumentPickerViewController.h"
#import "CustomNavigationBar.h"

@interface DCDocumentPickerViewController ()

@property (nonatomic, strong)CustomNavigationBar *customNavBar;

@end

@implementation DCDocumentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = kFFFFFFFF;
//    [self.view addSubview:self.customNavBar];
}

- (CustomNavigationBar *)customNavBar {
    if (_customNavBar == nil) {
        _customNavBar = [CustomNavigationBar CustomNavigationBar];
        //_customNavBar.barBackgroundImage = [UIImage imageNamed:@"home_header_bg"];
        [_customNavBar tt_setTintColor:UIColor.whiteColor];
    }
    return _customNavBar;
}

@end
