//
//  KVCdemo.h
//  practice001
//
//  Created by ChenShuKun on 16/2/28.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCdemo : NSObject

/** name */
@property (nonatomic,copy) NSString *name;
/** age */
@property (nonatomic,assign) NSInteger age;

/** address */
@property (nonatomic,copy) NSString *address;


-(instancetype)initWithDict:(NSDictionary *)dic;
+(KVCdemo *)kvcdemoWithDict:(NSDictionary *)dict;

@end
