//
//  AppDelegate.h
//  本地通知
//
//  Created by ChenShuKun on 16/5/26.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime;
@end

