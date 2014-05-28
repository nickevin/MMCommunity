//
//  Banner.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-21.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "Banner.h"

@implementation Banner

- (id)init {
  if (self = [super init]) {
    return self;
  }

  return nil;
}

- (id)initWithImgUrl:(NSString *)imgUrl {
  if (self = [self init]) {
    _imgUrl = imgUrl;
  }

  return self;
}

//- (id)initWithCoder:(NSCoder *)coder {
//  if (self = [super init]) {
//    _imgUrl = [coder decodeObjectForKey:@"imgUrl"];
//  }
//  return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)coder {
//  [coder encodeObject:_imgUrl forKey:@"imgUrl"];
//}

- (NSString *)description {
  return [NSString stringWithFormat:@"Banner: imgUrl=%@", _imgUrl];
}

@end
