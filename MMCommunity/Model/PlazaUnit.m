//
//  PlazaUnit.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-24.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "PlazaUnit.h"

@implementation PlazaUnit

- (id)init {
  if (self = [super init]) {
    return self;
  }

  return nil;
}

- (id)initWithName:(NSString *)name
              icon:(NSString *)icon
            action:(NSString *)action {
  if (self = [self init]) {
    _name = name;
    _icon = icon;
    _action = action;
  }

  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"PlazaUnit: name=%@, icon=%@, action=%@",
                                    _name, _icon, _action];
}

@end
