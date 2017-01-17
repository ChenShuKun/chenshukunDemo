//
//  StoreProductViewController.m
//  PhotoBrowser
//
//  Created by chenshukun on 17/1/5.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

#import "StoreProductViewController.h"
#import <StoreKit/StoreKit.h>

@interface StoreProductViewController ()<SKStoreProductViewControllerDelegate>

@property (copy, nonatomic) CompleteBlock block;
@property (strong ,nonatomic) UIActivityIndicatorView *activityView;
@property (strong ,nonatomic) UIViewController *originVC;
@end

@implementation StoreProductViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.activityView startAnimating];
    
}

-(UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc]init];
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _activityView.frame = CGRectMake(self.view.frame.size.width/2 , 200, 50, 50);
        [self.view addSubview:_activityView];
        
    }
    return _activityView;
}

- (void)presentAppStorePagesWithAPPID:(NSString *)appID orginViewController:(UIViewController *)VC withBlock:(CompleteBlock)block {
    self.block = block;
    
    if (appID == nil || [appID length]==0) {
        [self returnBlockWithType:storeProductErrorCode_Params];
        return;
    }
    self.originVC = VC;
    
    SKStoreProductViewController *storeProductViewContorller =[[SKStoreProductViewController alloc] init];
    storeProductViewContorller.delegate = self;
    //加载一个新的视图展示
    [storeProductViewContorller loadProductWithParameters:
     @{SKStoreProductParameterITunesItemIdentifier:appID}//appId唯一的
        completionBlock:^(BOOL result, NSError *error) {
            
            [self.activityView stopAnimating];
                NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
                    if(error){//加载成功了
                          [self returnBlockWithType:storeProductErrorCode_Unknow];
                    }else {
                        //模态弹出appstore
                        [VC presentViewController:storeProductViewContorller animated:YES completion:^{}];
                    }
            }
     ];
   
}


#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
  
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
        [self returnBlockWithType:storeProductErrorCode_Dismiss];
    }];
}

- (void)returnBlockWithType:(storeProductErrorCode)code {
    if (self.block) {
        self.block(code);
    }
}

@end
