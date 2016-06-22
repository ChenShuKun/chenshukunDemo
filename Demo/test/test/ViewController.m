//
//  ViewController.m
//  test
//
//  Created by ChenShuKun on 16/6/22.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self timerAllocMethod];
    
    [self testTime];
    
}

- (void)timerAllocMethod {
  /*timer 的初始化方式*/
    //001
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(log) userInfo:nil repeats:YES];
    

    //002
    /*、timerWithTimeInterval这两个类方法创建出来的对象如果不用 addTimer: forMode方法手动加入主循环池中，将不会循环执行。并且如果不手动调用fair，则定时器不会启动。
     */
//    NSTimer *timer =  [NSTimer timerWithTimeInterval:1 target:self selector:@selector(log) userInfo:nil repeats:YES];
//    //必须的加 这句
//    [timer fire];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //003
    NSInvocation * inv = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:@selector(init)]];
    [inv setTarget:self];
    [inv setSelector:@selector(log)];
    NSTimer *timer3 = [NSTimer timerWithTimeInterval:1 invocation:inv repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer3 forMode:NSRunLoopCommonModes];
   
    
    
//    NSInvocation * inv = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:@selector(init)]];
//    [inv setTarget:self];
//    [inv setSelector:@selector(log)];
//    NSTimer *timer =  [NSTimer timerWithTimeInterval:1 invocation:inv repeats:YES];
//    
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    
    
    //    NSInvocation *inv = [[NSInvocation alloc]init];
    //    NSInvocation * inv = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:@selector(init)]];
    //    [inv setTarget:self];
    //    [inv setSelector:@selector(log)];
//    NSTimer *timer =   [NSTimer scheduledTimerWithTimeInterval:1 invocation:inv  repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
 
    
    /*  注意：这五种初始化方法的异同：
     
     1、参数repeats是指定是否循环执行，YES将循环，NO将只执行一次。
     
     2、timerWithTimeInterval这两个类方法创建出来的对象如果不用 addTimer: forMode方法手动加入主循环池中，将不会循环执行。并且如果不手动调用fire，则定时器不会启动。
     
     3、scheduledTimerWithTimeInterval这两个方法不需要手动调用fair，会自动执行，并且自动加入主循环池。
     
     4、init方法需要手动加入循环池，它会在设定的启动时间启动。
     
     二、成员变量
     
     @property (copy) NSDate *fireDate;
     
     这是设置定时器的启动时间，常用来管理定时器的启动与停止
     
     //启动定时器
     timer.fireDate = [NSDate distantPast];
     //停止定时器
     timer.fireDate = [NSDate distantFuture];
     @property (readonly) NSTimeInterval timeInterval;
     
     这个是一个只读属性，获取定时器调用间隔时间。
     
     @property NSTimeInterval tolerance;
     
     这是7.0之后新增的一个属性，因为NSTimer并不完全精准，通过这个值设置误差范围。
     
     @property (readonly, getter=isValid) BOOL valid;
     
     获取定时器是否有效
     
     @property (readonly, retain) id userInfo;
     
     获取参数信息
     
     三、关于内存释放
     
     如果我们启动了一个定时器，在某个界面释放前，将这个定时器停止，甚至置为nil，都不能是这个界面释放，原因是系统的循环池中还保有这个对象。所以我们需要这样做：
     
     -(void)dealloc{
     NSLog(@"dealloc:%@",[self class]);
     }
     - (void)viewDidLoad {
     [super viewDidLoad];
     timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myLog:) userInfo:nil repeats:YES];
     UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
     btn.backgroundColor=[UIColor redColor];
     [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:btn];
     }
     -(void)btn{
     if (timer.isValid) {
     [timer invalidate];
     }
     timer=nil;
     [self dismissViewControllerAnimated:YES completion:nil];
     }
     在官方文档中我们可以看到 [timer invalidate]是唯一的方法将定时器从循环池中移除。*/
}

- (void)testTime {
    
    //测试 timer 并不是 很精确
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(log) userInfo:nil repeats:YES];
    
    dispatch_time_t now = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(now, dispatch_get_main_queue(), ^{
        for (int i  = 0; i<20; i++  ) {
        
                NSLog(@"===========");
        
        }
    });
    /*2016-06-22 23:07:03.741 test[2802:197801] 2222
     2016-06-22 23:07:04.740 test[2802:197801] 2222
     2016-06-22 23:07:05.740 test[2802:197801] 2222
     2016-06-22 23:07:05.740 test[2802:197801] ===========
     2016-06-22 23:07:05.740 test[2802:197801] ===========
     2016-06-22 23:07:05.740 test[2802:197801] ===========
     2016-06-22 23:07:05.740 test[2802:197801] ===========
     2016-06-22 23:07:05.740 test[2802:197801] ===========
     2016-06-22 23:07:05.740 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.741 test[2802:197801] ===========
     2016-06-22 23:07:05.742 test[2802:197801] ===========
     2016-06-22 23:07:05.742 test[2802:197801] ===========
     2016-06-22 23:07:05.813 test[2802:197801] ===========
     2016-06-22 23:07:06.741 test[2802:197801] 2222
     2016-06-22 23:07:07.741 test[2802:197801] 2222*/
    
}
- (void)log {
    NSLog(@"2222");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
