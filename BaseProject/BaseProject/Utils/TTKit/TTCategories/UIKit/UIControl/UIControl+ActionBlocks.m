//
//  UIControl+ActionBlocks.m
//  Pods
//
//  Created by tao6 on 2017/8/31.
//
//

#import "UIControl+ActionBlocks.h"
#import <objc/runtime.h>

#define TT_UICONTROL_EVENT(methodName, eventName) \
-(void)methodName : (void (^)(id sender))eventBlock \
{ \
    objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC); \
    [self addTarget:self \
             action:@selector(methodName##Action:) \
   forControlEvents:UIControlEvent##eventName]; \
}\
-(void)methodName##Action:(id)sender \
{ \
    void (^block)(id sender) = objc_getAssociatedObject(self, @selector(methodName:)); \
    if (block) { \
        block(sender); \
    } \
}

@implementation UIControl (ActionBlocks)

TT_UICONTROL_EVENT(tt_touchDown, TouchDown)
TT_UICONTROL_EVENT(tt_touchDownRepeat, TouchDownRepeat)
TT_UICONTROL_EVENT(tt_touchDragInside, TouchDragInside)
TT_UICONTROL_EVENT(tt_touchDragOutside, TouchDragOutside)
TT_UICONTROL_EVENT(tt_touchDragEnter, TouchDragEnter)
TT_UICONTROL_EVENT(tt_touchDragExit, TouchDragExit)
TT_UICONTROL_EVENT(tt_touchUpInside, TouchUpInside)
TT_UICONTROL_EVENT(tt_touchUpOutside, TouchUpOutside)
TT_UICONTROL_EVENT(tt_touchCancel, TouchCancel)
TT_UICONTROL_EVENT(tt_valueChanged, ValueChanged)
TT_UICONTROL_EVENT(tt_editingDidBegin, EditingDidBegin)
TT_UICONTROL_EVENT(tt_editingChanged, EditingChanged)
TT_UICONTROL_EVENT(tt_editingDidEnd, EditingDidEnd)
TT_UICONTROL_EVENT(tt_editingDidEndOnExit, EditingDidEndOnExit)


@end
