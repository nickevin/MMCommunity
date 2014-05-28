//
//  PlazaHeaderView.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-24.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
// 

#import <UIKit/UIKit.h>

#define PLAZA_HEADER_VIEW_ID @"PlazaHeaderView"
#define PLAZA_HEADER_VIEW_HEIGHT 35

@interface PlazaHeaderView : UICollectionReusableView

@property(strong, nonatomic) UIImageView *backgroundView;
@property(strong, nonatomic) UIImageView *iconView;
@property(strong, nonatomic) UILabel *label;

@end
