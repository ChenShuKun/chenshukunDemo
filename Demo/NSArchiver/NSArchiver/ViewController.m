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
    
    
    [self test1];
    
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
