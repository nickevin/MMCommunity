//
//  Plaza.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-24.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "Plaza.h"

@implementation Plaza

- (id)init {
  if (self = [super init]) {
    return self;
  }

  return nil;
}

- (id)initWithName:(NSString *)name
              icon:(NSString *)icon
             units:(NSArray *)units {
  if (self = [self init]) {
    _name = name;
    _icon = icon;
    _units = units;
  }

  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"Plaza: name=%@, icon=%@, units=%@", _name,
                                    _icon, _units];
}

@end
