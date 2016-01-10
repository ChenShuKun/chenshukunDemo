//
//  User.m
//  面试Demo
//
//  Created by ChenShuKun on 1/10/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import "User.h"


@implementation User

-(instancetype)initWithName:(NSString *)name age:(NSInteger)age Sex:(Sex)sex {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
        _sex = sex;
    }
    return self;
}
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    return [self initWithName:name age:age Sex:0];
}

+(instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    return [[User alloc]initWithName:name age:age];
}
@end
