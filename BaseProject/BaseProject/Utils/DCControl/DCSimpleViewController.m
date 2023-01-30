//
//  DCSimpleViewController.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2022/1/30.
//  Copyright © 2022 智能院. All rights reserved.
//

#import "DCSimpleViewController.h"

@interface DCSimpleViewController ()

@property (nonatomic,copy)NSString *imageUrl;

@end

@implementation DCSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:232/255.0 green:233/255.0 blue:234/355.0 alpha:0.3]];
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrl] placeholderImage:nil];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.centerX.centerY.equalTo(self.view);
    }];
}

- (instancetype)initWithURLString:(NSString *)urlStr{
    self = [super init];
    if (self) {
//        [self buildViewWithUrlString: urlStr];
        self.imageUrl = urlStr;
    }
    return self;
}


- (void)buildViewWithUrlString:(NSString *) string{
    [self.view setBackgroundColor:[UIColor colorWithRed:232/255.0 green:233/255.0 blue:234/355.0 alpha:0.3]];
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.centerX.centerY.equalTo(self.view);
    }];
    
}


@end
