//
//  KToolBar.m
//  PhotoBrowser
//
//  Created by chenshukun on 16/12/30.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import "KToolBar.h"
#import "Masonry.h"
@interface KToolBar()

@property (weak , nonatomic) id<KToolBarDelegate> delegate;

@property (weak , nonatomic) UIButton *saveButton;
@property (weak , nonatomic) UILabel *label;

@end

@implementation KToolBar


-(instancetype)initWithDelegate:(id<KToolBarDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        [self initSubViews];
        
    }
    return self;
}

- (void)initSubViews {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font =[UIFont systemFontOfSize:15];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    self.saveButton = button;
    [self.saveButton addTarget:self action:@selector(saveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    self.label = label;
    [self addSubview:label];
    
    [self makeConstranints];
}

- (void)makeConstranints {
    [self.saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-24);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(24);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height);
    }];
}

#pragma mark:-- action
- (void)saveBtnAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(buttonAction:)]) {
        [self.delegate buttonAction:button];
    }
}
- (void)setLabelText:(NSString *)text {
    self.label.text = text;
}

- (void)setSaveButtonWthTag:(int)tag {
    self.saveButton.tag = tag;
}


@end
