//
//  PlazaCell.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-23.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LinkButton.h"

#define PLAZA_CELL_ID @"PlazaCell"

@interface PlazaCell : UICollectionViewCell

@property(strong, nonatomic) LinkButton *iconButton;
@property(strong, nonatomic) UILabel *iconLabel;

@end
