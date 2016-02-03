//
//  ViewController.m
//  NSThreadDemo
//
//  Created by ChenShuKun on 1/28/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.initName = @"chenshkun";
    
    NSLog(@"self .initName = \n %@",self.get_name);
    
    
    [NSThread detachNewThreadSelector:@selector(test) toTarget:self withObject:nil];
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil];
    [thread start];
    
    
    
    if ([thread isMainThread]) {
        NSLog(@"  ===== ");
    }
    
}

int a  = 0;
- (void)test {

    NSLog(@"-- %d",a++);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
