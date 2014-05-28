//
//  User.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-21.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)description {
  return [NSString
      stringWithFormat:
          @"User: userId=%ld, username=%@, password=%@, realName=%@, email=%@",
          _userId, _username, _password, _realName, _email];
}

@end
