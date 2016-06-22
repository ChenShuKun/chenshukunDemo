//
//  NSString+UUID.m
//  xieli_oc
//
//  Created by csk on 6/3/16.
//  Copyright © 2016 ChenShukun. All rights reserved.
//

#import "NSString+UUID.h"
#import "KeychainItemWrapper.h"

@implementation NSString (UUID)


+ (NSString *)UUID {
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"net.626Qichuang.UUID" accessGroup:@"com.chenshukun,test.group"];
    NSString *UUID = [wrapper objectForKey:(__bridge id)kSecAttrAccount];

    if (UUID.length == 0) {
        UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [wrapper setObject:UUID forKey:(__bridge id)kSecAttrAccount];
    }
    return UUID;
    
}
@end
