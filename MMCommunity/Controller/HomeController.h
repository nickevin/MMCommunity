//
//  HomeController.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-18.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BannerView.h"
#import "PlazaView.h"
#import "PlazaCell.h"
#import "PlazaHeaderView.h"

#import "Banner.h"
#import "Plaza.h"
#import "PlazaUnit.h"

@interface HomeController
    : UIViewController <UIScrollViewDelegate, UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout>

// outlets
@property(nonatomic, strong) BannerView *bannerView;
@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, strong) PlazaView *plazaView;

@property(nonatomic, strong) NSMutableArray *plazas;

@end
