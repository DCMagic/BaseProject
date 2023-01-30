//
//  CommonlyUsedMethod.m
//  jingcaiyuanyu
//
//  Created by 邹旭 on 2018/5/2.
//  Copyright © 2018年 王可强. All rights reserved.
//

#import "CommonlyUsedMethod.h"
#import <AVFoundation/AVFoundation.h>
#import <CommonCrypto/CommonCrypto.h>
#include "lame.h"
#import <math.h>
#import <sys/param.h>
#import <sys/mount.h>
#import <CoreText/CoreText.h>

@implementation CommonlyUsedMethod

//根据字体和文字计算宽度
+(CGSize)sizeWithFont:(UIFont*)font andTextString:(NSString *)string{
    CGSize size = [string boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return CGSizeMake(size.width+1, size.height);
}


/***
 * 描述说明: 根据文本内容计算其高度，控件自适应文本内容
 * 参数说明:text 传入的文本字符串 font 传入的控件font(最好传入设置的文本字体大小 float) CGFloat传入的控件宽度
 * 返回值说明:，如:无用NULL表示
 ***/
+(CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font widthFloat:(CGFloat)widthfloat{
    
    CGFloat maxWidth = widthfloat;
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    CGSize textSize = CGSizeZero;
    // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine;
    //        |
    //        NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics|NSStringDrawingTruncatesLastVisibleLine
    
    //NSStringDrawingUsesDeviceMetrics  计算布局时使用图元字形（而不是印刷字体）。坑爹属性，计算行高时不用，切记
    
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : font};
    
    CGRect rect = [text boundingRectWithSize:maxSize
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    textSize = rect.size;
    
    return CGSizeMake(textSize.width, textSize.height+1);
}

#pragma mark 验证身份证是否为合法
+(BOOL)IDCodeNumber:(NSString * )identityCard
{
    
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:identityCard];
    
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(identityCard.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }
}


/**
 通过layer为view增加线条，设置duration动画时间，可以动画显示
 @param view 需要加载的view
 @param strokeColor 填充颜色
 @param startPoint 开始点
 @param endPoint 结束点
 @param duration 动画时间
 */
+(void)setLayer :(UIView*)view strokeColor :(UIColor *)strokeColor startPoint :(CGPoint)startPoint endPoint :(CGPoint)endPoint duration :(CFTimeInterval)duration lineWidth :(CGFloat)lineWidth{
    CAShapeLayer *shapeLayer= [CAShapeLayer layer];
    shapeLayer.fillColor= [UIColor clearColor].CGColor;//填充颜色为ClearColor
    //设置线条的宽度和颜色
    shapeLayer.lineWidth= lineWidth;
    shapeLayer.strokeColor= strokeColor.CGColor;
    //创建出贝塞尔曲线
    UIBezierPath*circlePath = [UIBezierPath bezierPath];
    [circlePath moveToPoint:startPoint];
    [circlePath addLineToPoint:endPoint];
    //让贝塞尔曲线与CAShapeLayer产生联系
    shapeLayer.path= circlePath.CGPath;
    //添加并显示
    [view.layer addSublayer:shapeLayer];
    CABasicAnimation*pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration=duration;
    pathAnimation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue=@0.0f;
    pathAnimation.toValue=@(1);
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}


/**
 检测摄像头
 */
+(BOOL)checkCamera :(UIViewController*)vc{
    __block BOOL isPermissions = NO;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        isPermissions = YES;
                    } else {
                        isPermissions = NO;
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                isPermissions = YES;
                break;
            }
            case AVAuthorizationStatusDenied: {
                // 没有相机权限
                isPermissions = NO;
                NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
                NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
                if (app_Name == nil) {
                    app_Name = [infoDict objectForKey:@"CFBundleName"];
                }
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"请在iPhone的”设置 - %@“选项中，允许%@访问您的相机/相册", app_Name,app_Name] preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *actionB = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] ];
                }];
                UIAlertAction *actionA = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                
                [alertC addAction:actionA];
                [alertC addAction:actionB];
                [vc presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                isPermissions = NO;
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"因为系统原因, 无法访问相机" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *actionA = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
                [alertC addAction:actionA];
                [vc presentViewController:alertC animated:YES completion:nil];
                break;
            }
                
            default:
                isPermissions = NO;
                break;
        }
        return isPermissions;
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *actionA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:actionA];
    [vc presentViewController:alertC animated:YES completion:nil];
    return isPermissions;
}


