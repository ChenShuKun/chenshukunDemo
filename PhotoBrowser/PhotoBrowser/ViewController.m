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
#import "AppDelegate.h"
#import "StoreProductViewController.h"

#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    for (int i = 0; i < [self buttonTitleArray].count; i++) {
        
        NSString *title = [self buttonTitleArray][i];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30 + (90*i), 100, 80, 40)];
        [button setTitle:title forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        
        SEL func = NSSelectorFromString([NSString stringWithFormat:@"buttonAction%@",@(i)]);
        [button addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        

    }
   
    
}
- (NSArray *)buttonTitleArray {
    return @[@"show1",@"show2",@"appStore"];
}

- (void)buttonAction0 {
    NSLog(@"buttonAction subViews = %@",self.view.subviews);
    
   [self addSubViewsWithIndex:0];
    
}

- (void)buttonAction1 {
    NSLog(@"buttonAction2 subViews = %@",self.view.subviews);

    [self addSubViewsWithIndex:3];
}

- (void)buttonAction2 {
    
    [self presentAppStoreWithAPPID:@"1155876473"];
}

#pragma mark:-- 模态出来 调到 AppStore中
- (void)presentAppStoreWithAPPID:(NSString*)appID {
    /**
     使用该类 需要添加 StoreKit FrameWork
     **/

    if ([appID length] == 0 || appID == nil) {
        return;
    }
    //初始化控制器
    SKStoreProductViewController *storeProductViewContorller =[[SKStoreProductViewController alloc] init];
    //设置代理请求为当前控制器本身
    storeProductViewContorller.delegate = self;
    //加载一个新的视图展示
    [storeProductViewContorller loadProductWithParameters:
     @{SKStoreProductParameterITunesItemIdentifier:appID}//appId唯一的
                                          completionBlock:^(BOOL result, NSError *error) {
                                              //block回调
                                              if(error){
                                                  NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
                                              }else{
                                                  //模态弹出appstore
                                                  [self presentViewController:storeProductViewContorller animated:YES completion:^{}];
                                              }
                                          }
     
     ];
}

#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
    }];
}

- (void)addSubViewsWithIndex:(NSInteger)index {
    
    BrowserView *brow = [[BrowserView alloc] initWithImageArray:[self array] andCurrentIndex:index];
    [brow show];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:brow];
    [brow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
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
