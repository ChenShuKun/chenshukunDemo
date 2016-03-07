//
//  Student.h
//  TableViewDemo
//
//  Created by ChenShuKun on 16/3/7.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Student : NSObject
/** name */
@property (nonatomic,copy) NSString *name;
/** age */
@property (nonatomic,assign) NSInteger age;

/** address */
@property (nonatomic,copy) NSString *address;

/** 高度 */
@property (nonatomic,assign) CGFloat cellHeight;

+ (instancetype )studentWithDict:(NSDictionary *)dic;

@end
