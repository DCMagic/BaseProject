//
//  DateHelper.h
//  jingcaiyuanyu
//
//  Created by dongchao on 2018/8/22.
//  Copyright © 2018年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

+(NSDate*)getEarlyOrLaterDateWithBaseDate :(NSDate *)date timeInterval :(NSTimeInterval)timeInterval;

/**
 将日期转换为字符串
 
 @param date 要转换的日期
 @param formatStr 转换格式
 @return 转换后的字符串
 */
+(NSString *)getDateFromStringWithDate :(NSDate *)date formatStr :(NSString *)formatStr;

/**
 将字符串格式的日期转换为日期
 
 @param formatterStr 转换的格式
 @param dateStr 日期字符串
 @return 返回转换的日期
 */
+(NSDate *)getStringFormDateWithFormatter: (NSString *)formatterStr dateStr :(NSString *)dateStr;

/**
 将时间戳转换为日期字符串

 @param timeStr 要转换的时间戳
 @param formatStr 转换格式
 @return 转换后的字符串
 */
+(NSString *)getDateFromString :(NSString *)timeStr formatStr :(NSString *)formatStr;

/**
 判断两个日期是否为同一天
 
 @param date1 日期1
 @param date2 日期2
 @return YES同一天
 */
+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;

/**
 判断两个日期是否同年同月
 
 @param date1 日期1
 @param date2 日期2
 @return YES同一天
 */
+ (BOOL)isSameYearAndMonthWithDate1:(NSDate*)date1 date2:(NSDate*)date2;

/**
 将一个日期字符串转转为另外格式的日期字符串
 
 @param dateStr 要转换的日期字符串
 @param currentFormatterStr 当前日期字符串的日期格式
 @param toFormatterStr 要转换的日期格式
 @return 转换结果
 */
+(NSString *)getDateStrFromDateStrWithDateStr :(NSString *)dateStr currentFormatterStr :(NSString *)currentFormatterStr toFormatterStr :(NSString *)toFormatterStr;

/**
 计算两个时间相差多少秒
 
 @param dateString1 时间1
 @param dateString2 时间2
 @return 差值 为正数，则后边的时间大于前边的时间
 */
+ (NSInteger)intervalFromLastDate: (NSString *) dateString1 toTheDate:(NSString *) dateString2;

/**
 计算两个时间的时间差(xx天xx小时xx分钟的格式)
 
 @param dateString1 时间1
 @param dateString2 时间2
 @return 时间差
 */
+ (NSString *)intervalDayFromLastDate: (NSString *) dateString1 toTheDate:(NSString *) dateString2;

/**
 将秒转换为音频时间格式
 
 @param seconds 秒数
 @return 转换后的时间
 */
+(NSString *)secondToAudioTimeFormatWithSeconds :(CGFloat) seconds;

/**
 获取某一个月多少天
 
 @param date 时间
 @return 天数
 */
+ (NSInteger)getSumOfDaysWithDate :(NSDate *)date;

+(NSString *)mediaTimeConversion :(NSInteger)seconds;

#pragma mark 获取当前时间戳
+(NSTimeInterval)getNowTimeTimestamp2;

//比较两个日期的大小
+ (NSInteger)compareStartDate:(NSDate*)startDate withEndDate:(NSDate*)endDate;

//计算年龄
+ (NSString *)calculateAgeStr:(NSString *)dateStr;

@end
