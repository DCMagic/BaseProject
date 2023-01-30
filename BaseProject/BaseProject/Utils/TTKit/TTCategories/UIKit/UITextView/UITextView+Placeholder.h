//
//  UITextView+Placeholder.h
//  Pods
//
//  Created by tao6 on 2017/9/11.
//
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)

@property (nonatomic, strong, readonly) UITextView *placeholderTextView;

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, assign) BOOL placeholderHidden;

@end
