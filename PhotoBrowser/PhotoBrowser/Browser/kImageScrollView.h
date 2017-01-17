//
//  kImageScrollView.h
//  PhotoBrowser
//
//  Created by chenshukun on 17/1/17.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol kImageScrollViewDelegate <NSObject>

@optional;
- (void)singleTapAction;
- (void)doubleTapActionWithGesture:(UITapGestureRecognizer *)tap;

@end

@interface kImageScrollView : UIScrollView

- (instancetype)initWithtWithKImageViewStr:(NSString *)imageurl;

@property (weak, nonatomic) id<kImageScrollViewDelegate> imageDelegate;

- (UIImage *)scrollViewImage;


@end
