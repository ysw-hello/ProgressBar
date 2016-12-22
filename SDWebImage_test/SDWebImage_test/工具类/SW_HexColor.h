//
//  SW_HexColor.h
//  SDWebImage_test
//
//  Created by Timmy on 2016/11/29.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

@interface SW_HexColor : NSObject

/// 16进制颜色转UIColor 透明度为 1
+ (UIColor *)hexColor:(NSString *)colorString;

/// 16进制颜色转UIColor 透明度为 alp
+ (UIColor *)hexColor:(NSString *)colorString alpha:(CGFloat)alp;


@end
