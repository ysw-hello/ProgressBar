//
//  UIImageView+ProgressBar.h
//  SDWebImage_test
//
//  Created by Timmy on 2016/11/28.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ProgressBar)

/// 进度条
@property (nonatomic, strong) UIView *progressBar;

-(void)addProgressBarWithBgColor:(UIColor *)bgColor height:(CGFloat)height receiveSize:(CGFloat)receiveSize exceptedSize:(CGFloat)exceptedSize;

@end
