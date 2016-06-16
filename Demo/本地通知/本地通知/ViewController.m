//
//  ViewController.m
//  本地通知
//
//  Created by ChenShuKun on 16/5/26.
//  Copyright © 2016年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)buttonAction:(UIButton *)sender {
    
    
//    [UIApplication  sharedApplication].applicationIconBadgeNumber = 2;
    NSLog(@"   buttonAction  ");
    
//    UILocalNotification *loc = [self setNotification:@"chenshukun for button test" timeToNotification:2 soundNames:nil];
//    [[UIApplication sharedApplication] scheduleLocalNotification:loc];
    

    
    //
//    UILocalNotification *loc = [self setNotification:@"chenshukun for button test" timeToNotification:2 soundNames:nil];
//    [[UIApplication sharedApplication] scheduleLocalNotification:loc];
//    
//    
    
    UILocalNotification * completeNotification = [self setNotificationWithAction:@"chenshukun for  test22222" timeToNotification:6 soundNames:@"" categorys:@"COMPLETE_CATEGORY"];
    [[UIApplication sharedApplication] scheduleLocalNotification:completeNotification];
    ;
 
    
}



//普通的提醒
- (UILocalNotification *)setNotification:(NSString *)body timeToNotification:(double)time soundNames:(NSString *)soundName {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.alertAction = @"滑动查看信息";
    localNotification.alertBody = body;
    
    //在mainBundle的短于30秒的播放文件,否则就会是系统默认声音
//    localNotification.soundName = soundName;
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:time];
    
    //下面这条category语句是对应下面的“有选项的本地操作”章节
//    localNotification.category = @"aaa";
    
    return localNotification;
}


//带回复的 提醒

//MARK: - 提醒操作 设置

- (UILocalNotification *)setNotificationWithAction:(NSString *)body timeToNotification:(double)time soundNames:(NSString *)soundName categorys:(NSString *)category {
    
     UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    UIMutableUserNotificationAction *notificationActionOk = [[UIMutableUserNotificationAction alloc]init];
    
    notificationActionOk.identifier = @"completeRemindRater";
    notificationActionOk.title = @"再工作一会儿";
    //是否需要权限，例如锁屏的时候，执行操作是否需要解锁再执行
    notificationActionOk.authenticationRequired = false;
    //启动app还是后台执行
    notificationActionOk.activationMode = UIUserNotificationActivationModeBackground;
    

    UIMutableUserNotificationAction *notificationActionRestNow = [[UIMutableUserNotificationAction alloc]init];
    
    notificationActionRestNow.identifier = @"relaxNow";
    notificationActionRestNow.title = @"休息";
    notificationActionRestNow.destructive = false;
    notificationActionRestNow.authenticationRequired = false;
    notificationActionRestNow.activationMode =UIUserNotificationActivationModeBackground;
    
//MARK: -Notification Category 设置
    UIMutableUserNotificationCategory *notificationCompleteCategory = [[UIMutableUserNotificationCategory alloc]init];
    
    //记住这个identifier ，待会用
    notificationCompleteCategory.identifier = @"COMPLETE_CATEGORY";
    [notificationCompleteCategory setActions:@[notificationActionOk,notificationActionRestNow] forContext:UIUserNotificationActionContextDefault];       [notificationCompleteCategory setActions:@[notificationActionOk,notificationActionRestNow] forContext:UIUserNotificationActionContextMinimal];
    
    return localNotification;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
