//
//  ViewController.m
//  快速排序
//
//  Created by ChenShuKun on 16/5/17.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _array = [NSMutableArray arrayWithArray:@[@1,@100,@(-11),@0,@1,@999,@81,@2,@101,@3,@5,@4,@20]];
    
    NSLog(@"before - %@",_array);
    
   [self quickSortWithArray:_array leftNo:0 rightNo:_array.count-1];
   
    NSLog(@"after --- %@",_array);
  /* 思路
   
   *   选择一个 数作为基数 通常选择第一个数
   *   通过一次排序后 ,则分为两段, 基数前的 基数后的 
   *    循环 直到有序
   参考 http://blog.csdn.net/hguisu/article/details/7776068
    http://www.henishuo.com/quick-sort/
   */
    
}


- (void)quickSortWithArray:(NSMutableArray *)array leftNo:(NSInteger)left rightNo:(NSInteger)right {
    
    if (left >= right) {
        return;
    }
    // 一次划分后，得到基准数据的位置
    NSInteger baseIndex = [self partition:array leftNo:left rightNo:right];
    
    [self quickSortWithArray:array leftNo:left rightNo:baseIndex-1];
    
    [self quickSortWithArray:array leftNo:baseIndex+1 rightNo:right];
    
}

- (NSInteger)partition:(NSMutableArray *)array leftNo:(NSInteger)left rightNo:(NSInteger)right {
    
    NSInteger base = [array[left] integerValue];
    NSInteger baseIndex = left;
    
    while (left < right ) {
        
        while (left < right && [array[right] integerValue] >= base ) {
            right--;
        }
        
        
        while (left < right && [array[left] integerValue] <= base) {
            left++;
        }
        // 将这一趟比基准大和比基准小的所找到的第一个值，互相交换
        [self swap:array leftNo:left rightNo:right];
        
    }
    // 在left与right相遇时，将基准数与相遇点交换
    // 这样这一次划分，就可以保证左边的比基准数小，右边的比基准数大
    [self swap:array leftNo:baseIndex rightNo:left];
    
    // 划分完成后，以left位置的元素作为新的基准，分成左右序列，分别递归排序
    return left;
}

- (void)swap:(NSMutableArray *)array leftNo:(NSInteger)left rightNo:(NSInteger)right {
    NSInteger temp = [array[left] integerValue];
    array[left] = array[right];
    array[right] = [NSNumber numberWithInteger:temp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
