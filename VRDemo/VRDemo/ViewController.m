//
//  ViewController.m
//  VRDemo
//
//  Created by ChenShuKun on 17/7/20.
//  Copyright © 2017年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "GCSVideoView.h"


//相应的 资料信息
//   http://www.jianshu.com/p/1ee1a0d1d320
@interface ViewController ()<GCSWidgetViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self initSubViews];
    
}

- (void)initSubViews {
    
//    CGRect frame = CGRectMake(100, 100, 300, 300);
    GCSVideoView *video =  [[GCSVideoView alloc] initWithFrame:self.view.frame];
    video.delegate = self;
    video.enableCardboardButton = YES;
    video.enableFullscreenButton = YES;
    [self.view addSubview:video];
    
    [video loadFromUrl:[NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"]];
    
}



- (void)widgetViewDidTap:(GCSWidgetView *)widgetView {
    
    
    
}
- (void)widgetView:(GCSWidgetView *)widgetView
didChangeDisplayMode:(GCSWidgetDisplayMode)displayMode {
    
    
}
- (void)widgetView:(GCSWidgetView *)widgetView didLoadContent:(id)content {
    
    
    
}
- (void)widgetView:(GCSWidgetView *)widgetView
didFailToLoadContent:(id)content
  withErrorMessage:(NSString *)errorMessage {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
