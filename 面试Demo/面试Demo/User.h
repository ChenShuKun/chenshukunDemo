//
//  User.h
//  面试Demo
//
//  Created by ChenShuKun on 1/10/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,Sex) {
    SexUnknow,
    SexMan,
    SexWoman
};

@interface User : NSObject

@property (nonatomic,readonly,copy) NSString* name;
@property (nonatomic,readonly,assign) NSInteger age;
@property (nonatomic,readonly,assign) Sex sex;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age Sex:(Sex)sex;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
+ (instancetype)initWithName:(NSString *)name age:(NSInteger)age;

@end
