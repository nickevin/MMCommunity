//
//  Plaza.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-24.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plaza : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *icon;
@property(strong, nonatomic) NSArray *units;

- (id)initWithName:(NSString *)name
              icon:(NSString *)icon
             units:(NSArray *)units;

@end
