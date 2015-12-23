//
//  Singleton.m
//  test
//
//  Created by ChenShuKun on 12/23/15.
//  Copyright © 2015 ChenShuKun. All rights reserved.
//

#import "Singleton.h"
static Singleton *sharedObj = nil;
@implementation Singleton


+ (Singleton*) sharedInstance {

    if (sharedObj == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedObj = [[super alloc]init];
        });
    }
    return sharedObj;
}

+ (id) allocWithZone:(NSZone *)zone {
    if (sharedObj == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedObj = [super allocWithZone:zone];
        });
    }
    return sharedObj;
}

+(instancetype)new {
    return [self sharedInstance];
}
-(id)copy {
    return self;
}
-(id)mutableCopy {
    return self;
}
- (id) copyWithZone:(NSZone *)zone {
    return self;
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return self;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return self;
}

@end
