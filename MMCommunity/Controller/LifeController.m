//
//  LifeController.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-19.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "LifeController.h"
#import "MDCParallaxView.h"

@interface LifeController () {
  NSArray *_data;
}

@end

@implementation LifeController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self initView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)initView {
  _data = @[
    @[ @{@"name" : @"Map Sample"} ],
    @[
      @{@"name" : @"Gallery Sample1"},
      @{@"name" : @"Gallery Sample2"},
      @{@"name" : @"Gallery Sample3"},
      @{@"name" : @"Gallery Sample4"},
      @{@"name" : @"Gallery Sample5"},
      @{@"name" : @"Gallery Sample6"},
      @{@"name" : @"Gallery Sample7"},
      @{@"name" : @"Gallery Sample8"},
      @{@"name" : @"Gallery Sample9"},
      @{@"name" : @"Gallery Sample0"}
    ]
  ];

  UIImage *backgroundImage = [UIImage imageNamed:@"banner"];
  CGRect backgroundRect = CGRectMake(0, 0, CGRectGetWidth(self.view.frame),
                                     backgroundImage.size.height);
  UIImageView *backgroundImageView =
      [[UIImageView alloc] initWithFrame:backgroundRect];
  backgroundImageView.image = backgroundImage;
  backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;

  UITableView *tableView = [[UITableView alloc]
      initWithFrame:CGRectMake(0, backgroundImageView.frame.size.height,
                               SCREEN_WIDTH, TABLE_VIEW_CELL_HEIGHT * 13.5)];
  [tableView setDataSource:self];
  [tableView setDelegate:self];
  [tableView registerClass:[UITableViewCell class]
      forCellReuseIdentifier:@"Cell"];

  MDCParallaxView *parallaxView =
      [[MDCParallaxView alloc] initWithBackgroundView:backgroundImageView
                                       foregroundView:tableView];
  parallaxView.frame = self.view.bounds;
  parallaxView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  parallaxView.backgroundHeight = 160.0f;
  parallaxView.scrollView.scrollsToTop = NO;
  parallaxView.backgroundInteractionEnabled = YES;
  [self.view addSubview:parallaxView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [_data count];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [[_data objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                      forIndexPath:indexPath];

  [cell.textLabel
      setText:[[[_data objectAtIndex:indexPath.section]
                  objectAtIndex:indexPath.row] objectForKey:@"name"]];

  return cell;
}

- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
  return @"Section";
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  UIViewController *controller;
  if (indexPath.section == 0) {
    controller = [self.storyboard
        instantiateViewControllerWithIdentifier:@"ParallaxMapViewController"];

  } else {
    controller = [self.storyboard
        instantiateViewControllerWithIdentifier:@"ParallaxPhotoViewController"];
  }

  [self presentViewController:controller animated:YES completion:nil];
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
