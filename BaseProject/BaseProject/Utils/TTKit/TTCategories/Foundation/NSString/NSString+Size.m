//
//  NSString+Size.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/4.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)tt_sizeWithFont:(UIFont *)font
{
    CGSize textSize = [self sizeWithAttributes:@{NSFontAttributeName : font}];
    CGSize ansSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
    return ansSize;
}

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize textSize = [self boundingRectWithSize:size
                                         options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName : font}
                                         context:nil].size;
    CGSize ansSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
    return ansSize;
}
- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    return [self tt_sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
}

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    
    CGSize textSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGSize ansSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
    return ansSize;
}

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    return [self tt_sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:lineBreakMode];
}

- (CGSize)tt_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode lineSpace:(CGFloat)lineSpace;
{
    NSMutableDictionary *attr = [NSMutableDictionary new];
    attr[NSFontAttributeName] = font;
    if (lineBreakMode != NSLineBreakByWordWrapping) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = lineBreakMode;
        attr[NSParagraphStyleAttributeName] = paragraphStyle;
    }
    else {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = lineSpace;
        attr[NSParagraphStyleAttributeName] = paragraphStyle;
    }
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attr context:nil];
    return rect.size;
}

@end
