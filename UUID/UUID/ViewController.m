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
#import "NSString+UUID.h"

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
   
    //16DCB176-BFDB-46CC-946C-9DF40C0B5367
    NSLog(@"get UUID == %@",[ViewController UUID]);
    
    
    NSLog(@"UUID = %@",[NSString UUID]);
    
    
    
//    [self  hongTest];
}
- (void)hongTest {
    
    NSLog(@"== %d",__IPHONE_OS_VERSION_MAX_ALLOWED);//获取最大的 系统版本号 
    NSLog(@"== %d",__IPHONE_OS_VERSION_MIN_REQUIRED);//设置中的deployment target，是可变的，根据开发的设置有所不同
    
    if (__IPHONE_9_1 > __IPHONE_OS_VERSION_MIN_REQUIRED) {
        NSLog(@"版本 xiaoyu 9.0");
    }else {
        NSLog(@"版本大约 9.0");
    }
}

- (void)test {
    /**
     *  @author ChenShuKun, 16-05-12 23:05:02
     *
     *  从这个函数名称，大概可以猜出来这个函数的意思是字符串转换成无符号长整型。如何看出来，这么看：str-to-ul，再补全就是string-to-unsign long。
     
     这是C语言函数，参数说明如下：
     
     参数一：const char *类型，表示字符串的起始地址
     参数二：表示字符串有效数字的结束地址，传0或者NULL表示不接收
     参数三：转换基数。当base=0,自动判断字符串的类型，并按10进制输出，例如0xa,就会把字符串当做16进制处理，输出的为10
     *
     *  @param 0
     *  @param 1
     *
     *  @return
     */
    unsigned long log =  strtoul([[@"1" substringWithRange:NSMakeRange(0, 1)] UTF8String], 0, 10);
    printf("==== %lu",log);

}

+ (NSString *)UUID {
    
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
