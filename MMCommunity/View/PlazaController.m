//
//  PlazaController.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-25.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "PlazaController.h"

@interface PlazaController ()

@end

@implementation PlazaController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self initDatasource];
  [self initView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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
  UICollectionViewFlowLayout *layout =
      [[UICollectionViewFlowLayout alloc] init];
  [layout setItemSize:CGSizeMake(SCREEN_WIDTH / 3 - 10, SCREEN_WIDTH / 3 - 15)];
  layout.sectionInset = UIEdgeInsetsMake(0, 0, 20, 0);
  layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 30);

  _plazaView = [[PlazaView alloc]
             initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,
                                      SCREEN_HEIGHT - TAB_BAR_HEIGHT -
                                          STATUS_BAR_HEIGHT - 250)
      collectionViewLayout:layout];
  [_plazaView setShowsVerticalScrollIndicator:NO];
  [_plazaView setDataSource:self];
  [_plazaView setDelegate:self];
  [_plazaView registerClass:[PlazaCell class]
      forCellWithReuseIdentifier:PLAZA_CELL_ID];
  [_plazaView registerClass:[PlazaHeaderView class]
      forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
             withReuseIdentifier:PLAZA_HEADER_VIEW_ID];

  [self.view addSubview:_plazaView];
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

@end
