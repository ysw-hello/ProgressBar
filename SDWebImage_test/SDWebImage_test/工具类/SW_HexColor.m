//
//  SW_HexColor.m
//  SDWebImage_test
//
//  Created by Timmy on 2016/11/29.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import "SW_HexColor.h"

@implementation SW_HexColor

+ (UIColor *)hexColor:(NSString *)colorString{
    
    return [self hexColor:colorString alpha:1.0];
}

+ (UIColor *)hexColor:(NSString *)colorString alpha:(CGFloat)alp {
    // incorrect input
    if ([colorString length] < 6) {
        return [UIColor whiteColor];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if ([colorString length] == 6) {
        colorString = [colorString stringByAppendingString:@"64"];
    }
    
    unsigned int red, green, blue, alpha;
    NSRange range;
    
    range.length = 2;
    range.location = 0;
    
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&blue];
    range.location = 6;
    
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&alpha];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:(float)(alp/1.0)];
}

@end
