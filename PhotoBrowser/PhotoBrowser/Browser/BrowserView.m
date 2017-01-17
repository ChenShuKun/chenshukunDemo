//
//  BrowserView.m
//  PhotoBrowser
//
//  Created by chenshukun on 16/12/30.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import "BrowserView.h"
#import "KToolBar.h"
#import "Masonry.h"
#import "CQPhotoSave.h"
#import "SVProgressHUD.h"

#import "kImageScrollView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BrowserView()<KToolBarDelegate,UIScrollViewDelegate,kImageScrollViewDelegate>

@property (strong , nonatomic) NSArray *imageArray;
@property (assign , nonatomic) NSInteger index;
@property (strong , nonatomic) KToolBar *tooBar;
@property (strong , nonatomic) UIScrollView *scrollerView;
@property (strong , nonatomic) CQPhotoSave *savePhoto;

@end

@implementation BrowserView

-(instancetype)initWithImageArray:(NSArray *)imgArr andCurrentIndex:(NSInteger)currentIndex {
    self = [super init];
    if (self) {
        self.imageArray = imgArr;
        self.index = currentIndex;
        [self initSubViews];
        
    }
    return self;
}

- (void)initSubViews {
    
    self.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapAction)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    
    if (self.index >= self.imageArray.count || self.index == 0) {
        self.index = 1;
    }
    
    self.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.scrollerView.pagingEnabled = YES;
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    self.scrollerView.showsVerticalScrollIndicator = NO;
    self.scrollerView.delegate = self;
    self.scrollerView.maximumZoomScale = 3;
    self.scrollerView.minimumZoomScale = 1;
    self.scrollerView.contentSize = CGSizeMake(ScreenWidth*self.imageArray.count , ScreenHeight);
    [self.scrollerView setContentOffset:CGPointMake((self.index-1)*ScreenWidth, 0) animated:YES];
    [self addSubview:self.scrollerView];
    
    [self initBrowser];
    
    [self initLabelText];
}

- (void)initBrowser {

    for (int i = 0 ;i < self.imageArray.count; i++) {
       
        NSString *url = self.imageArray[i];
        kImageScrollView *imageView = [[kImageScrollView alloc]initWithtWithKImageViewStr:url];
        imageView.imageDelegate = self;
        imageView.frame = CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight);
        imageView.tag = 100+i;
        [self.scrollerView addSubview:imageView];
        [self.tooBar setSaveButtonWthTag:200+i];
    }
}

//下面的 文字和保存的按钮
- (void)initLabelText {
    
    self.tooBar = [[KToolBar alloc]initWithDelegate:self];
    [self addSubview:self.tooBar];
    
    [self setLabelIndex:self.index];
    [self.tooBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_offset(40);
        make.bottom.equalTo(self.mas_bottom).offset(-30);
    }];
}

- (void)setLabelIndex:(NSInteger)current {
    NSString *str = [NSString stringWithFormat:@"%@/%@",@(current),@(self.imageArray.count)];
    [self.tooBar setLabelText:str];
}

#pragma mark:-- action
- (void)buttonAction:(UIButton *)button {
    
    int x = self.scrollerView.contentOffset.x / ScreenWidth;
    if (self.imageArray.count >= x) {
        
        kImageScrollView *imageView = (kImageScrollView *)[self.scrollerView viewWithTag:100+x];
        __weak typeof(self) weak = self;
        UIImage *image = [imageView scrollViewImage];
        
        [self.savePhoto saveImageToPhoto:image andComplete:^(code errorCode, NSString *errorStr) {
            [weak savePhotoActionWithType:errorCode andMessage:errorStr];
        }];
    }
}

- (CQPhotoSave *)savePhoto {
    if (!_savePhoto) {
        _savePhoto = [[CQPhotoSave alloc]init];
    }
    return _savePhoto;
}

- (void)savePhotoActionWithType:(code)errorCode andMessage:(NSString *)mesg {
   
    if (errorCode == code_ToMyPhotoSucceed) {
        [SVProgressHUD setMinimumDismissTimeInterval:2];
        [SVProgressHUD showSuccessWithStatus:@"保存到相册成功"];
    }else {
        NSLog(@"保存失败  errorInfo = %@",mesg);
        [SVProgressHUD showErrorWithStatus:mesg];
    }
}


#pragma mark:-- 隐藏 aciton
- (void)singleTapAction {
    [self hiddenView];
}

- (void)show {
    [UIView animateWithDuration:0.75 animations:^{
        self.alpha = 1;
    }];
}

- (void)hiddenView {
    [UIView animateWithDuration:0.75 animations:^{
        self.alpha = 0;
        [self removeFromSuperview];
    }];
}

#pragma mark:-- UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int x = scrollView.contentOffset.x / ScreenWidth;
    [self setLabelIndex:x+1];
}

@end
