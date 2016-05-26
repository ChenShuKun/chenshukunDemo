//
//  ViewController.m
//  数据持久化
//
//  Created by ChenShuKun on 16/5/24.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
@interface Person : NSObject<NSCoding>

@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *name;

@end

@implementation Person

// 什么时候调用:只要一个自定义对象归档的时候就会调用
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}
@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self userDefaultTest];
    
//    [self plistTest];
    
    [self NSKeyedArchiverTest];
}





- (void)userDefaultTest {
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:@[@"1",@"2",@"4"]];
    
//    [[NSUserDefaults standardUserDefaults] setObject:@[@"1",@"2",@"4"] forKey:@"edc"];//完全可以的 ok 的
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"edc"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
//   只能存 OC 中的 基本数据类型,队伍 NSObject 以及他的 子类 会报错
    
    //如果想存储 自定义的 对象 ,可以用 归档

    //    NSObject *obj = [[NSObject alloc]init];
//    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:@"obj"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    

    
   NSMutableArray *aaaa =  [[NSUserDefaults standardUserDefaults] objectForKey:@"edc"];
    [aaaa addObject:@"3333"];
    NSLog(@"==%@ ",aaaa);
    
}

- (void)plistTest {
    // 获取应用沙盒
    NSString *homePath = NSHomeDirectory();
    NSLog(@"homePath =%@",homePath);
    
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",cachePath);
    
//    注意：操作plist文件时，文件路径一定要是全路径。
    
}


- (void)NSKeyedArchiverTest {
    // 归档:plist存储不能存储自定义对象，此时可以使用归档来完成
    Person *person = [[Person alloc] init];
    person.age = 25;
    person.name = @"chenshukun";
    
    // 获取tmp目录路径
    NSString *tempPath = NSTemporaryDirectory();
    
    // 拼接文件名
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"person.data"];
    
    // 归档
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    
    

    

    // 解档
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@ %d",p.name,p.age);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
