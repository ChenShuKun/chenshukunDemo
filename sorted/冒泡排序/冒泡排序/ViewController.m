//
//  ViewController.m
//  冒泡排序
//
//  Created by ChenShuKun on 16/5/16.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    /*
     1 思路 ( 小 --> 大)
        两层遍历循环  两两 比较  如果前一个 比后一个大, 调换
        时间复杂度 o (n*n)
     */
    
    [self test1];
    
    [self soreder];
    
//    [self test];
}

- (void)test1 {
    CFAbsoluteTime beforeTime = CFAbsoluteTimeGetCurrent();
    

    NSMutableArray *array = [NSMutableArray arrayWithArray:[self array]];
    for (int i = 0 ; i < array.count; i++) {
        
        for (int j = 0 ; j < array.count-i-1; j++) {
            
            if ([array[j+1] integerValue] < [array[j] integerValue]) {
                
                NSInteger temp = [array[j] integerValue];
                array[j] = array[j+1];
                array[j+1]= [NSNumber numberWithInteger:temp];
                
            }
        }
        
    }
    
    
    CFAbsoluteTime afterTime = CFAbsoluteTimeGetCurrent();
    NSLog(@" after = %@ ",array);
    NSLog(@" time---%f ",afterTime - beforeTime);// time---0.000712

}

- (void)test {
    
     int a[5] = {5,-3,8,6,4};
     sort(a,sizeof(a) / sizeof(int));
     
     for (int i = 0; i < sizeof(a) / sizeof(int); ++i) {
     NSLog(@"%d", a[i]);
     }
    
}
//C 语言版 冒泡
void sort(int a[],int len ){
    for (int i = 0; i < len ; i++) {
        
        for (int j =  0 ; j < len-1-i; j++) {
            if (a[j] > a[j+1]) {
                int temp = a[j];
                a[j]= a[j+1];
                a[j+1] = temp;
            }
        }
        
    }
}

// 冒泡排序算法的改进
//用一个 标识符来 表示 ,是否需要 继续 下移下去
- (void)soreder {
    
    CFAbsoluteTime beforeTime = CFAbsoluteTimeGetCurrent();
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[self array]];
    NSInteger last = [array count]-1;
    
    while (last > 0) {
        NSInteger top = 0;
        for (int index = 0 ; index < last; index++) {
            if ([array[index] integerValue] > [array[index+1] integerValue]) {
                top = index;
                
                NSInteger temp = [array[index] integerValue];
                array[index] = array[index+1];
                array[index+1]= [NSNumber numberWithInteger:temp];

            }
           
        }
        
        last = top;
    }
    
    CFAbsoluteTime afterTime = CFAbsoluteTimeGetCurrent();
    NSLog(@" time---%f ",afterTime - beforeTime);//time---0.000017
   
    NSLog(@"sort arry = %@",array);
    
}

//再次改进
/* 
 传统冒泡排序中每一趟排序操作只能找到一个最大值或最小值,我们考虑利用在每趟排序中进行正向和反向两遍冒泡的方法一次可以得到两个最终值(最大者和最小者) , 从而使排序趟数几乎减少了一半。
*/

/*void Bubble_2 ( int r[], int n){
 int low = 0;
 int high= n -1; //设置变量的初始值
 int tmp,j;
 while (low < high) {
 for (j= low; j< high; ++j) //正向冒泡,找到最大者
 if (r[j]> r[j+1]) {
 tmp = r[j]; r[j]=r[j+1];r[j+1]=tmp;
 }
 --high;                 //修改high值, 前移一位
 for ( j=high; j>low; --j) //反向冒泡,找到最小者
 if (r[j]<r[j-1]) {
 tmp = r[j]; r[j]=r[j-1];r[j-1]=tmp;
 }
 ++low;                  //修改low值,后移一位
 }
 }   */
- (NSArray *)array {
    
    return @[@1,@100,@(-11),@0,@1,@999,@81,@2,@101,@3,@5,@4,@20];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
