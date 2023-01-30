//
//  CommonlyUsedMethod.h
//  jingcaiyuanyu
//
//  Created by 邹旭 on 2018/5/2.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DocDetailMediationModel;

@interface CommonlyUsedMethod : NSObject

#pragma mark - 根据字体和文字计算宽度
/**
 根据字体和文字计算宽度

 @param font 字体大小
 @param string 文字
 @return 文字宽度高度
 */
+(CGSize)sizeWithFont:(UIFont*)font andTextString:(NSString *)string;


#pragma mark - 根据文本内容计算其高度，控件自适应文本内容
/***
 * 描述说明: 根据文本内容计算其高度，控件自适应文本内容
 * 参数说明:text 传入的文本字符串 font 传入的控件font(最好传入设置的文本字体大小 float) CGFloat传入的控件宽度
 * 返回值说明:，如:无用NULL表示
 ***/
+(CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font widthFloat:(CGFloat)widthfloat;


#pragma mark 验证身份证是否为合法
/**
 验证身份证是否为合法

 @param identityCard 身份证号码
 @return 是否合法，YES合法，NO不合法
 */
+(BOOL)IDCodeNumber:(NSString * )identityCard;


#pragma mark - 通过layer为view增加线条，设置duration动画时间，可以动画显示
/**
 通过layer为view增加线条，设置duration动画时间，可以动画显示
 @param view 需要加载的view
 @param strokeColor 填充颜色
 @param startPoint 开始点
 @param endPoint 结束点
 @param duration 动画时间
 */
+(void)setLayer :(UIView*)view strokeColor :(UIColor *)strokeColor startPoint :(CGPoint)startPoint endPoint :(CGPoint)endPoint duration :(CFTimeInterval)duration lineWidth :(CGFloat)lineWidth;

#pragma mark 检测摄像头
/**
 检测摄像头
 */
+(BOOL)checkCamera :(UIViewController*)vc;

/**
 判断字符串是否全部为数字
 
 @param str 字符串
 @return YES全为数字
 */
+(BOOL)deptNumInputShouldNumber:(NSString *)str;

/**
 压缩图片宽高
 
 @param image 要压缩的图片
 @param targetWidth 目标宽
 @param targetHeight 目标高
 @return 结果
 */
+ (UIImage *)imageWithOriginalWithImage:(UIImage *)image targetWidth :(CGFloat)targetWidth targetHeight :(CGFloat)targetHeight;

/**
 行图像的画面质量压缩
 
 @param sourceImage 压缩的图片
 @return 结果
 */
+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage;

//判断是否为密码
+ (BOOL) validatePassword:(NSString *)passWord;

/**
 判断是否全部为数字
 
 @param string 字符串
 @return YES是
 */
+(BOOL)isPureNum:(NSString *)string;

//判断是否为手机号
+ (BOOL) validateMobile:(NSString *)mobile;

/**
 传入view，生成一张图片
 
 @param view 要生成图片的view
 @return 生成的图片
 */
+ (UIImage*) imageWithUIView:(UIView*) view;

//判断是否为邮箱
+ (BOOL) validateEmail:(NSString *)email;

/**
 caf格式转换为mp3
 
 @param filePath caf路径
 @param mp3FilePath mp3路径
 */
+ (BOOL)autioCafConversionMp3WithCafFilePath :(NSString *)filePath mp3FilePath :(NSString *)mp3FilePath;


/**
 caf转mp3

 @param cafFileName nil
 @return nil
 */
+ (NSString *)toMp3:(NSString*)cafFileName;

/**
 判断是否全部为汉字
 
 @param str nil
 @return nil
 */
+ (BOOL) deptNameInputShouldChinese :(NSString *)str;

/**
 *  返回UILabel自适应后的size
 *
 *  @param aString 字符串
 *  @param font 字体
 *  @param width   指定宽度
 *  @param height  指定高度
 *
 *  @return CGSize
 */
+ (CGSize)sizeLabelToFit:(NSAttributedString *)aString font :(UIFont *)font width:(CGFloat)width height:(CGFloat)height;

// 判断是否为数字加字母
+ (BOOL) validateDigitalAndLetter:(NSString *)str;

/**
 压缩图片到指定宽高
 
 @param image 要压缩的图片
 @return 结果
 */
+ (UIImage *)imageWithOriginalImage:(UIImage *)image width :(CGFloat)width height :(CGFloat)height;

//将按钮设置为图片在上，文字在下
+(void)initButton:(UIButton*)btn spacing :(CGFloat)spacing;


/**
 判断字符串是否是网络地址

 @param path 要判断的字符串
 @return YES是Url
 */
+(BOOL)judgeIsUrlWithStr :(NSString *)path;

/*!
 *  函数名称：
 *  函数描述：根据传入的颜色生成一张纯色的图片
 *  返回参数：生成的图片
 *  参数描述：color颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color;

/*!
 *  函数名称：
 *  函数描述：根据传入的颜色生成一张纯色的图片
 *  返回参数：生成的图片
 *  参数描述：color颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color width :(CGFloat)width height :(CGFloat)height;

/**
 行图像的画面质量压缩
 
 @param sourceImage 压缩的图片
 @param maxSize 质量
 @return 结果
 */
+(UIImage *)zipNSDataWithMaxSize :(NSInteger)maxSize image:(UIImage *)sourceImage;


+ (UIImage *)compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength;

+ (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize;

/**
 获取当前设备可用存储空间
 
 @return 可用存储空间，单位MB
 */
+ (CGFloat) freeDiskSpaceInBytes;

// runtime创建class
+ (UIViewController *)runtimeCreateClass:(NSString *)vcName dic:(NSDictionary *)dic;

+(void)assignmentClass :(id)instance dic :(NSDictionary *)dic;

/**
 获取音视频总时长
 
 @param url 路径
 @return 总时长
 */
+ (NSInteger)getVideoInfoWithSourceUrl:(NSString *)url;

/**
 获取网络文件大小
 
 @param url 网络地址
 @param fileLengthBlock 大小回调
 */
+ (void)getUrlFileLength:(NSString *)url fileLengthBlock :(void(^)(long long length, NSError *error))fileLengthBlock;

/**
 获取网络视频的缩略图
 
 @param URL 视频地址
 @param videoTime 获取多少秒的
 @return 缩略图
 */
+ (UIImage *)getThumbnailImageFromVideoURL:(NSURL *)URL time:(NSTimeInterval )videoTime;

/**
 获取网络视频的缩略图和总时间
 
 @param URL 视频地址
 @param videoTime 获取多少秒的
 @return 缩略图+总时间
 */
+ (NSDictionary *)getThumbnailImageAndAllTimeFromVideoURL:(NSURL *)URL videoTime:(NSTimeInterval )videoTime;

/**
 将数字换转为中文
 
 @param number 数字
 @return 中文数字
 */
+(NSString *)numberConversionChinese :(NSInteger)number;

// 百度转高德
+ (CLLocationCoordinate2D )bdToGaodeWith :(CLLocationCoordinate2D)location ;

//高德转百度
+ (CLLocationCoordinate2D)gaodeToBdWith :(CLLocationCoordinate2D)location;

/**
 计算文字需要显示多少行
 
 @param str 需要显示的文字
 @param font 字体
 @param width 显示控件宽度
 @return 需要显示的行数
 */
+ (NSInteger)getLineNum:(NSString*)str font:(UIFont*)font labelWidth:(CGFloat)width;

/// a判断app本地版本与服务器版本的大小
/// @param currentVersion 本地版本
/// @param serverVersion 服务器版本
/// return YES本地版本低于服务器版本，需要更新
+(BOOL) determineLocalAndServerVersion :(NSString *)currentVersion serverVersion :(NSString *)serverVersion;

@end
