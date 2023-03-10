

#import <UIKit/UIKit.h>
@class YZBottomSelectView;

/**
 * block回调方法
 *
 * @param   bootomSelectView    YZBottomSelectView对象本身
 * @param   index               被点击按钮序列号，取消：0，删除：-1，其他：1.2.3...
 */
typedef void(^YZBottomSelectViewBlock)(YZBottomSelectView *bootomSelectView, NSInteger index);

@interface YZBottomSelectView : UIView

/**
 * 快速创建并展示YZBottomSelectView视图
 *
 * @param   title                   提示文本
 * @param   cancelButtonTitle       取消按钮文本
 * @param   destructiveButtonTitle  删除按钮文本
 * @param   otherButtonTitles       其他按钮文本
 * @param   bottomSelectViewBlock   block回调
 */
+ (void)showBottomSelectViewWithTitle:(NSString *)title
                          description:(NSString *)description
                    cancelButtonTitle:(NSString *)cancelButtonTitle
               destructiveButtonTitle:(NSString *)destructiveButtonTitle
                    otherButtonTitles:(NSArray *)otherButtonTitles
                              handler:(YZBottomSelectViewBlock)bottomSelectViewBlock;

+ (void)showCenterImage:(UIImage *)centerImage withButtonTitle:(NSString *)title
                                                   showexitBtn:(BOOL)show
                                                       content:(NSString *)content;

@end
