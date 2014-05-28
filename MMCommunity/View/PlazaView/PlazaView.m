//
//  PlazaView.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-19.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "PlazaView.h"

//#import "UIImageView+AFNetworking.h"

@interface PlazaView () {
}

@end

@implementation PlazaView

- (id)initWithFrame:(CGRect)frame
    collectionViewLayout:(UICollectionViewLayout *)layout {
  self = [super initWithFrame:frame collectionViewLayout:layout];
  if (self) {
    self.backgroundColor = [UIColor clearColor];
  }

  return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
