//
//  StoreProductViewController.h
//  PhotoBrowser
//
//  Created by chenshukun on 17/1/5.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CompleteBlock) (NSInteger code);
typedef NS_ENUM(NSInteger, storeProductErrorCode) {
    storeProductErrorCode_Unknow=0,
    storeProductErrorCode_Params,    //传入的参数有问题
    storeProductErrorCode_Dismiss,
};

@interface StoreProductViewController : UIViewController

/**
 使用该类 需要添加 StoreKit FrameWork 
**/
- (void)presentAppStorePagesWithAPPID:(NSString *)appID orginViewController:(UIViewController *)VC withBlock:(CompleteBlock)block;

@end
