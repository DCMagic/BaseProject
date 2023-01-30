//
//  DateHelper.m
//  jingcaiyuanyu
//
//  Created by dongchao on 2018/8/22.
//  Copyright © 2018年 dongchao. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+(NSDate*)getEarlyOrLaterDateWithBaseDate :(NSDate *)date timeInterval :(NSTimeInterval)timeInterval {
    NSDate *resultDate = [NSDate dateWithTimeInterval:timeInterval sinceDate:date];
    return resultDate;
}


/**
 将日期转换为字符串

 @param date 要转换的日期
 @param formatStr 转换格式
 @return 转换后的字符串
 */
+(NSString *)getDateFromStringWithDate :(NSDate *)date formatStr :(NSString *)formatStr {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatStr;
    NSString *dateStr = [format stringFromDate:date];
    return dateStr;
}


/**
 将字符串格式的日期转换为日期
 
 @param formatterStr 转换的格式
 @param dateStr 日期字符串
 @return 返回转换的日期
 */
+(NSDate *)getStringFormDateWithFormatter: (NSString *)formatterStr dateStr :(NSString *)dateStr{
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatterStr;
    [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSDate *date = [format dateFromString:dateStr];
    return date;
}

/**
 将时间戳转换为日期字符串

 @param timeStr 要转换的时间戳
 @param formatStr 转换格式
 @return 转换后的字符串
 */
+(NSString *)getDateFromString :(NSString *)timeStr formatStr :(NSString *)formatStr {
    NSTimeInterval interval=[timeStr doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:formatStr];
    NSString *str = [objDateformat stringFromDate: date];
    return str;
}



/**
 判断两个日期是否为同一天

 @param date1 日期1
 @param date2 日期2
 @return YES同一天
 */
+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2{
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year] == [comp2 year];
}


/**
 判断两个日期是否同年同月
 
 @param date1 日期1
 @param date2 日期2
 @return YES同一天
 */
+ (BOOL)isSameYearAndMonthWithDate1:(NSDate*)date1 date2:(NSDate*)date2{
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 month] == [comp2 month] && [comp1 year] == [comp2 year];
}


/**
 将一个日期字符串转转为另外格式的日期字符串

 @param dateStr 要转换的日期字符串
 @param currentFormatterStr 当前日期字符串的日期格式
 @param toFormatterStr 要转换的日期格式
 @return 转换结果
 */
+(NSString *)getDateStrFromDateStrWithDateStr :(NSString *)dateStr currentFormatterStr :(NSString *)currentFormatterStr toFormatterStr :(NSString *)toFormatterStr{
    
    NSDateFormatter *currentFormatter = [[NSDateFormatter alloc] init];
    currentFormatter.dateFormat = currentFormatterStr;
    NSDate *currentDate = [currentFormatter dateFromString:dateStr];
    
    NSDateFormatter *toFormatter = [[NSDateFormatter alloc] init];
    toFormatter.dateFormat = toFormatterStr;
    NSString *toDateStr = [toFormatter stringFromDate:currentDate];
    return toDateStr;
}


/**
 计算两个时间相差多少秒

 @param dateString1 时间1
 @param dateString2 时间2
 @return 差值
 */
+ (NSInteger)intervalFromLastDate: (NSString *) dateString1 toTheDate:(NSString *) dateString2{

    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d1 = [formatter dateFromString:dateString1];
    NSTimeInterval late1 = [d1 timeIntervalSince1970]*1;
    NSDate *d2 = [formatter dateFromString:dateString2];
    NSTimeInterval late2 = [d2 timeIntervalSince1970]*1;
    NSTimeInterval cha = late2 - late1;
    
    return cha;
}


/**
 计算两个时间的时间差(xx天xx小时xx分钟的格式)

 @param dateString1 时间1
 @param dateString2 时间2
 @return 时间差
 */
+ (NSString *)intervalDayFromLastDate: (NSString *) dateString1 toTheDate:(NSString *) dateString2{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *cal=[NSCalendar currentCalendar];
    unsigned int unitFlags=NSCalendarUnitYear| NSCalendarUnitMonth| NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *d = [cal components:unitFlags fromDate:[date dateFromString:dateString2] toDate:[date dateFromString:dateString1] options:0];
    NSString *returnStr = [NSString stringWithFormat:@"%ldmin",[d minute]];
    if ([d hour] != 0) {
        returnStr = [NSString stringWithFormat:@"%ldh%ldmin",[d hour],[d minute]];
    }
    if ([d day] != 0) {
        returnStr = [NSString stringWithFormat:@"%ldd%ldh%ldmin",[d day],[d hour],[d minute]];
    }
    return returnStr;
}


/**
 将秒转换为音频时间格式

 @param seconds 秒数
 @return 转换后的时间
 */
+(NSString *)secondToAudioTimeFormatWithSeconds :(CGFloat) seconds{
    NSInteger s = (NSInteger)seconds;
    if (s < 60) {
        return [NSString stringWithFormat:@"%ld\"",s];
    }
    NSInteger h = s/60;
    s = s%60;
    return [NSString stringWithFormat:@"%ld'%ld\"",h,s];
}


/**
 获取某一个月多少天

 @param date 时间
 @return 天数
 */
+ (NSInteger)getSumOfDaysWithDate :(NSDate *)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return range.length;
}

+(NSString *)mediaTimeConversion :(NSInteger)seconds{
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    if ([str_hour integerValue] == 0) {
        return [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    }else{
        return [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    }
}

#pragma mark 获取当前时间戳
+(NSTimeInterval)getNowTimeTimestamp2{

    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeStamp =[dat timeIntervalSince1970];
    
    return timeStamp;
}

//比较两个日期的大小
+ (NSInteger)compareStartDate:(NSDate*)startDate withEndDate:(NSDate*)endDate {
    NSComparisonResult result = [startDate compare: endDate];
    if (result==NSOrderedSame){
        //相等
        return 0;
    }else if (result == NSOrderedAscending){
        //结束时间大于开始时间
        return 1;
    }else if (result == NSOrderedDescending){
        //结束时间小于开始时间
        return -1;
    }
    return -1;
}

//计算年龄
+ (NSString *)calculateAgeStr:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *birthDate =  [formatter dateFromString:dateStr];
    
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:birthDate];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return [NSString stringWithFormat:@"%ld",(long)iAge];
}

@end
