//
//  HomeController.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-18.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "HomeController.h"

#import "MDCParallaxView.h"

@interface HomeController () {
}

@end

@implementation HomeController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self initDatasource];
  [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
  [self.navigationController setNavigationBarHidden:YES animated:animated];
  [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  [self.navigationController setNavigationBarHidden:NO animated:animated];
  [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - init

- (void)initDatasource {
  _plazas = [[NSMutableArray alloc] initWithCapacity:2];

  NSString *path =
      [[NSBundle mainBundle] pathForResource:@"Plaze" ofType:@"plist"];
  NSArray *plazes = [[NSArray alloc] initWithContentsOfFile:path];
  for (NSDictionary *item in plazes) {
    Plaza *plaza = [[Plaza alloc] initWithName:item[@"name"]
                                          icon:item[@"icon"]
                                         units:item[@"units"]];

    NSArray *units = (NSArray *)item[@"units"];
    NSMutableArray *_units =
        [[NSMutableArray alloc] initWithCapacity:[units count]];

    for (NSDictionary *subItem in units) {
      PlazaUnit *plazaUnit =
          [[PlazaUnit alloc] initWithName:subItem[@"name"]
                                     icon:subItem[@"icon"]
                                   action:subItem[@"action"]];
      [_units addObject:plazaUnit];
    }

    plaza.units = _units;
    [_plazas addObject:plaza];
  }
}

- (void)initView {
  //    self.view.backgroundColor = [UIColor whiteColor];
  //
  //    UITabBarItem *tabBar =
  //    [[UITabBarItem alloc] initWithTitle:@"首页"
  //                                  image:[UIImage imageNamed:@"tabbar-home"]
  //                                    tag:0];
  //    self.navigationController.tabBarItem = tabBar;

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                               ANIMATION_DURATION * NSEC_PER_SEC),
                 dispatch_get_main_queue(), ^(void) {
      [UIView animateWithDuration:ANIMATION_DURATION
          animations:^{
              AFHTTPRequestOperationManager *manager =
                  [AFHTTPRequestOperationManager manager];
              [manager GET:URL_BANNER
                  parameters:nil
                  success:^(AFHTTPRequestOperation *operation,
                            NSDictionary *dict) {
                      NSArray *models = [Banner
                          arrayOfModelsFromDictionaries:dict[@"banner"]];

                      // [self storeWithModels:models];

                      [self storeWithDictionary:dict];

                      [self initViewWithModels:models];
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      NSArray *models = [self recoveryModels];

                      [self initViewWithModels:models];
                  }];
          }
          completion:^(BOOL finished) {}];
  });
}

- (void)initViewWithModels:(NSArray *)models {
  UIView *topView =
      [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 320)];

  _bannerView =
      [[BannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 320)
                                 models:models];
  _bannerView.delegate = self;

  _pageControl = [[UIPageControl alloc]
      initWithFrame:CGRectMake(0, _bannerView.frame.size.height - 110,
                               SCREEN_WIDTH, 20)];
  _pageControl.numberOfPages = [models count];
  _pageControl.currentPage = 0;

  [topView addSubview:_bannerView];
  [topView addSubview:_pageControl];

  UICollectionViewFlowLayout *layout =
      [[UICollectionViewFlowLayout alloc] init];
  [layout setItemSize:CGSizeMake(SCREEN_WIDTH / 3 - 10, SCREEN_WIDTH / 3 - 15)];
  layout.sectionInset = UIEdgeInsetsMake(0, 0, 20, 0);
  layout.headerReferenceSize =
      CGSizeMake(SCREEN_WIDTH, PLAZA_HEADER_VIEW_HEIGHT);

  _plazaView = [[PlazaView alloc]
             initWithFrame:CGRectMake(0, _bannerView.frame.size.height,
                                      SCREEN_WIDTH, 650)
      collectionViewLayout:layout];
  _plazaView.backgroundColor = [UIColor whiteColor];
  [_plazaView setShowsVerticalScrollIndicator:NO];
  [_plazaView setDataSource:self];
  [_plazaView setDelegate:self];
  [_plazaView registerClass:[PlazaCell class]
      forCellWithReuseIdentifier:PLAZA_CELL_ID];
  [_plazaView registerClass:[PlazaHeaderView class]
      forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
             withReuseIdentifier:PLAZA_HEADER_VIEW_ID];

  MDCParallaxView *parallaxView =
      [[MDCParallaxView alloc] initWithBackgroundView:topView
                                       foregroundView:_plazaView];
  parallaxView.frame = self.view.bounds;
  parallaxView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  parallaxView.backgroundHeight = 160.0f;
  parallaxView.scrollView.scrollsToTop = NO;
  parallaxView.backgroundInteractionEnabled = YES;
  [self.view addSubview:parallaxView];

  //  [self.view addSubview:topView];
  //  [self.view addSubview:_plazaView];
}

#pragma mark - store and recovery plist

// /Users/Kevin/Library/Application Support/iPhone
// Simulator/7.1/Applications/7A6A9615-2E22-4364-875F-3C6AEC046311/Library/Preferences

