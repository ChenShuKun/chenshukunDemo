//
//  KVCdemo.m
//  practice001
//
//  Created by ChenShuKun on 16/2/28.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "KVCdemo.h"

@implementation KVCdemo

-(instancetype)initWithDict:(NSDictionary *)dic {
    if ( self = [super init]) {
    // 自定义 字典转模型 方法
    
    }
    return self;
}
//kvc 实现的 原理
/**
 *  1,遍历 这个字典 key
 *  2 查找这个 类 是否有 setName 方法 , 调用 setName 方法
 *  3 查找这个类中是否有_name  这个属性 ,_name = value
 *  4 报错 setfor forUndefinedKey
 */

+(KVCdemo *)kvcdemoWithDict:(NSDictionary *)dict {

    return [[[KVCdemo alloc] init] method2:dict];

}

- (void)method1:(NSDictionary *)dic {
    
    self.name = dic[@"name"];
    self.age = dic[@"age"];
    self.address = dic[@"address"];
}

- (KVCdemo *)method2:(NSDictionary *)dict {
    
    KVCdemo *kvc = [[KVCdemo alloc]init];
    [kvc setValuesForKeysWithDictionary:dict];
    return kvc;
}
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    NSLog(@"--func class\n keyPath=%@  \n object=%@ \n change=%@ =\n context =%@",__func__,keyPath,object,change,context);
    

    
}

@end
