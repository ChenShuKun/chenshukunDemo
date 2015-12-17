//
//  AddViewController.m
//  FMDB_demo
//
//  Created by ChenShuKun on 12/17/15.
//  Copyright © 2015 ChenShuKun. All rights reserved.
//

#import "AddViewController.h"
#import "FMDatabase.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
- (IBAction)completeAction:(id)sender {
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [document stringByAppendingPathComponent:@"USER.sqlite"];
    
    FMDatabase *db = [[FMDatabase alloc]initWithPath:path];
    
    NSString * sql = @"INSERT INTO USER (name,age) VALUES (?,?)";
    if ([db open]) {
        BOOL res = [db executeUpdate:sql,_name.text,_age.text];
        if (!res) {
            
            NSLog(@"error to insert data");
            
        }else{
            
            NSLog(@"insert succeed");
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }

    
}

@end
