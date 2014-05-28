//
//  Utils.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-21.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (UIImage *)convertImage:(NSString *)requestURL {
  NSURL *url = [NSURL URLWithString:requestURL];
  NSData *data = [NSData dataWithContentsOfURL:url];

  return [UIImage imageWithData:data];
}

@end
