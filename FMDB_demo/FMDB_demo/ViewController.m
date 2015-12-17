//
//  ViewController.m
//  FMDB_demo
//
//  Created by ChenShuKun on 12/17/15.
//  Copyright © 2015 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface ViewController ()
@property (nonatomic, retain) NSString * dbPath;
@end

@implementation ViewController {
    FMDatabase *db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [document stringByAppendingPathComponent:@"USER.sqlite"];
    self.dbPath = path;
    //注意以上三句话是获取数据库路径必不可少的，在viewDidload之前就已经准备好了
  
    [self createTable];

}

- (void)createTable {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:self.dbPath]) {
        NSLog(@"表不存在，创建表");
        db =[FMDatabase databaseWithPath:self.dbPath];
        if ([db open]) {
            NSString *sql = @"CREATE TABLE 'USER'('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' VARCHAR(20),'age' VARCHAR(20))    ";//sql语句
            BOOL success = [db executeUpdate:sql];
            if (!success) {
                NSLog(@"error when create table ");
            }else{
                NSLog(@"create table succeed");
            }
            [db close];
        }else{
            NSLog(@"database open error");
        }
    }
}

- (IBAction)deleteButton:(UIButton *)sender {
          [self deleteDatabse];
}

// 删除数据库
- (void)deleteDatabse
{
    BOOL success;
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // delete the old db.
    if ([fileManager fileExistsAtPath:self.dbPath]) {
        [db close];
        success = [fileManager removeItemAtPath:self.dbPath error:&error];
        if (!success) {
            NSAssert1(0, @"Failed to delete old database file with message '%@'.", [error localizedDescription]);
        }else {
            NSLog(@"删除成功 ");
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
