//
//  PlazaHeaderView.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-24.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "PlazaHeaderView.h"

@implementation PlazaHeaderView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _backgroundView = [[UIImageView alloc]
        initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, PLAZA_HEADER_VIEW_HEIGHT)];
    _backgroundView.backgroundColor = RGBCOLOR(237, 237, 237);
    _iconView = [[UIImageView alloc]
        initWithFrame:CGRectMake(10, frame.size.height / 2 - 25 / 2, 25, 25)];

    _label = [[UILabel alloc]
        initWithFrame:CGRectMake(_iconView.frame.origin.x +
                                     _iconView.frame.size.width + 10,
                                 0, 100, PLAZA_HEADER_VIEW_HEIGHT)];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.font = [UIFont fontWithName:HEITI_SC_LIGHT size:FONT_SIZE_NORMAL];

    [self.viewForBaselineLayout addSubview:_backgroundView];
    [self.viewForBaselineLayout addSubview:_iconView];
    [self.viewForBaselineLayout addSubview:_label];
  }

  return self;
}

@end
