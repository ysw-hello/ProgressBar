//
//  UIImage+LMImage.h
//  LMFramework
//
//  Created by LMinh on 28/12/2013.
//  Copyright (c) 2013 LMinh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (LMImage)

/// 截取指定view size大小， 生成image
+ (UIImage *)imageFromView:(UIView *)theView withSize:(CGSize)size;

/// 实现image 的模糊化效果
- (UIImage *)blurredImageWithRadius:(CGFloat)radius //模糊半径
                         iterations:(NSUInteger)iterations //迭代次数
                          tintColor:(UIColor *)tintColor; //模糊后填充颜色


@end

