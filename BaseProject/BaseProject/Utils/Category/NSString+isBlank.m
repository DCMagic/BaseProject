//
//  NSString+isBlank.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "NSString+isBlank.h"

@implementation NSString (isBlank)

+ (BOOL)isBlank:(NSString*)str {
    BOOL ret = NO;
    if ((str == nil)|| (str == NULL) || ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) || [str isKindOfClass:[NSNull class]]) {
        ret = YES;
    }
    return ret;
}

+ (BOOL)isPhoneNumber:(NSString *)string {
    if (![string hasPrefix:@"1"]) {
        return NO;
    }
    NSString * MOBILE = @"^[1-9]\\d{10}$";
    NSPredicate *regextestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return  [regextestMobile evaluateWithObject:string];
}

+ (BOOL)isTelephones:(NSString *)string {
    NSString * MOBILE = @"^[1-9]\\d{7}$";
    NSPredicate *regextestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return  [regextestMobile evaluateWithObject:string];
}

@end
