//
//  Banner.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-21.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : JSONModel <NSCoding>

@property(strong, nonatomic) NSString *imgUrl;

- (id)initWithImgUrl:(NSString *)imgUrl;

@end