/**
 判断字符串是否全部为数字
 
 @param str 字符串
 @return YES全为数字
 */
+(BOOL)deptNumInputShouldNumber:(NSString *)str{
    
    if (str.length == 0) {
        return YES;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}

/**
 压缩图片宽高

 @param image 要压缩的图片
 @param targetWidth 目标宽
 @param targetHeight 目标高
 @return 结果
 */
+ (UIImage *)imageWithOriginalWithImage:(UIImage *)image targetWidth :(CGFloat)targetWidth targetHeight :(CGFloat)targetHeight{
    // 宽高比
    CGFloat ratio = image.size.width/image.size.height;
    
    // 目标大小
    CGFloat targetW = targetWidth;
    CGFloat targetH = targetHeight;
    
    // 宽高均 <= 1280，图片尺寸大小保持不变
    if (image.size.width<targetWidth && image.size.height<targetHeight) {
        return image;
    }
    // 宽高均 > 1280 && 宽高比 > 2，
    else if (image.size.width>targetWidth && image.size.height>targetHeight){
        
        // 宽大于高 取较小值(高)等于1280，较大值等比例压缩
        if (ratio>1) {
            targetH = targetHeight;
            targetW = targetH * ratio;
        }
        // 高大于宽 取较小值(宽)等于1280，较大值等比例压缩 (宽高比在0.5到2之间 )
        else{
            targetW = targetWidth;
            targetH = targetW / ratio;
        }
        
    }
    // 宽或高 > 1280
    else{
        // 宽图 图片尺寸大小保持不变
        if (ratio>2) {
            targetW = image.size.width;
            targetH = image.size.height;
        }
        // 长图 图片尺寸大小保持不变
        else if (ratio<0.5){
            targetW = image.size.width;
            targetH = image.size.height;
        }
        // 宽大于高 取较大值(宽)等于1280，较小值等比例压缩
        else if (ratio>1){
            targetW = targetWidth;
            targetH = targetW / ratio;
        }
        // 高大于宽 取较大值(高)等于1280，较小值等比例压缩
        else{
            targetH = targetHeight;
            targetW = targetH * ratio;
        }
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(targetW, targetH));
    [image drawInRect:CGRectMake(0,0,targetW, targetH)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 压缩图片到指定宽高
 
 @param image 要压缩的图片
 @return 结果
 */
+ (UIImage *)imageWithOriginalImage:(UIImage *)image width :(CGFloat)width height :(CGFloat)height{
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image drawInRect:CGRectMake(0,0,width, height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 行图像的画面质量压缩
 
 @param sourceImage 压缩的图片
 @param maxSize 质量
 @return 结果
 */
+(UIImage *)zipNSDataWithMaxSize :(NSInteger)maxSize image:(UIImage *)sourceImage {
    NSData *data=UIImageJPEGRepresentation(sourceImage, 0.9);
    NSInteger size = data.length/1024;
    NSLog(@"%ld",size);
    if (size > maxSize) {
        [CommonlyUsedMethod zipNSDataWithMaxSize:maxSize image:[UIImage imageWithData:UIImageJPEGRepresentation(sourceImage, 0.9)]];
    }
    return sourceImage;
}

+(UIImage *)compressBySizeWithMaxLength:(NSUInteger)maxLength image:(UIImage *)sourceImage{
    UIImage *resultImage = sourceImage;
    NSData *data = UIImageJPEGRepresentation(resultImage, 1);
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        // Use image to draw (drawInRect:), image is larger but more compression time
        // Use result image to draw, image is smaller but less compression time
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, 1);
    }
    
    return [UIImage imageWithData:data];
}

/**
 行图像的画面质量压缩

 @param sourceImage 压缩的图片
 @return 结果
 */
+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage{
    //进行图像的画面质量压缩
    NSData *data=UIImageJPEGRepresentation(sourceImage, 1.0);
    NSInteger size = data.length/1024;
    if (size > 2000) {
        data= UIImageJPEGRepresentation(sourceImage, 0.1);
    }else if (size > 1000){
        data= UIImageJPEGRepresentation(sourceImage, 0.2);
    }else if (size > 700){
        data= UIImageJPEGRepresentation(sourceImage, 0.3);
    }else if (size > 500){
        data= UIImageJPEGRepresentation(sourceImage, 0.4);
    }else if (size > 400){
        data= UIImageJPEGRepresentation(sourceImage, 0.5);
    }else if (size > 300){
        data= UIImageJPEGRepresentation(sourceImage, 0.6);
    }else if (size > 280){
        data= UIImageJPEGRepresentation(sourceImage, 0.7);
    }else if (size > 250){
        data= UIImageJPEGRepresentation(sourceImage, 0.8);
    }else if (size > 220){
        data= UIImageJPEGRepresentation(sourceImage, 0.9);
    }
    return data;
}

//判断是否为手机号
+ (BOOL) validateMobile:(NSString *)mobile
{
    if (mobile.length == 0) {
        return NO;
    }
    
    if (mobile.length == 11 && [mobile hasPrefix:@"1"] && [CommonlyUsedMethod isPureNum:mobile]){
        return YES;
    }
    return NO;
}

//判断是否为邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


/**
 判断是否全部为数字

 @param string 字符串
 @return YES是
 */
+(BOOL)isPureNum:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

//判断是否为密码
+ (BOOL) validatePassword:(NSString *)passWord{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,12}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

// 判断是否为数字加字母
+ (BOOL) validateDigitalAndLetter:(NSString *)str{
    NSString *regex = @"^[a-zA-Z0-9]+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [passWordPredicate evaluateWithObject:str];
}


/**
 传入view，生成一张图片

 @param view 要生成图片的view
 @return 生成的图片
 */
+ (UIImage*) imageWithUIView:(UIView*) view{

    
    UIGraphicsBeginImageContext(view.bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}


/**
 caf格式转换为mp3
 
 @param filePath caf路径
 @param mp3FilePath mp3路径
 */
+ (BOOL)autioCafConversionMp3WithCafFilePath :(NSString *)filePath mp3FilePath :(NSString *)mp3FilePath{
    BOOL isSuccess = NO;
    if (filePath == nil  || mp3FilePath == nil){
        return isSuccess;
    }
    NSFileManager* fileManager=[NSFileManager defaultManager];
    if([fileManager removeItemAtPath:mp3FilePath error:nil])
    {
        NSLog(@"删除");
    }
    
    @try {
        int read, write;
        
        FILE *pcm = fopen([filePath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");  //output 输出生成的Mp3文件位置
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 8000);
        lame_set_VBR(lame, vbr_default);
        lame_set_brate(lame,16);
        lame_set_num_channels(lame,2);//默认为2双通道
        lame_set_quality(lame,5); /* 2=high 5 = medium 7=low 音质*/
        
        lame_init_params(lame);
        
        
        do {
            read = (int)fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
        isSuccess = YES;
    }
    @catch (NSException *exception) {
        NSLog(@"error");
    }
    @finally {
        return isSuccess;
    }
}

+ (NSString *)toMp3:(NSString*)cafFileName{
    
    NSString *cafFilePath =cafFileName;
    
    NSDateFormatter *fileNameFormat=[[NSDateFormatter alloc] init];
    [fileNameFormat setDateFormat:@"yyyyMMddHHmmss"];
    NSString *mp3FileName = [fileNameFormat stringFromDate:[NSDate date]];
    mp3FileName = [mp3FileName stringByAppendingString:@".mp3"];
    NSString *mp3FilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:mp3FileName];
    
    @try {
        int read, write;
        
        FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");//被转换的文件
        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");//转换后文件的存放位置
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 44100);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
    }
    @finally {
        return mp3FilePath;
    }
    return nil;
}


/**
 判断是否全部为汉字

 @param str nil
 @return nil
 */
+ (BOOL) deptNameInputShouldChinese :(NSString *)str{
    
    NSString *regex = @"[\u4e00-\u9fa5]+";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    if (![pred evaluateWithObject:str]) {
        return YES;
    }
    
    return NO;
    
}

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
+ (CGSize)sizeLabelToFit:(NSAttributedString *)aString font :(UIFont *)font width:(CGFloat)width height:(CGFloat)height {
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    tempLabel.font = font;
    tempLabel.attributedText = aString;
    tempLabel.numberOfLines = 0;
    [tempLabel sizeToFit];
    CGSize size = tempLabel.frame.size;
    size = CGSizeMake(ceilf(size.width)+1, ceilf(size.height)+1);
    return size;
}

//将按钮设置为图片在上，文字在下
+(void)initButton:(UIButton*)btn spacing :(CGFloat)spacing{
    
    CGSize imageSize = btn.imageView.frame.size;
    CGSize titleSize = btn.titleLabel.frame.size;
    CGSize textSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    btn.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}


/**
 判断字符串是否是URL

 @param path 路径
 @return YES是URL
 */
+(BOOL)judgeIsUrlWithStr :(NSString *)path{
    if ([path hasPrefix:@"http://"] || [path hasPrefix:@"https://"]) {
        return YES;
    }
    return NO;
}

/*!
 *  函数名称：
 *  函数描述：根据传入的颜色生成一张纯色的图片
 *  返回参数：生成的图片
 *  参数描述：color颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/*!
 *  函数名称：
 *  函数描述：根据传入的颜色生成一张纯色的图片
 *  返回参数：生成的图片
 *  参数描述：color颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color width :(CGFloat)width height :(CGFloat)height{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - 图片压缩
+ (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize {
    //先判断当前质量是否满足要求，不满足再进行压缩
    __block NSData *finallImageData = UIImageJPEGRepresentation(sourceImage,1.0);
    NSUInteger sizeOrigin   = finallImageData.length;
    NSUInteger sizeOriginKB = sizeOrigin / 1000;
    
    if (sizeOriginKB <= maxSize) {
        return finallImageData;
    }
    
    //获取原图片宽高比
    CGFloat sourceImageAspectRatio = sourceImage.size.width/sourceImage.size.height;
    //先调整分辨率
    CGSize defaultSize = CGSizeMake(1024, 1024/sourceImageAspectRatio);
    UIImage *newImage = [CommonlyUsedMethod newSizeImage:defaultSize image:sourceImage];
    
    finallImageData = UIImageJPEGRepresentation(newImage,1.0);
    
    //保存压缩系数
    NSMutableArray *compressionQualityArr = [NSMutableArray array];
    CGFloat avg   = 1.0/250;
    CGFloat value = avg;
    for (int i = 250; i >= 1; i--) {
        value = i*avg;
        [compressionQualityArr addObject:@(value)];
    }
    
    /*
     调整大小
     说明：压缩系数数组compressionQualityArr是从大到小存储。
     */
    //思路：使用二分法搜索
    finallImageData = [CommonlyUsedMethod halfFuntion:compressionQualityArr image:newImage sourceData:finallImageData maxSize:maxSize];
    //如果还是未能压缩到指定大小，则进行降分辨率
    while (finallImageData.length == 0) {
        //每次降100分辨率
        CGFloat reduceWidth = 100.0;
        CGFloat reduceHeight = 100.0/sourceImageAspectRatio;
        if (defaultSize.width-reduceWidth <= 0 || defaultSize.height-reduceHeight <= 0) {
            break;
        }
        defaultSize = CGSizeMake(defaultSize.width-reduceWidth, defaultSize.height-reduceHeight);
        UIImage *image = [CommonlyUsedMethod newSizeImage:defaultSize
                                      image:[UIImage imageWithData:UIImageJPEGRepresentation(newImage,[[compressionQualityArr lastObject] floatValue])]];
        finallImageData = [CommonlyUsedMethod halfFuntion:compressionQualityArr image:image sourceData:UIImageJPEGRepresentation(image,1.0) maxSize:maxSize];
    }
    
    return finallImageData;
}

#pragma mark 调整图片分辨率/尺寸（等比例缩放）
+ (UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage {
    CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    } else if (tempHeight > 1.0 && tempWidth < tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark 二分法
+ (NSData *)halfFuntion:(NSArray *)arr image:(UIImage *)image sourceData:(NSData *)finallImageData maxSize:(NSInteger)maxSize {
    NSData *tempData = [NSData data];
    NSUInteger start = 0;
    NSUInteger end = arr.count - 1;
    NSUInteger index = 0;
    
    NSUInteger difference = NSIntegerMax;
    while(start <= end) {
        index = start + (end - start)/2;
        
        finallImageData = UIImageJPEGRepresentation(image,[arr[index] floatValue]);
        
        NSUInteger sizeOrigin = finallImageData.length;
        NSUInteger sizeOriginKB = sizeOrigin / 1024;
        NSLog(@"当前降到的质量：%ld", (unsigned long)sizeOriginKB);
        NSLog(@"\nstart：%zd\nend：%zd\nindex：%zd\n压缩系数：%lf", start, end, (unsigned long)index, [arr[index] floatValue]);
        
        if (sizeOriginKB > maxSize) {
            start = index + 1;
        } else if (sizeOriginKB < maxSize) {
            if (maxSize-sizeOriginKB < difference) {
                difference = maxSize-sizeOriginKB;
                tempData = finallImageData;
            }
            if (index<=0) {
                break;
            }
            end = index - 1;
        } else {
            break;
        }
    }
    return tempData;
}


/**
 获取当前设备可用存储空间

 @return 可用存储空间，单位byte
 */
+ (CGFloat) freeDiskSpaceInBytes{
    struct statfs buf;
    long long freespace = -1;
    if(statfs("/var", &buf) >= 0){
        freespace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    return freespace;
}

// runtime创建class
+ (UIViewController *)runtimeCreateClass:(NSString *)vcName dic:(NSDictionary *)dic{
    //类名(对象名)
    
    NSString *class = vcName;
    
    const char *className = [class cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    if (!newClass) {
        //创建一个类
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        //注册你创建的这个类
        objc_registerClassPair(newClass);
    }
    // 创建对象(写到这里已经可以进行随机页面跳转了)
    id instance = [[newClass alloc] init];
    
    //下面是传值－－－－－－－－－－－－－－
    [self assignmentClass:instance dic:dic];
    
    return instance;
}

+(void)assignmentClass :(id)instance dic :(NSDictionary *)dic{
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
            //kvc给属性赋值
            NSLog(@"%@,%@",obj,key);
            [instance setValue:obj forKey:key];
        }else {
            NSLog(@"不包含key=%@的属性",key);
        }
    }];
}

/**
 *  检测对象是否存在该属性
 */
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance
                                                           class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    // 再遍历父类中的属性
    Class superClass = class_getSuperclass([instance class]);
    
    //通过下面的方法获取属性列表
    unsigned int outCount2;
    objc_property_t *properties2 = class_copyPropertyList(superClass, &outCount2);
    
    for (int i = 0 ; i < outCount2; i++) {
        objc_property_t property2 = properties2[i];
        //  属性名转成字符串
        NSString *propertyName2 = [[NSString alloc] initWithCString:property_getName(property2) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName2 isEqualToString:verifyPropertyName]) {
            free(properties2);
            return YES;
        }
    }
    free(properties2); //释放数组
    
    return NO;
}

/**
 获取音视频总时长
 
 @param url 路径
 @return 总时长
 */
+ (NSInteger)getVideoInfoWithSourceUrl:(NSString *)url{
    
    AVURLAsset * asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:url]];
    CMTime   time = [asset duration];
    NSInteger audioDurationSeconds = (NSInteger)CMTimeGetSeconds(time);
    if (isnan(audioDurationSeconds)) {
        return 0;
    }
    return audioDurationSeconds;
}


