//
//  User.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-21.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : JSONModel

@property(assign, nonatomic) long userId;
@property(strong, nonatomic) NSString *username;
@property(strong, nonatomic) NSString *password;
@property(strong, nonatomic) NSString *realName;
@property(strong, nonatomic) NSString *email;

@end
