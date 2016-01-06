//
//  ViewController.m
//  传感器Demo
//
//  Created by ChenShuKun on 1/6/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAccelerometerDelegate>
{
    //我们用一个label来表示随加速度方向运动的小方块
    UILabel *_label;
    //x轴方向的速度
    UIAccelerationValue _speedX;
    //y轴方向的速度
    UIAccelerationValue _speedY;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    CGRect winRect = [UIScreen mainScreen].applicationFrame;
    //实例化 随加速度方向运动的小方块（label）
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _label.center = CGPointMake(winRect.size.width * 0.5, winRect.size.height * 0.5);
    _label.text = @"Droid";
    _label.textAlignment = UITextAlignmentCenter;
    _label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_label];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //召唤加速度传感器
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    //设置加速度传感器的 接收加速度通知的时间间隔
    //设置为1.0/60.0表示一秒接收60次，可根据实际需求调整
    accelerometer.updateInterval = 1.0/60.0;
    //下面这个不设置，代理方法就不会调用
    accelerometer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //不要忘了停止传感器的工作
    //结束加速度传感器的工作
    _speedX = _speedY = 0;
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = nil;
}
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    //获得的加速度要考虑到加速度传感器的原点是物理重心，而不是屏幕右上角
    //x轴方向的速度加上x轴方向获得的加速度
    _speedX += acceleration.x;
    //y轴方向的速度加上y轴方向获得的加速度
    _speedY += acceleration.y;
    //小方块将要移动到的x轴坐标
    CGFloat posX = _label.center.x + _speedX;
    //小方块将要移动到的y轴坐标
    CGFloat posY = _label.center.y - _speedY;
    //碰到屏幕边缘反弹
    if (posX < 0.0) {
        posX = 0.0;
        //碰到屏幕左边以0.4倍的速度反弹
        _speedX *= -0.4;
    }else if(posX > self.view.bounds.size.width){
        posX = self.view.bounds.size.width;
        //碰到屏幕右边以0.4倍的速度反弹
        _speedX *= -0.4;
    }
    if (posY < 0.0) {
        posY = 0.0;
        //碰到屏幕上边不反弹
        _speedY = 0.0;
    }else if (posY > self.view.bounds.size.height){
        posY = self.view.bounds.size.height;
        //碰到屏幕下边以1.5倍的速度反弹
        _speedY *= -1.5;
    }
    //移动小方块
    _label.center = CGPointMake(posX, posY);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
