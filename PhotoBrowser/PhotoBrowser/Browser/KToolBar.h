//
//  KToolBar.h
//  PhotoBrowser
//
//  Created by chenshukun on 16/12/30.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KToolBarDelegate <NSObject>

- (void)buttonAction:(UIButton *)button;

@end

@interface KToolBar : UIView

-(instancetype)initWithDelegate:(id<KToolBarDelegate>)delegate;

- (void)setLabelText:(NSString *)text;

- (void)setSaveButtonWthTag:(int)tag;

@end
