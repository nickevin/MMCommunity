//
//  MemberController.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-19.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "MemberController.h"

@interface MemberController ()

@end

@implementation MemberController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self initView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)initView {
  self.view.backgroundColor = [UIColor whiteColor];

  UITabBarItem *tabBar =
      [[UITabBarItem alloc] initWithTitle:@"会员"
                                    image:[UIImage imageNamed:@"tabbar-member"]
                                      tag:0];
  self.navigationController.tabBarItem = tabBar;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
