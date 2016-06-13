//
//  ViewController.m
//  UIBezierPath
//
//  Created by ChenShuKun on 16/5/30.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor lightTextColor];
    
//    [self rectangular];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 20)];
    view.backgroundColor =[UIColor redColor];
    [self.view addSubview:view];
    
    
    NSArray *array = @[@"UIView",@"UIButton",@"UILabel"];
    for (int i  = 0; i < 10; i ++) {
        
        Class myclass = NSClassFromString(array[i%3]);
        id view1 = [[myclass alloc] init];
//        NSLog(@"===%p",view1);
    }
    
    
    NSMutableArray *array1 = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    [array1 addObject:@"3"];
    
//    NSArray *arry2 = [array1 mutableCopy];
    
    NSArray *arry2 = [array1 copy];
    
    NSLog(@"array 1  = %p",array1);

    NSLog(@"array 2  = %p",arry2);


    
}

- (void)drawRect:(CGRect)rect {
    
    [self drawRoundedRectPath];
}

- (void)rectangular {
  
    UIBezierPath *path =  [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(20, 20)];
//    [path addLineToPoint:CGPointMake(180, 20)];
//    [path addLineToPoint:CGPointMake(180, 200)];
//    [path addLineToPoint:CGPointMake(20, 200)];
//    [path closePath];
    [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:20];
    
    UIColor *red =[UIColor redColor];
    [red set];
    // 设置线宽
    path.lineWidth = 1.5;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    // 根据我们设置的各个点连线
    [path stroke];
    
}
- (void)drawRoundedRectPath {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 40) cornerRadius:10];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
