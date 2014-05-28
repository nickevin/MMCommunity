//
//  PlazaCell.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-23.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "PlazaCell.h"

static NSUInteger const PLAZA_ICON_WIDTH = 45;
static NSUInteger const PLAZA_ICON_HEIGHT = 45;

@implementation PlazaCell

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];

    _iconButton = [LinkButton buttonWithType:UIButtonTypeCustom];
    [_iconButton
        setFrame:CGRectMake(frame.size.width / 2 - PLAZA_ICON_WIDTH / 2,
                            frame.size.height / 2 - PLAZA_ICON_HEIGHT / 2,
                            PLAZA_ICON_WIDTH, PLAZA_ICON_HEIGHT)];
    [_iconButton setClipsToBounds:false];
    //    [_iconButton.titleLabel setFont:[UIFont fontWithName:HEITI_SC_LIGHT
    // size:FONT_SIZE_SMALL]];
    [_iconButton setTitleColor:[UIColor clearColor] // 避免按钮文字过长
                      forState:UIControlStateNormal];

    int offset = 10;
    _iconLabel = [[UILabel alloc]
        initWithFrame:CGRectMake(frame.size.width / 2 -
                                     (PLAZA_ICON_WIDTH + offset) / 2,
                                 _iconButton.frame.size.height +
                                     _iconButton.frame.origin.y + 10,
                                 PLAZA_ICON_WIDTH + offset, FONT_SIZE_SMALL)];
    _iconLabel.textAlignment = NSTextAlignmentCenter;
    _iconLabel.font = [UIFont fontWithName:HEITI_SC_LIGHT size:FONT_SIZE_SMALL];

    [self.viewForBaselineLayout addSubview:_iconButton];
    [self.viewForBaselineLayout addSubview:_iconLabel];

    //    self.viewForBaselineLayout.layer.masksToBounds = YES;
    //    self.viewForBaselineLayout.layer.cornerRadius = 8.0f;
  }

  return self;
}

@end
