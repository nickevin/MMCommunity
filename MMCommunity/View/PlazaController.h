//
//  PlazaController.h
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-25.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PlazaView.h"
#import "PlazaCell.h"
#import "PlazaHeaderView.h"

#import "Plaza.h"
#import "PlazaUnit.h"

@interface PlazaController
    : UIViewController <UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout>

// outlets
@property(nonatomic, strong) PlazaView *plazaView;

@property(nonatomic, strong) NSMutableArray *plazas;

@end
