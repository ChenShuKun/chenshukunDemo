//
//  kImageScrollView.m
//  PhotoBrowser
//
//  Created by chenshukun on 17/1/17.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

#import "kImageScrollView.h"
#import "UIImageView+WebCache.h"
#import <Masonry.h>

const CGFloat maxZoomScale = 3;
const CGFloat minZoomScale = 1;

@interface kImageScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *acitivtyView;
@property (nonatomic, strong)  UIImageView *imageView;

@end


@implementation kImageScrollView {
    BOOL tapClicks;
}

- (instancetype)initWithtWithKImageViewStr:(NSString *)imageurl {
    self = [super init];
    if (self) {
        [self initSubViews];
        [self loadImageWithUrl:imageurl];
    }
    return self;
}

- (void)initSubViews {
    
    self.showsVerticalScrollIndicator =NO;
    self.showsHorizontalScrollIndicator =NO;
    self.maximumZoomScale = maxZoomScale;
    self.minimumZoomScale = minZoomScale;
    self.delegate = self;
    tapClicks = NO;
    
    //图片
    self.imageView = [[UIImageView alloc]init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.center.equalTo(self);
    }];
    
    //点击手势
    UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleAction:)];
    single.numberOfTapsRequired = 1;
    [self.imageView addGestureRecognizer:single];
    
    //双击手势
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.imageView  addGestureRecognizer:doubleTap];
    [single requireGestureRecognizerToFail:doubleTap];
}
//通过 imagerStr 加载图片
- (void)loadImageWithUrl:(NSString*)imagerStr {
    if (imagerStr == nil || imagerStr.length == 0) {
        NSLog(@"imagerStr 异常 请检查参数");
    }
    [self.acitivtyView startAnimating];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imagerStr] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self.acitivtyView stopAnimating];
    }];
    
}

- (UIImage *)scrollViewImage {
    
    return self.imageView.image;
}

-(UIActivityIndicatorView *)acitivtyView {
    if (!_acitivtyView) {
        _acitivtyView = [[UIActivityIndicatorView alloc] init];
        _acitivtyView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self.imageView addSubview:_acitivtyView];
        [_acitivtyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    return  _acitivtyView;
}

#pragma mark:-- 单机手势
- (void)singleAction:(UITapGestureRecognizer *)tap {
    
    if ([self.imageDelegate respondsToSelector:@selector(singleTapAction)]) {
        [self.imageDelegate singleTapAction];
    }
}

#pragma mark:-- 双击手势
- (void)doubleTapAction:(UITapGestureRecognizer *)tap {

    float newScale;
    if (!tapClicks) {
        newScale = self.zoomScale * 2.0;
    } else{
        newScale = self.zoomScale * 0.0;
    }
    CGPoint point = [tap locationInView:tap.view];
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:point];
    [self zoomToRect:zoomRect animated:YES];
    tapClicks = !tapClicks;
    
}

#pragma mark - CommonMethods
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    zoomRect.size.height = self.frame.size.height / scale;
    zoomRect.size.width = self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  /2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height /2.0);
    return zoomRect;
}
#pragma mark:-- UIScrollerView
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
@end
