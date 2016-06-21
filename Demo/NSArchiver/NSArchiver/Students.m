//
//  Students.m
//  NSArchiver
//
//  Created by ChenShuKun on 16/6/21.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "Students.h"

@implementation Students
#define names        @"studentName"
#define ages         @"studentAge"

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        
        self.name =  [aDecoder decodeObjectForKey:names];
        self.age = [aDecoder decodeObjectForKey:ages];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:names];
    [aCoder encodeObject:self.age  forKey:ages];

}


@end
