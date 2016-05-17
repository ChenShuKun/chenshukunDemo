//
//  ViewController.m
//  选择排序
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
    
//    [self selectedSort];
    
    /* C 语言版本
    int a[] =  {1,100,-11,0,1,999,81,2,101,3,5,4,20};
    cselectedSort(a, sizeof(a)/sizeof(int));
    
    for (int i =0 ; i < sizeof(a)/sizeof(int); i++) {
        printf("%d\n ",a[i]);
    }
    */
    /* 思路:
        找到一个最小值 的索引的下标,依次遍历, 始终把最小的 往前交换,
        时间复杂度 O(n*n)
     */
    
    
    // 算法的 改进 二元选择排序
    /*思路
     简单选择排序，每趟循环只能确定一个元素排序后的定位。我们可以考虑改进为每趟循环确定两个元素（当前趟最大和最小记录）的位置,从而减少排序所需的循环次数。改进后对n个数据进行排序，最多只需进行[n/2]趟循环即可
     */
    
    [self insertSort];
}


- (void)selectedSort {
    
    
    for (int i  = 0 ; i < _array.count-1; i++) {
        
        NSInteger  min =  i;
        for (int j = i+1; j< _array.count; j++) {
            if ([_array[min] integerValue] > [_array[j] integerValue]) {
                min = j;
            }
        }
        
        if (min != i) {
            NSInteger temp = [_array[i] integerValue];
            _array[i]  = _array[min];
            _array[min] = [NSNumber numberWithInteger:temp];
            
        }
    }
    
    NSLog(@"---%@",_array);
}


// C 语言实现
void cselectedSort(int a[], int n) {
    
    for (int i = 0 ; i< n-1; i++) {
        int min = i;
        
        for (int j = i+1; j < n; j++) {
            if (a[j] < a[min]) {
                min = j;
            }
        }
        
        if ( min != i) {
            int temp = a[min];
            a[min] =  a[i];
            a[i] = temp;
            
        }
    }
    
    
   
}



//插入排序 时间复杂度 O( n*n )
- (void)insertSort {
    
    for (int i = 1 ; i< _array.count; i++) {
        
        // 遇到不是有序的，才进入移动元素
        if ([_array[i] integerValue] < [_array[i-1] integerValue]) {
            
            NSInteger target  = [_array[i] integerValue];
            
            // 移动前j-1元素，分别向后移动一个位置
            NSInteger j = i ;
            while (j > 0 && [_array[j - 1] integerValue] > target) {
                
                _array[j] = _array[j - 1];
                
                j--;
            }
            _array[j] = [NSNumber numberWithInteger:target];
        }
        
        
    }
    
    NSLog(@"---%@",_array);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
