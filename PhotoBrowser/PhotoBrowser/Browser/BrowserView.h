//
//  BrowserView.h
//  PhotoBrowser
//
//  Created by chenshukun on 16/12/30.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserView : UIView

-(instancetype)initWithImageArray:(NSArray *)imgArr andCurrentIndex:(NSInteger)currentIndex;

- (void)show;
- (void)hiddenView;

@end
