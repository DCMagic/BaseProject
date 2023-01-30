//
//  UITextView+Placeholder.m
//  Pods
//
//  Created by tao6 on 2017/9/11.
//
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

static const char *tt_placeholderTextView = "tt_placeholderTextView";

@implementation UITextView (Placeholder)

- (UITextView *)placeHolderTextView
{
    UITextView *textView = objc_getAssociatedObject(self, tt_placeholderTextView);
    if (!textView) {
        textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        [self addSubview:textView];
        objc_setAssociatedObject(self, tt_placeholderTextView, textView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    }
    return textView;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeHolderTextView.text = placeholder;
}
- (NSString *)placeholder
{
    return self.placeHolderTextView.text;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    self.placeHolderTextView.textColor = placeholderColor;
    
}


- (UIColor *)placeholderColor {
    return self.placeHolderTextView.textColor;
}

- (void)setPlaceholderHidden:(BOOL)placeholderHidden {
    self.placeHolderTextView.hidden = placeholderHidden;
}

#pragma mark - # Delegate
- (void)textViewDidBeginEditing:(NSNotification *)noti
{
    self.placeHolderTextView.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)noti
{
    if (self.text && [self.text isEqualToString:@""]) {
        self.placeHolderTextView.hidden = NO;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
