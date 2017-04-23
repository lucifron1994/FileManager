
//
//  NSArray+my_des.m
//  FileManager
//
//  Created by WangHong on 2017/4/3.
//  Copyright © 2017年 wanghong. All rights reserved.
//

#import "NSArray+my_des.h"

@implementation NSArray (my_des)

- (NSString *)mydes{
    
    NSString *desc = [self description];
    
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

@end
