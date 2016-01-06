//
//  ViewController.m
//  摇一摇Demo
//
//  Created by ChenShuKun on 1/6/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置允许摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    // 并让自己成为第一响应者
    [self becomeFirstResponder];
    
    //////////////    //////////////    //////////////    //////////////
    
    // 使用近距离传感器
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;

}

#pragma mark - 摇一摇相关方法
// 摇一摇开始摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"开始摇动");
    return;
}

// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"取消摇动");
    return;
}

// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        NSLog(@"摇动结束");
    }
    return;
}

#pragma mark:-- 使用近距离传感器

// 状态变化后调用的函数
-(void)proximitySensorChange:(NSNotificationCenter *)notification {
    
    if ([[UIDevice currentDevice] proximityState] == YES) {
        NSLog(@"Device is close to user");
        //在此写接近时，要做的操作逻辑代码
    }else{
        NSLog(@"Device is not close to user");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