/**
 获取网络文件大小

 @param url 网络地址
 @param fileLengthBlock 大小回调
 */
+ (void)getUrlFileLength:(NSString *)url fileLengthBlock :(void(^)(long long length, NSError *error))fileLengthBlock{
    
    NSMutableURLRequest *mURLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [mURLRequest setHTTPMethod:@"HEAD"];
    mURLRequest.timeoutInterval = 5.0;
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:mURLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [(NSHTTPURLResponse *)response allHeaderFields];
        NSNumber *length = [dict objectForKey:@"Content-Length"];
        fileLengthBlock([length longLongValue],error);
    }];
    [task resume];
}




/**
 获取网络视频的缩略图

 @param URL 视频地址
 @param videoTime 获取多少秒的
 @return 缩略图
 */
+ (UIImage *)getThumbnailImageFromVideoURL:(NSURL *)URL time:(NSTimeInterval )videoTime{
    
    if (!URL) return nil;
    
    UIImage *shotImage;
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:URL options:nil];
    
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time = CMTimeMakeWithSeconds(videoTime, 600);
    
    NSError *error = nil;
    
    CMTime actualTime;
    
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    shotImage = [[UIImage alloc] initWithCGImage:image];
    
    CGImageRelease(image);
    
    return shotImage;
}

