//
//  ViewController.m
//  TableViewDemo
//
//  Created by ChenShuKun on 16/3/7.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *stuArray = [NSMutableArray arrayWithCapacity:[self array].count];
    for (NSDictionary*dict in [self array]) {
        Student *stu1 = [Student studentWithDict:dict];
        [stuArray addObject:stu1];
    }
    
    self.data = stuArray;
    
}

#pragma mark:-- UITableViewDelegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s",__func__);
    return self.data.count;
}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"%s",__func__);
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSLog(@"%s",__func__);
    static NSString *const cellID = @"CellID";
    StudentCell *Cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!Cell) {
        Cell = [[StudentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    Student *stu = self.data[indexPath.row];
    Cell.studentModel = stu;


    return Cell;
    
}

/*
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
   
    NSLog(@"%s",__func__);
    return @"title";
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
   
    NSLog(@"%s",__func__);
    return @"footer";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSLog(@"%s",__func__);
    return YES;
}
*/

/** tableViewDataSource 执行顺序
 *  1.      numberOfSectionsInTableView
 *  2. tableView:titleForHeaderInSection
 *  3. tableView:titleForFooterInSection
 *  4.      tableView:numberOfRowsInSection
 *  5.      tableView:cellForRowAtIndexPath
 *  6. tableView:canEditRowAtIndexPath
 */

#pragma mark:-- TabelViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    Student *stu = self.data[indexPath.row];
    return stu.cellHeight;

}


#pragma mark:---
- (NSArray *)array {
    //– 仅需一行代码就可以为UITableView或者CollectionView加上下拉刷新或者上拉刷新功能。可以自定义上下拉刷新的文字说明。具体使用看“使用方法”。 （国人写） XHRefreshControl – XHRefreshControl 是一款高扩展性、低耦合度的下拉刷新、上提加载更多的组件。（国人写）
    NSArray *array = @[
                       @{@"name":@"chenshukun",@"age":@23,@"address":@"仅需一行代码就可以为UITableView或者CollectionView加上下拉刷新或者上拉刷新功能。可以自定义上下拉刷新的文字说明。具体使用看“使用方法”。 "},
                       
                       @{@"name":@"chenshukun",@"age":@23,@"address":@"XHRefreshControl 是一款高扩展性"}
                       
                       ,@{@"name":@"chenshukun",@"age":@23,@"address":@"北京市北京市"}
                       
                       ,@{@"name":@"chenshukun",@"age":@23,@"address":@"北京市"}];
    return array;
}


@end
