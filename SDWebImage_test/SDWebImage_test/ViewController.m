//
//  ViewController.m
//  SDWebImage_test
//
//  Created by Timmy on 2016/11/25.
//  Copyright © 2016年 ysw.com. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "UIImageView+ProgressBar.h"
#import "UIImage+LMImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *blurImV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)downloadImage:(id)sender {
    NSURL *url_image = [NSURL URLWithString:@"http://bpic.588ku.com/back_pic/04/20/95/35582ecd9d59829.jpg!qianku1198"];
    UIImage *placeHolderImage = [UIImage imageNamed:@"萌萌哒"];
    
    __weak __typeof(self) wself = self;
    
    [self.imageView sd_setImageWithURL:url_image placeholderImage:placeHolderImage options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"receivedSize:%ld,expectedSize:%ld",receivedSize,expectedSize);
        //显示进度条
        [wself.imageView addProgressBarWithBgColor:[UIColor orangeColor] height:5.f receiveSize:receivedSize exceptedSize:expectedSize];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"error:%@",error.description);
            return;
        }
        //高斯 模糊化效果
//        self.blurImV.image = [image blurredImageWithRadius:8 iterations:2 tintColor:nil];
        self.blurImV.image = [[UIImage imageFromView:self.imageView withSize:self.imageView.frame.size] blurredImageWithRadius:10 iterations:2 tintColor:nil];
        NSLog(@"cacheType:%ld",(long)cacheType);
        
    }];
    
}


@end
