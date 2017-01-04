//
//  ViewController.m
//  savePhote
//
//  Created by chenshukun on 16/12/28.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "CQPhotoSave.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)savePhoteAction:(UIButton *)sender {
    
    NSLog(@"保存到相册 ");
    
    UIImage  *image = [UIImage imageNamed:@"test.png"];
//    [self saveImageToPhotos:image];
    CQPhotoSave *saveImg = [[CQPhotoSave alloc]init];
    [saveImg saveImageToPhoto:image andComplete:^(code errorCode, NSString *errorStr) {
       
        NSLog(@"error code  = %ld",errorCode);
        NSLog(@"errorStr  = %@",errorStr);
    }];
}



//实现该方法
- (void)saveImageToPhotos:(UIImage*)savedImage {
    
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    //因为需要知道该操作的完成情况，即保存成功与否，所以此处需要一个回调方法image:didFinishSavingWithError:contextInfo:
}

//回调方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    
}




@end
