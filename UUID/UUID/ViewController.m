//
//  ViewController.m
//  UUID
//
//  Created by ChenShuKun on 16/5/10.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "KeychainItemWrapper.h"
#import  <Security/Security.h>

@interface ViewController ()

@end

@implementation ViewController


/**
 *  @author ChenShuKun, 16-05-10 23:05:12
 *
 *  使用说明
 *  1 导入 KeychainItemWrapper 类  并禁用 ARC -fno-objc-arc
 *  2 导入  Security 类库
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"get UUID == %@",[ViewController UUID]);
    //16DCB176-BFDB-46CC-946C-9DF40C0B5367

    
}


+ (NSString *)UUID {
    //com.huangyibiao.test.group
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"net.626Qichuang.UUID" accessGroup:@"com.chenshukun,test.group"];
    NSString *UUID = [wrapper objectForKey:(__bridge id)kSecValueData];
    
    if (UUID.length == 0) {
        UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [wrapper setObject:UUID forKey:(__bridge id)kSecValueData];
    }
    
    return UUID;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
