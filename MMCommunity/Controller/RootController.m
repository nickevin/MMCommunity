//
//  RootController.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-18.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "RootController.h"

#import "User.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self initIntroView];

  //  AFHTTPRequestOperationManager *manager =
  //      [AFHTTPRequestOperationManager manager];
  //  [manager GET:URL_INDEX
  //      parameters:nil
  //      success:^(AFHTTPRequestOperation *operation, NSDictionary *json) {
  //          NSLog(@"%@, %@", [json objectForKey:@"result_code"],
  //                [json objectForKey:@"result_msg"]);
  //      }
  //      failure:^(AFHTTPRequestOperation *operation,
  //                NSError *error) { NSLog(@"Error: %@", error); }];
  //
  //  NSDictionary *parameters =
  //      @{@"username" : @"admin", @"password" : @"password"};
  //  AFHTTPRequestOperationManager *manager2 =
  //      [AFHTTPRequestOperationManager manager];
  //  [manager2 POST:URL_LOGIN
  //      parameters:parameters
  //      success:^(AFHTTPRequestOperation *operation, NSDictionary *json) {
  //          User *model =
  //              [[User alloc] initWithDictionary:[json objectForKey:@"user"]
  //                                         error:nil];
  //          NSLog(@"%@", model);
  //      }
  //      failure:^(AFHTTPRequestOperation *operation,
  //                NSError *error) { NSLog(@"Error: %@", error); }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)initIntroView {
  EAIntroPage *intro1 = [EAIntroPage page];
  intro1.bgImage = [UIImage imageNamed:@"intro-1"];

  EAIntroPage *intro2 = [EAIntroPage page];
  intro2.bgImage = [UIImage imageNamed:@"intro-2"];

  EAIntroPage *intro3 = [EAIntroPage page];
  intro3.bgImage = [UIImage imageNamed:@"intro-3"];

  EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds];
  [intro setPages:@[ intro1, intro2, intro3 ]];

  intro.pageControlY = 100;

  UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [btn setFrame:CGRectMake((320 - 230) / 2,
                           [UIScreen mainScreen].bounds.size.height - 60, 230,
                           40)];
  [btn setTitle:NSLocalizedString(@"Skip", nil) forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  btn.layer.borderWidth = 2.0f;
  btn.layer.cornerRadius = 10;
  btn.layer.borderColor = [[UIColor whiteColor] CGColor];
  intro.skipButton = btn;

  [intro showInView:self.view animateDuration:0.3];
}

@end
