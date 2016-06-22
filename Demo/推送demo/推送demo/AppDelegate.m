//
//  AppDelegate.m
//  推送demo
//
//  Created by ChenShuKun on 16/6/15.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "AppDelegate.h"
#import "UMessage.h"
<<<<<<< HEAD

=======
#import "ViewController.h"
>>>>>>> 486a6c570a5406257c4302b9033641808d4741d3
@interface AppDelegate ()

@end

@implementation AppDelegate

<<<<<<< HEAD

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置 AppKey 及 LaunchOptions
    [UMessage startWithAppkey:@"your app key" launchOptions:launchOptions];
    
    //1.3.0版本开始简化初始化过程。如不需要交互式的通知，下面用下面一句话注册通知即可。
    [UMessage registerForRemoteNotifications];
    
=======
/** 
 参考网站 http://www.cocoachina.com/ios/20150112/10901.html
         http://www.jianshu.com/p/803bfaae989e
         http://blog.csdn.net/woaifen3344/article/details/44302635
         http://my.oschina.net/u/1418722/blog/317422

 **/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置 AppKey 及 LaunchOptions
    [UMessage startWithAppkey:@"576212b5e0f55a0fa000254e" launchOptions:launchOptions];
    
    //1.3.0版本开始简化初始化过程。如不需要交互式的通知，下面用下面一句话注册通知即可。
//    [UMessage registerForRemoteNotifications];

    [self registerLocalNotification];
//本地推送通知  测试
//    [ViewController registerLocalNotification:5];
>>>>>>> 486a6c570a5406257c4302b9033641808d4741d3
    //for log
    [UMessage setLogEnabled:YES];

    return YES;
}
<<<<<<< HEAD

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 1.2.7版本开始不需要用户再手动注册devicetoken，SDK会自动注册
    //[UMessage registerDeviceToken:deviceToken];
=======
- (void)registerLocalNotification {

    if(8.0 <= [UIDevice currentDevice].systemVersion.doubleValue) {
        [[UIApplication sharedApplication] registerForRemoteNotifications];

        UIMutableUserNotificationAction * action1 = [[UIMutableUserNotificationAction alloc] init];
        action1.identifier = @"action1";
        action1.title=@"策略1行为1";
        action1.activationMode = UIUserNotificationActivationModeForeground;
        action1.destructive = YES;

        UIMutableUserNotificationAction * action2 = [[UIMutableUserNotificationAction alloc] init];
        action2.identifier = @"action2";
        action2.title=@"策略1行为2";
        action2.activationMode = UIUserNotificationActivationModeBackground;
        action2.authenticationRequired = NO;
        action2.destructive = NO;

        UIMutableUserNotificationCategory * category1 = [[UIMutableUserNotificationCategory alloc] init];
        category1.identifier = @"Category1";
        [category1 setActions:@[action2,action1] forContext:(UIUserNotificationActionContextDefault)];

        UIMutableUserNotificationAction * action3 = [[UIMutableUserNotificationAction alloc] init];
        action3.identifier = @"action3";
        action3.title=@"策略2行为1";
        action3.activationMode = UIUserNotificationActivationModeForeground;
        action3.destructive = YES;

        UIMutableUserNotificationAction * action4 = [[UIMutableUserNotificationAction alloc] init];
        action4.identifier = @"action4";
        action4.title=@"策略2行为2";
        action4.activationMode = UIUserNotificationActivationModeBackground;
        action4.authenticationRequired = NO;
        action4.destructive = NO;

        UIMutableUserNotificationCategory * category2 = [[UIMutableUserNotificationCategory alloc] init];
        category2.identifier = @"Category2";
        [category2 setActions:@[action4,action3] forContext:(UIUserNotificationActionContextDefault)];

        UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:[NSSet setWithObjects: category1,category2, nil]];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings: uns];
    }
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    // 1.2.7版本开始不需要用户再手动注册devicetoken，SDK会自动注册
    //[UMessage registerDeviceToken:deviceToken];
    NSLog(@"%@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                  stringByReplacingOccurrencesOfString: @">" withString: @""]
                 stringByReplacingOccurrencesOfString: @" " withString: @""]);
    /* "device_token" = 99ba9e7b99d6a93afb69623c5edfb6a75b85a963bbe1cf37eecec71762bb2b0a;
     header =     {
     access = WiFi;
     "app_version" = 1;
     appkey = 576212b5e0f55a0fa000254e;
     carrier = "";
     channel = "App Store";
     country = CN;
     "device_model" = "iPod5,1";
     "display_name" = "";
     idfa = "85EEA41E-09C3-4359-A027-4D18B978AA0E";
     idfv = "5B958591-DC6D-4814-B626-A69E270EE1EB";
     "is_jailbroken" = NO;
     "is_pirated" = YES;
     language = "zh-Hans";
     oid = 995a55b8318f63bdc89768ed1b5b9e62cedb2181;
     os = iOS;
     "os_version" = "8.4.1";
     "package_name" = CHENSHUKUN;
     "req_time" = "1466047641.845332";
     resolution = "1136 x 640";
     "sdk_type" = iOS;
     "sdk_version" = "1.3.0(c2e3eca.idfa)";
     "short_version" = "1.0";
     timezone = 8;
     };*/
>>>>>>> 486a6c570a5406257c4302b9033641808d4741d3
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [UMessage didReceiveRemoteNotification:userInfo];
<<<<<<< HEAD
}

=======

    NSLog(@"==== %@",userInfo);
}

// 本地通知回调函数，当应用程序在 前台 时调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {

    NSLog(@"== noti:%@",notification);
    //根据 传过来的不同的key 进行 分开处理
    // 这里真实需要处理交互的地方
    // 获取通知所带的数据
    NSString *notMess = [notification.userInfo objectForKey:@"key"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"本地通知(前台)"
                                                    message:notMess
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

    // 更新显示的徽章个数
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge--;
    badge = badge >= 0 ? badge : 0;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;

}

// 取消某个本地推送通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;

    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];

            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;  
            }  
        }  
    }  
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {

    NSLog(@"identifier = %@",identifier);


}
>>>>>>> 486a6c570a5406257c4302b9033641808d4741d3
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
