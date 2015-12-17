//
//  SearchViewController.m
//  FMDB_demo
//
//  Created by ChenShuKun on 12/17/15.
//  Copyright © 2015 ChenShuKun. All rights reserved.
//

#import "SearchViewController.h"
#import "FMDatabase.h"

@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SearchViewController {
    NSMutableArray *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    data  = [NSMutableArray array];

    FMDatabase *db = [[FMDatabase alloc]initWithPath:[self path]];

    if ([db open]) {
        NSString *sql = @"SELECT * FROM USER";
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
           
            NSString *name = [rs stringForColumn:@"name"];
            NSString *age = [rs stringForColumn:@"age"];
            NSDictionary *dict = @{@"name":name,@"age":age};
            [data addObject:dict];
        }
        [db close];
    }
    
}

- (NSString *)path {
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    return [document stringByAppendingPathComponent:@"USER.sqlite"];
}

- (BOOL)deletDataName:(NSString *)name andAge:(NSString *)age {
   
    FMDatabase *db = [FMDatabase databaseWithPath:[self path]];
    NSString *mes = nil;
    if ([db open]) {
        NSString *sql = @"DELETE FROM USER WHERE name = ? and age = ?";
        if (name.length != 0&&age.length != 0 ){
            BOOL rs = [db executeUpdate:sql,name,age];
            
            if (rs) {
                mes = @"删除成功";
            }else{
                mes = @"删除失败";
            }
            return rs;
        }
    }
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const cellId = @"CELLiD";
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (Cell == nil) {
        Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSDictionary *dict = data[indexPath.row];
    Cell.textLabel.text = [dict objectForKey:@"name"];
    Cell.detailTextLabel.text =  [dict objectForKey:@"age"];
    
    return Cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (tableView.editing == UITableViewCellEditingStyleDelete) {
        NSDictionary *dict = data[indexPath.row];
       
        if ([self deletDataName:dict[@"name"] andAge:dict[@"age"]]) {
            [data removeObjectAtIndex:indexPath.row];
            [self.tableView reloadData];
//            [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationFade];
        }
       
       
    }
//    self.view.frame = (CGRect){10,10,18,19};
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
