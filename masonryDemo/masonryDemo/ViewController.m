//
//  ViewController.m
//  masonryDemo
//
//  Created by ChenShuKun on 2/4/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#define KSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    UIView *bacgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, KSCREEN_WIDTH, 60)];
    bacgroundView.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:bacgroundView];
    
  /*
    UIImageView *headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(100, 20 , 80, 80)];
    headerImg.backgroundColor = [UIColor redColor];
    [bacgroundView addSubview:headerImg];
    
    [headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_offset(UIEdgeInsetsMake(10, 10, 10, 10));
//        make.center.equalTo(bacgroundView);
//        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    */
    //上传社区头像文字提醒
    UILabel *iconLabel = [[UILabel alloc]init];
    iconLabel.textColor = [UIColor redColor];
    iconLabel.text = @"上传社团头像";
    iconLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:iconLabel];
    
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bacgroundView);
        make.top.equalTo(bacgroundView.mas_bottom).with.offset(20);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