/**
 获取网络视频的缩略图和总时间
 
 @param URL 视频地址
 @param videoTime 获取多少秒的
 @return 缩略图+总时间
 */
+ (NSDictionary *)getThumbnailImageAndAllTimeFromVideoURL:(NSURL *)URL videoTime:(NSTimeInterval )videoTime{
    
    if (!URL) return nil;
    
    UIImage *shotImage;
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:URL options:nil];
    
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time = CMTimeMakeWithSeconds(videoTime, 600);
    
    NSError *error = nil;
    
    CMTime actualTime;
    
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    shotImage = [[UIImage alloc] initWithCGImage:image];
    
    CGImageRelease(image);
    
    CMTime   allTime = [asset duration];
    NSInteger audioDurationSeconds = (NSInteger)CMTimeGetSeconds(allTime);
    
    return @{@"img" : shotImage == nil ? [UIImage new] : shotImage,@"allTime" : [NSString stringWithFormat:@"%ld",audioDurationSeconds],@"url":URL.absoluteString};
}


/**
 将数字换转为中文

 @param number 数字
 @return 中文数字
 */
+(NSString *)numberConversionChinese :(NSInteger)number{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
    formatter.locale = locale;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithInteger: number]];
    return string;
}


// 百度转高德 粗略转换，误差不大
+ (CLLocationCoordinate2D )gaodeToBdWith :(CLLocationCoordinate2D)location {
    
    double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
    double x = location.longitude;
    double y = location.latitude;
    double z = sqrt(x*x + y*y) + 0.00002*sin(y*x_pi);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
    double bdlon = z * cos(theta) + 0.0065;
    double bdlat = z * sin(theta) + 0.006;
    
    CLLocationCoordinate2D returnLocation;
    returnLocation.longitude = bdlon;
    returnLocation.latitude = bdlat;
    return returnLocation;
}


