//
//  ViewController.m
//  PhotoBrowser
//
//  Created by chenshukun on 16/12/30.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import "ViewController.h"
#import "BrowserView.h"
#import  "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 80, 40)];
    [button setTitle:@"show1" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 80, 40)];
    [button1 setTitle:@"show3" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor orangeColor];
    [button1 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    
}

- (void)buttonAction {
    NSLog(@"buttonAction subViews = %@",self.view.subviews);
    
    
    BrowserView *brow = [[BrowserView alloc] initWithImageArray:[self array] andCurrentIndex:1];
    [brow show];
    [self.view addSubview:brow];
    [brow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)buttonAction2 {
    NSLog(@"buttonAction2 subViews = %@",self.view.subviews);

    BrowserView *brow = [[BrowserView alloc] initWithImageArray:[self array] andCurrentIndex:3];
    [brow show];
    [self.view addSubview:brow];
    [brow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


- (NSArray *)array {
    NSArray *array = @[
                       @"http://www.baidu.com/img/bd_logo1.png",
                       @"http://pic5.nipic.com/20100202/3760162_130224079498_2.jpg",
                       @"http://www.baidu.com/img/bd_logo1.png",
                       @"http://d.hiphotos.baidu.com/image/h%3D200/sign=22e31b3d324e251ffdf7e3f89787c9c2/72f082025aafa40f282c77daa964034f79f019ca.jpg",
                    
                       @"http://pic5.nipic.com/20100202/3760162_130224079498_2.jpg",
                       ];
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
