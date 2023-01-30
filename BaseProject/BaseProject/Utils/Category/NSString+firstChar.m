//
//  NSString+firstChar.m
//  BaseProject
//
//  Created by dongchao on 2022/3/21.
//

#import "NSString+firstChar.h"

@implementation NSString (firstChar)

- (NSString*)firstChar {
    if([NSString isBlank:self]) {
         return @"#";
    }
    NSMutableString *source = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *str = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *ss = [[NSString stringWithFormat:@"%@",[source substringToIndex:1]] uppercaseString];
    if([str rangeOfString:ss].location == NSNotFound) {
        return @"#";
    }
    return ss;
}

@end