//高德转百度 粗略转换，误差不大
+ (CLLocationCoordinate2D)bdToGaodeWith :(CLLocationCoordinate2D)location {
    
    double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
    double x = location.longitude - 0.0065;
    double y = location.latitude - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);

    double bdlon = z * cos(theta);
    double bdlat = z * sin(theta);
    
    CLLocationCoordinate2D returnLocation;
    returnLocation.longitude = bdlon;
    returnLocation.latitude = bdlat;
    return returnLocation;
}

/**
 计算文字需要显示多少行
 
 @param str 需要显示的文字
 @param font 字体
 @param width 显示控件宽度
 @return 需要显示的行数
 */
+ (NSInteger)getLineNum:(NSString*)str font:(UIFont*)font labelWidth:(CGFloat)width {
    if (str.length < 1) {
        return 0;
    }
    CGSize textSize = [CommonlyUsedMethod sizeForNoticeTitle:str font:font widthFloat:width];
    CGFloat oneRowHeight = [@"四四" sizeWithAttributes:@{NSFontAttributeName:font}].height;
    NSInteger rows = textSize.height / oneRowHeight;
    return rows;
}



/// a判断app本地版本与服务器版本的大小,版本号规则一旦确认，不能进行更改。
/// @param currentVersion 本地版本
/// @param serverVersion 服务器版本
/// return YES本地版本低于服务器版本，需要更新
+(BOOL) determineLocalAndServerVersion :(NSString *)currentVersion serverVersion :(NSString *)serverVersion {
    if (currentVersion.length == 0 || serverVersion == 0) {
        return false;
    }
    if ([currentVersion compare:serverVersion] == NSOrderedDescending || [currentVersion compare:serverVersion] == NSOrderedSame) {
        return false;
    }
    return true;
}


@end
