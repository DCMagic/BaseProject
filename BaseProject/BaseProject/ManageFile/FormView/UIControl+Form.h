//
//  UIControl+Form.h
//  Pods
//
//  Created by tao6 on 2017/8/31.
//
//

#import <UIKit/UIKit.h>

@interface UIControl (Form)

- (void)tt_touchDown:(void (^)(id sender))eventBlock;
- (void)tt_touchDownRepeat:(void (^)(id sender))eventBlock;
- (void)tt_touchDragInside:(void (^)(id sender))eventBlock;
- (void)tt_touchDragOutside:(void (^)(id sender))eventBlock;
- (void)tt_touchDragEnter:(void (^)(id sender))eventBlock;
- (void)tt_touchDragExit:(void (^)(id sender))eventBlock;
- (void)tt_touchUpInside:(void (^)(id sender))eventBlock;
- (void)tt_touchUpOutside:(void (^)(id sender))eventBlock;
- (void)tt_touchCancel:(void (^)(id sender))eventBlock;
- (void)tt_valueChanged:(void (^)(id sender))eventBlock;
- (void)tt_editingDidBegin:(void (^)(id sender))eventBlock;
- (void)tt_editingChanged:(void (^)(id sender))eventBlock;
- (void)tt_editingDidEnd:(void (^)(id sender))eventBlock;
- (void)tt_editingDidEndOnExit:(void (^)(id sender))eventBlock;

@end
