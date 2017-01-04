//
//  KImageView.m
//  PhotoBrowser
//
//  Created by chenshukun on 16/12/30.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import "KImageView.h"
#import "UIImageView+WebCache.h"

@implementation KImageView

- (instancetype)initWithKImageView:(NSString *)imagerStr {
    self = [super init];
    if (self) {
        [self initSubViews];
        [self sd_setImageWithURL:[NSURL URLWithString:imagerStr]];
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)initSubViews {
    
    UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleAction:)];
    single.numberOfTapsRequired = 1;
    [self addGestureRecognizer:single];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
}

#pragma mark:-- 单机手势
- (void)singleAction:(UITapGestureRecognizer *)tap {
    NSLog(@"单机手势");
}

#pragma mark:-- 双击手势
- (void)doubleTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"双击手势");
    
}


@end
