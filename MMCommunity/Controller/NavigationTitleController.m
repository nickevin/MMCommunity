//
//  RootController.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-18.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "NavigationTitleController.h"

@interface NavigationTitleController ()

@end

@implementation NavigationTitleController

- (id)initWithTitle:(NSString *)title {
  if (self = [super init]) {
    self.navigationItem.title = title;

    self.view.backgroundColor = [UIColor whiteColor];
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

@end
