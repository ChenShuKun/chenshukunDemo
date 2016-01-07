//
//  ViewController.m
//  ApplePayDemo
//
//  Created by ChenShuKun on 1/7/16.
//  Copyright © 2016 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import <PassKit/PassKit.h>

@interface ViewController ()<PKPaymentAuthorizationViewControllerDelegate,PKPaymentAuthorizationViewControllerDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

/** applePay 步骤 ( ios 8.1 +)
 *  1 . 在 target - > capabilities 中 设置 apple pay  ON
    2 . 去 iOS 开发者中心的位于 Identifiers > Merchant ID的页面。创建证书
    3 . 在创建 Certificate Signing Reques 的时候 需要选择 对应的算法 和 256 长度
       ( 设置密钥对信息如下:算法:ECC关键尺寸:256位单击Continue在钥匙链访问完成CSR生成过程)
    4 .重新请求 证书
 
 */

}


- (IBAction)payAction:(id)sender {
    
    if([PKPaymentAuthorizationViewController canMakePayments]) {
        
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        request.countryCode = @"US";
        request.currencyCode = @"USD";
        request.supportedNetworks = @[PKPaymentNetworkAmex, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa];
        request.merchantCapabilities = PKMerchantCapabilityEMV;
        request.merchantIdentifier = @"merchant.Kun";
        
        
        PKPaymentSummaryItem *widget1 = [PKPaymentSummaryItem summaryItemWithLabel:@"Widget 1" amount:[NSDecimalNumber decimalNumberWithString:@"0.99"]];
        
        PKPaymentSummaryItem *widget2 = [PKPaymentSummaryItem summaryItemWithLabel:@"Widget 2" amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]];
        
        PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"Grand Total" amount:[NSDecimalNumber decimalNumberWithString:@"1.99"]];
        
        request.paymentSummaryItems = @[widget1, widget2, total];
        
        
        PKPaymentAuthorizationViewController *paymentPane = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
        paymentPane.delegate = self;
        [self presentViewController:paymentPane animated:YES completion:nil];
        
        
    }
    NSLog(@" ---- ");
    
    
    
}
- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus status))completion {
    
    NSLog(@"controller= %@",controller);
    NSLog(@"payment= %@",payment);
    NSLog(@"completion= %@",completion);

    
}


- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
    
    NSLog(@" DidFinish ");
    // 做相应的处理
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