// 保存自定义对象到 NSUserDefaults：
//  http://www.crifan.com/store_save_array_of_custom_object_class_into_nsuserdefaults_in_iphone_ios/

//- (void)storeWithModels:(NSArray *)models {
//  NSDate *start = [NSDate date];
//
//  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:models];
//  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//  [defaults setObject:data forKey:@"banner"];
//
//  NSDate *end = [NSDate date];
//  NSLog(@"%f", [end timeIntervalSinceDate:start]); // 0.000239
//}
//
//- (NSArray *)recoveryModels {
//  NSDate *start = [NSDate date];
//
//  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//  NSData *data = [defaults objectForKey:@"banner"];
//  NSArray *models = (NSArray *)[NSKeyedUnarchiver
// unarchiveObjectWithData:data];
//
//  NSDate *end = [NSDate date];
//  NSLog(@"%f", [end timeIntervalSinceDate:start]); // 0.000465
//
//  return models;
//}

// http://stackoverflow.com/questions/8606444/how-do-i-convert-a-json-string-to-a-dictionary-in-ios5
// http://www.cnblogs.com/touchme/archive/2012/05/05/2484709.html

- (void)storeWithDictionary:(NSDictionary *)dict {
  //  NSDate *start = [NSDate date];

  if ([NSJSONSerialization isValidJSONObject:dict]) {
    NSError *error;
    NSData *jsonData =
        [NSJSONSerialization dataWithJSONObject:dict
                                        options:NSJSONWritingPrettyPrinted
                                          error:&error];
    NSString *json =
        [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:json forKey:@"banner"];
  }

  //  NSDate *end = [NSDate date];
  //  NSLog(@"%f", [end timeIntervalSinceDate:start]); // 0.000147
}

- (NSArray *)recoveryModels {
  //  NSDate *start = [NSDate date];

  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSData *data = [[defaults objectForKey:@"banner"]
      dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSDictionary *dict =
      [NSJSONSerialization JSONObjectWithData:data
                                      options:NSJSONReadingMutableContainers
                                        error:&error];

  NSArray *array = [dict objectForKey:@"banner"];

  //  NSDate *end = [NSDate date];
  //  NSLog(@"%f", [end timeIntervalSinceDate:start]); // 0.000135

  NSArray *models = [Banner arrayOfModelsFromDictionaries:array];

  //  NSDate *end = [NSDate date];
  //  NSLog(@"%f", [end timeIntervalSinceDate:start]); // 0.000448

  return models;
}

#pragma mark - UIScrollView delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  CGPoint point = _bannerView.contentOffset;
  _pageControl.currentPage = point.x / SCREEN_WIDTH;
}

#pragma mark - UICollectionView delegate

- (NSInteger)numberOfSectionsInCollectionView:
                 (UICollectionView *)collectionView {
  return [_plazas count];
}

- (NSInteger)collectionView:(UICollectionView *)view
     numberOfItemsInSection:(NSInteger)section {
  return [((Plaza *)[_plazas objectAtIndex:section]).units count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
  Plaza *plaza = (Plaza *)[_plazas objectAtIndex:[indexPath section]];

  UICollectionReusableView *reusableview = nil;

  if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    PlazaHeaderView *headerView = [collectionView
        dequeueReusableSupplementaryViewOfKind:
            UICollectionElementKindSectionHeader
                           withReuseIdentifier:PLAZA_HEADER_VIEW_ID
                                  forIndexPath:indexPath];

    headerView.label.text = plaza.name;
    headerView.iconView.image = [UIImage imageNamed:plaza.icon];

    reusableview = headerView;
  }

  return reusableview;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  PlazaUnit *plazaUnit =
      (PlazaUnit *)[((Plaza *)[_plazas objectAtIndex:[indexPath section]]).units
          objectAtIndex:[indexPath row]];

  PlazaCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:PLAZA_CELL_ID
                                                forIndexPath:indexPath];
  [cell.iconButton setTitle:plazaUnit.name forState:UIControlStateNormal];
  [cell.iconButton setBackgroundImage:[UIImage imageNamed:plazaUnit.icon]
                             forState:UIControlStateNormal];
  //  [cell.iconButton setBackgroundImage:[UIImage imageNamed:plazaUnit.icon]
  // forState:UIControlStateHighlighted];
  cell.iconLabel.text = plazaUnit.name;

  cell.iconButton.action = plazaUnit.action;
  [cell.iconButton addTarget:self
                      action:@selector(buttonClick:)
            forControlEvents:UIControlEventTouchUpInside];

  return cell;
}

#pragma mark - click event

- (void)buttonClick:(LinkButton *)_self {
  NavigationTitleController *controller =
      (NavigationTitleController *)[[NSClassFromString(_self.action) alloc]
          initWithTitle:_self.titleLabel.text];
  [controller setHidesBottomBarWhenPushed:YES];

  [self.navigationController pushViewController:controller animated:YES];
}

- (BOOL)shouldAutomaticallyForwardRotationMethods {
  return YES;
}

@end
