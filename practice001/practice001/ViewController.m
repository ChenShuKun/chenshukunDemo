//
//  ViewController.m
//  practice001
//
//  Created by ChenShuKun on 16/2/27.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "KVCdemo.h"

#define  DDLog(...)  NSLog(__VA_ARGS__)

@interface ViewController ()

@end

@implementation ViewController {
    KVCdemo *kvc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"10-12",@"11-12",@"10-12",@"10-13",@"11-12",@"10-15",@"11-15"];

//    [self method_one_WithArray:array];
//    [self method_two_WithArray:array];
//    [self method_three_WithArray:array];
        [self kvcDemo];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 80, 40)];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor= [UIColor redColor];
    [self.view addSubview:button];
}

// 去除一个 数组 的重复的 数组
// 方法 一
- (void)method_one_WithArray:(NSArray *)array {
    
    DDLog(@"===before %lu",(unsigned long)array.count);
    NSMutableArray *returnArray = [NSMutableArray arrayWithCapacity:array.count];
    for (NSString *subStr in array) {
        
        if (![returnArray containsObject:subStr]) {
            [returnArray addObject:subStr];
        }
    }
    DDLog(@"=== %s after == %lu",__func__,(unsigned long)returnArray.count);
    
}


// 方法二
- (void)method_two_WithArray:(NSArray *)array {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:array.count];
    for (NSString *subViews in array) {
        
        [dict setObject:subViews forKey:subViews];
    
    }
    
    DDLog(@" %s == after == %lu",__func__, (unsigned long)dict.allValues.count);
    
}

// 方法三
- (void)method_three_WithArray:(NSArray *)array {
    
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:array];
    
    DDLog(@" %s == after == %lu",__func__, set.array.count );
    
}


- (void)kvcDemo {
    
    NSDictionary *dict = @{@"name":@"chenshukun",@"age":[NSNumber numberWithInt:23],@"address":@"北京 蓝天嘉园"};
    
//    KVCdemo *kvc = [KVCdemo kvcdemoWithDict:dict];
    kvc = [[ KVCdemo alloc]initWithDict:dict];
    kvc.name = @"chenshukun";

    DDLog(@" --- name = %@  age = %ld  address = %@",kvc.name,(long)kvc.age,kvc.address);

    NSString *context = @"kvo test";
    [kvc addObserver:[[KVCdemo alloc] init] forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:(__bridge void * _Nullable)(context)];
    
    
}


- (void)button:(UIButton *)button {
    
    kvc.name = @" chenshukun --- 000";
}


-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    DDLog(@"\n keyPath=%@  \n object=%@ \n change=%@ =\n context =%@",keyPath,object,change,context);
    
   
    
    
}


@end
