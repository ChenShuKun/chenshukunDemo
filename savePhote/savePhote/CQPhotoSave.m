//
//  CQPhotoSave.m
//  savePhote
//
//  Created by chenshukun on 16/12/28.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import "CQPhotoSave.h"
#import <Photos/Photos.h>

//定义一个全局变量的相册名字
static NSString *photoAssetCollectionName = @"i春秋";


@interface CQPhotoSave()
@property (nonatomic, copy) saveImgBlock block;
@property (nonatomic, strong) UIImage *saveImg;
@end

@implementation CQPhotoSave

- (void)saveImageToPhoto:(UIImage *)image andComplete:(saveImgBlock)block {
    self.block = block;
    if (image == nil || ![image isKindOfClass:[UIImage class]]) {
        [self returnBlockWithType:code_ParamsError andErrorMes:@"请检查正确的传入参数"];
        return;
    }
    self.saveImg = image;
    [self phAuthorizationCheck];
}

//判断是否有权限访问相簿
-(void)phAuthorizationCheck {
    /*
     PHAuthorizationStatusNotDetermined,     用户还没有做出选择
     PHAuthorizationStatusDenied,            用户拒绝当前应用访问相册(用户当初点击了"不允许")
     PHAuthorizationStatusAuthorized         用户允许当前应用访问相册(用户当初点击了"好")
     PHAuthorizationStatusRestricted,        因为家长控制, 导致应用无法方法相册(跟用户的选择没有关系)
     */
    // 判断授权状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
        [self returnBlockWithType:code_Denied andErrorMes:@"无法访问您的相册"];
    } else if (status == PHAuthorizationStatusAuthorized) {
        [self saveImage:self.saveImg];
    } else if (status == PHAuthorizationStatusNotDetermined) {
        // 弹框请求用户授权
        NSLog(@"第一次访问--PHAuthorizationStatusNotDetermined");
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) { // 用户点击了好
                [self saveImage:self.saveImg];
            }
        }];
    }
}

//保存图片
-(void)saveImage:(UIImage *)UIImage {
    
    __block  NSString *assetLocalIdentifier;
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
        
        //1.保存图片到相机胶卷中----创建图片的请求
        assetLocalIdentifier = [PHAssetChangeRequest creationRequestForAssetFromImage:UIImage].placeholderForCreatedAsset.localIdentifier;
    
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        // 2.获得相簿 创建我们自己的相册
        PHAssetCollection *createdAssetCollection = [self createAssetCollection];
        if (createdAssetCollection == nil) {
            [self returnBlockWithType:code_CreatError andErrorMes:@"创建相册失败"];
            NSLog(@"----(创建相簿失败!)");
            return;
        }
        if(success == NO){
            NSLog(@"保存图片失败----(创建图片的请求)");
            [self returnBlockWithType:code_SaveError andErrorMes:@"保存图片失败"];
            return ;
        }
        // 3.将刚刚添加到"相机胶卷"中的图片到"自己创建相簿"中
        [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
            
            //获得图片
            PHAsset *asset = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetLocalIdentifier] options:nil].lastObject;
            //添加图片到相簿中的请求
            PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createdAssetCollection];
            // 添加图片到相簿
            [request addAssets:@[asset]];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if(success){
                NSLog(@"保存图片到创建的相簿成功");
                 [self returnBlockWithType:code_ToMyPhotoSucceed andErrorMes:@"保存图片成功"];
            }else{
                NSLog(@"保存图片到创建的相簿失败");
                [self returnBlockWithType:code_ToMyPhotoSucceed andErrorMes:@"保存图片失败"];
            }
        }];
    }];
}


//  获得相簿
-(PHAssetCollection *)createAssetCollection{
    
    //判断是否已存在
    PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection * assetCollection in assetCollections) {
        if ([assetCollection.localizedTitle isEqualToString:photoAssetCollectionName]) {
            //说明已经有哪对象了
            return assetCollection;
        }
    }
    
    //创建新的相簿
    __block NSString *assetCollectionLocalIdentifier = nil;
    NSError *error = nil;
    //同步方法
    [[PHPhotoLibrary sharedPhotoLibrary]performChangesAndWait:^{
        // 创建相簿的请求
        assetCollectionLocalIdentifier = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:photoAssetCollectionName].placeholderForCreatedAssetCollection.localIdentifier;
    } error:&error];
    
    if (error)return nil;
    
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[assetCollectionLocalIdentifier] options:nil].lastObject;
}


- (void)returnBlockWithType:(code)type andErrorMes:(NSString *)errorMessage {
    
    if (self.block) {
        self.block(type,errorMessage);
    }
}

@end
