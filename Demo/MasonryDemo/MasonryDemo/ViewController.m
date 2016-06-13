//
//  ViewController.m
//  MasonryDemo
//
//  Created by ChenShuKun on 16/6/12.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *backGroundView;
@property (strong, nonatomic) IBOutlet UIImageView *headerImg;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *inforLabel;
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *imageView;
//@property (weak, nonatomic) IBOutlet UIView *footerView;
//@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
//@property (weak, nonatomic) IBOutlet UILabel *liulanCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [_backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
     
    //相同的 效果
//        make.top.equalTo(self.view.mas_top).offset(100);
//        make.left.equalTo(self.view.mas_left).offset(10);
//        make.right.equalTo(self.view.mas_right).offset(-10);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
//        
        make.center.equalTo(self.view);
//        make.size.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(60, 20, 60, 20));
    }];
    
    _headerImg.image = [UIImage imageNamed:@"0002.jpeg"];
    [_headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backGroundView.mas_top).offset(10);
        make.left.equalTo(_backGroundView.mas_left).offset(10);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
   
    
    _nameLabel.text = @"chenshukun for test";
    [_nameLabel sizeToFit];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.backGroundView.mas_top).offset(20);
        make.left.equalTo(self.headerImg.mas_right).offset(10);
        make.width.equalTo(@150);
        make.height.equalTo(@20);
 
    }];
    
    _inforLabel.text = @" infor label ";
    [_inforLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.backGroundView.mas_top).offset(20);
        make.right.equalTo(self.backGroundView.mas_right).offset(-10);
        make.height.equalTo(@20);
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        
    }];

    
    _timeLabel.text = @"23:52";
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.top.equalTo(self.nameLabel.mas_bottom).offset(0);
        make.left.equalTo(self.imageView.mas_right).offset(10);
       
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@20);
        
        
    }];
    
   /*
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(30);
        make.left.equalTo(self.view.mas_left).offset(30);
        
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@20);
        make.left.equalTo(@20);
        make.height.equalTo(@20);
        make.right.equalTo(@20);
        
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@20);
        make.left.equalTo(@20);
        make.bottom.equalTo(@10);
        make.right.equalTo(@20);
        
    }];
    
    
  
    [_liulanCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@20);
        make.height.equalTo(@40);
        make.right.equalTo(@0);
    }];
    
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.height.equalTo(@40);
        make.right.equalTo(@20);
    }];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
