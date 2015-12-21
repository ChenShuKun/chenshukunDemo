//
//  NSString+MD5.h
//  test
//
//  Created by ChenShuKun on 12/21/15.
//  Copyright © 2015 ChenShuKun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

#warning MD5 解密网站 http://www.cmd5.com

/** MD5加密 返回 MD5 的密文 **/
- (NSString *)md5String;
- (NSString *)sha1String;
- (NSString *)sha256String;
- (NSString *)sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


@end
