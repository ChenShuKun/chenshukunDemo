//
//  ViewController.m
//  NSArchiver
//
//  Created by ChenShuKun on 16/6/21.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "Students.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //第一种形式：归档对象
    //对象----》文件
//    [self test111];
    
    
//    [self test1];
  
  
//    NSLog(@"  111  ");
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"  === 2222 == ");
//    });
//    
//     NSLog(@"  333  ");
//    
    

    NSLog(@"=========111  ");
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//       
//       [self test222];
//       NSLog(@"=========2222222  ");
//   });
//    [NSThread detachNewThreadSelector:@selector(test222) toTarget:self     withObject:nil];
//    NSThread *thred =   [[NSThread alloc] initWithTarget:self selector:@selector(test222) object:nil];
    
    
//    [self performSelector:@selector(test222) withObject:nil afterDelay:0];
//    NSLog(@"thred = %d ",[[NSThread mainThread] isMainThread]);
//    NSLog(@"=========2222222  ");
//    
//    NSLog(@"======== 333  ");
    
    
 
    
//
//    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"后台执行 ???? ");
////        [self test222];
//    });
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"主线程  执行  ");
//    });
//    
    //只 执行一次
//    dispatch_once_t once;
//    dispatch_once(&once, ^{
//        NSLog(@"执行一次 执行  ");
//    });
    
    //延时两秒调用
//    CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
//     NSLog(@"now  = %f",now);
//    dispatch_time_t time =  dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSLog(@"延时两秒调用    执行  ");
//        
//        NSLog(@"after  = %f",CFAbsoluteTimeGetCurrent()- now);
//    });
    
    
    // 自定义dispatch_queue_t
    dispatch_queue_t own = dispatch_queue_create("chenshukun.com", nil);
    dispatch_sync(own, ^{
         NSLog(@" 自定义dispatch_queue_t");
    });
    //需要注意 在 MRC下 需要 释放掉 自定义的 queue
//    dispatch_release(own);

    
    //线程组的 group
//    dispatch_group_t group =   dispatch_group_create();
//    
//    //开启一个 并行的 队列
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//         NSLog(@"  AAAAA  ");
//    });
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"  BBBBBBBB  ");
//        [self test222];
//    });
//    
//    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"  组的 概念 合并   ");
//    });
    
    
    //开启一个 串行的 队列 (顺序 执行 )
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        
        [self   test222];
        NSLog(@"  开启一个 串行的 队列 011111111  ");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"  开启一个 串行的 队列 0222222  ");
        });
        
    });
    
    
    
    
    
    NSTimer *tmer = [NSTimer scheduledTimerWithTimeInterval:1 invocation:nil repeats:YES];
    
//    [[NSRunLoop currentRunLoop] addTimer:tmer forMode:@""];
//    NSDefaultRunLoopMode
}

- (void)test222 {
    for (int i = 0; i < 3000; i++) {
        NSLog(@"%d",i);
    }
    
}
//简单的归档
- (void)test111 {
    
    NSArray *array = [NSArray arrayWithObjects:@"zhang",@"wangwu",@"lisi",nil];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if(success){
        NSLog(@"保存成功");
    }
    
    // 解归档
    id arrys  = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",arrys);
}


//自定义的 归档 ,需要 model 遵循 nscoding 协议
//  并根据相应key 进行赋值 和 取值

- (void)test1 {
    
    Students  *xiaoming = [[Students alloc]init];
    xiaoming.name = @"ni cai cai";
    xiaoming.age  = @(23);
 
    
    //归档
    NSMutableData *data = [[NSMutableData alloc]init];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:xiaoming forKey:@"xiaoming"];
    
    [archiver finishEncoding];
    BOOL wirte =  [data writeToFile:[self getFilePathWithModelKey:@"test"] atomically:YES];
    NSLog(@"is wirte = %d",wirte);
  

    ////////////////////////////////////////////////
    //解归档
    
    NSData *datas = [[NSData alloc] initWithContentsOfFile:[self getFilePathWithModelKey:@"test"]];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:datas];
    

    Students *test1 = [unarchiver decodeObjectForKey:@"xiaoming"];
    [unarchiver finishDecoding];
    
    NSLog(@"结归档 name = %@, age = %@",test1.name,test1.age);
    

}
//得到Document目录
-(NSString *)getFilePathWithModelKey:(NSString *)modelkey {
    
    return  [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    
//    NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    return [[array objectAtIndex:0] stringByAppendingPathComponent:modelkey];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
