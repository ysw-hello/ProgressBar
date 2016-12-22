//
//  UIImageView+ProgressBar.m
//  SDWebImage_test
//
//  Created by Timmy on 2016/11/28.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import "UIImageView+ProgressBar.h"
#import <objc/runtime.h>

@implementation UIImageView (ProgressBar)

#pragma mark - 从xib 创建初始化

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.progressBar = [[UIView alloc] init];
        [self addSubview:self.progressBar];
    }
    return self;
}
#pragma mark - 从代码 创建初始化

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.progressBar = [[UIView alloc] init];
        [self addSubview:self.progressBar];
    }
    return self;
}

#pragma mark - Setter/Getter_Property

-(void)setProgressBar:(UIView *)progressBar{
    objc_setAssociatedObject(self, _cmd, progressBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)progressBar{
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - public method_IMP

-(void)addProgressBarWithBgColor:(UIColor *)bgColor height:(CGFloat)height receiveSize:(CGFloat)receiveSize exceptedSize:(CGFloat)exceptedSize{
    
    self.progressBar.frame = CGRectMake(0, CGRectGetHeight(self.frame) - height, CGRectGetWidth(self.frame) * receiveSize/(float)exceptedSize, height);
    self.progressBar.backgroundColor = bgColor;
    
    if (receiveSize == exceptedSize) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.progressBar removeFromSuperview];
        });
    }
}

@end
