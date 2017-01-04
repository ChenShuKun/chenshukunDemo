//
//  CQPhotoSave.h
//  savePhote
//
//  Created by chenshukun on 16/12/28.
//  Copyright © 2016年 chenshukun. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *errorCode == 0 正常 已经存到相册中
 */
typedef NS_ENUM(NSInteger , code){
    code_Unknow = -1, //未知错误
    code_Succeed,
    code_ParamsError,
    code_Denied,        //无法获取相册权限
    code_CreatError,    //创建相簿失败
    code_SaveError,     //保存失败
    code_ToMyPhotoError,//保存图片到创建的相簿失败
    code_ToMyPhotoSucceed,//保存图片到创建的相簿成功
    
};
typedef void(^saveImgBlock)(code errorCode,NSString *errorStr);

@interface CQPhotoSave : NSObject

/*
 * 把 image 保存到相册中
 */
- (void)saveImageToPhoto:(UIImage *)image andComplete:(saveImgBlock)block;

@end
