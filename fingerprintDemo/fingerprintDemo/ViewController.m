//
//  ViewController.m
//  fingerprintDemo
//
//  Created by ChenShuKun on 12/18/15.
//  Copyright © 2015 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
/**
 *  添加 LocalAuthentication.frameWork
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)fingerPrintAction:(UIButton *)sender {
    
    LAContext *myContext = [[LAContext alloc] init];
 
    NSError *authError = nil;
 
    NSString *myLocalizedReasonString = @"通过Home键子验证已有手机指纹";
 
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
       
        [self evalte:myContext withStri:myLocalizedReasonString];
       
    } else {
         NSLog(@"不能使用指纹识别");
        // Could not evaluate policy; look at authError and present an appropriate message to user
      
    }

}

- (void)evalte:(LAContext *)myContext withStri:(NSString *)myLocalizedReasonString {
    
    [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
     
              localizedReason:myLocalizedReasonString
     
                        reply:^(BOOL success, NSError *error) {
                            
                            if (success) {
                                
                                // User authenticated successfully, take appropriate action
                                NSLog(@"  successed   ");
                            } else {
                                if (error.code == kLAErrorUserFallback) {
                                    
                                    NSLog(@"User tapped Enter Password");
                                    
                                } else if (error.code == kLAErrorUserCancel) {
                                    NSLog(@"User tapped Cancel");
                                    
                                } else {
                                    
                                    NSLog(@"Authenticated failed.");
                                }
                                
                                // User did not authenticate successfully, look at error and take appropriate action
                                
                            }
                            
                        }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
