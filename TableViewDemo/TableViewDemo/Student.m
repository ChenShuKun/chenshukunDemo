//
//  Student.m
//  TableViewDemo
//
//  Created by ChenShuKun on 16/3/7.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "Student.h"

@implementation Student
+ (instancetype)studentWithDict:(NSDictionary *)dic {
    
    Student *stu = [[self alloc]init];
    [stu setValuesForKeysWithDictionary:dic];
    return stu;
}
@end
