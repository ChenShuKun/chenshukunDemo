//
//  Students.h
//  NSArchiver
//
//  Created by ChenShuKun on 16/6/21.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Students : NSObject <NSCoding>

@property (copy , nonatomic)    NSString *name;
@property (assign, nonatomic)   NSNumber *age;



@end
