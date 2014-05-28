//
//  BannerView.m
//  MMCommunity
//
//  Created by Kevin Nick on 2014-5-19.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "BannerView.h"
#import "LinkButton.h"
#import "UIButton+AFNetworking.h"
#import "UIImageView+AFNetworking.h"

#import "Banner.h"

@implementation BannerView

- (id)initWithFrame:(CGRect)frame models:(NSArray *)models {
  self = [super initWithFrame:frame];
  if (self) {
    self.contentSize =
        CGSizeMake(SCREEN_WIDTH * [models count], self.frame.size.height);
    self.scrollEnabled = YES;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;

    [self loadWithModels:models];
  }

  return self;
}

#pragma mark - load image from URL

- (void)loadWithModels:(NSArray *)models {
  for (int idx = 0; idx < [models count]; idx++) {
    Banner *model = (Banner *)models[idx];

    //              UIImage *image = [Utils
    // convertImage:model.imgUrl];

    LinkButton *bannerBtn = [[LinkButton alloc]
        initWithFrame:CGRectMake(idx * SCREEN_WIDTH, 0, SCREEN_WIDTH,
                                 self.frame.size.height)];

    [bannerBtn setImageForState:UIControlStateNormal
                        withURL:[NSURL URLWithString:model.imgUrl]
               placeholderImage:[UIImage imageNamed:@"banner-placeholder"]];

    //              [bannerBtn setBackgroundImage:image
    //                                    forState:UIControlStateNormal];
    //              [bannerBtn setBackgroundImage:image
    //                                    forState:UIControlStateHighlighted];
    bannerBtn.action = model.imgUrl;
    [bannerBtn addTarget:self
                  action:@selector(buttonClick:)
        forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:bannerBtn];

    //    UIImageView *imgView = [[UIImageView alloc]
    //        initWithFrame:CGRectMake(idx * SCREEN_WIDTH, 0, SCREEN_WIDTH,
    //                                 self.frame.size.height * 2)];
    //    imgView.contentMode = UIViewContentModeScaleAspectFill;
    //    [imgView setImageWithURL:[NSURL URLWithString:model.imgUrl]
    //            placeholderImage:[UIImage imageNamed:@"banner-placeholder"]];
    //    [self addSubview:imgView];
  }
}

#pragma mark - click event

- (void)buttonClick:(LinkButton *)_self {
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title"
                                                      message:_self.action
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
  [alertView show];
}

//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4",
// nil];
//
//        self.contentSize =
//        CGSizeMake(SCREEN_WIDTH * [array count], STATUS_BAR_HEIGHT);
//        self.scrollEnabled = YES;
//        self.pagingEnabled = YES;
//        self.indicatorStyle = UIScrollViewIndicatorStyleBlack;
//        self.showsHorizontalScrollIndicator = NO;
//        self.showsVerticalScrollIndicator = NO;
//
//        for (int idx = 0; idx < [array count]; idx++) {
//            //      UIImage *img = [UIImage imageNamed:[array
// objectAtIndex:idx]];
//            //      UIImageView *imgView = [[UIImageView alloc]
// initWithImage:img];
//            //      imgView.frame = CGRectMake(idx * SCREEN_WIDTH, 0, 320,
//            // frame.size.height);
//            //
//            //      [self addSubview:imgView];
//
//            LinkButton *bannerBtn = [[LinkButton alloc]
//                                      initWithFrame:CGRectMake(idx *
// SCREEN_WIDTH, 0, SCREEN_WIDTH,
//                                                               frame.size.height)];
//
//            NSString *imgName = [[NSString alloc]
//                                 initWithFormat:@"banner-%@", [array
// objectAtIndex:idx]];
//            [bannerBtn setBackgroundImage:[UIImage imageNamed:imgName]
//                                  forState:UIControlStateNormal];
//            [bannerBtn
//             setBackgroundImage:[UIImage imageNamed:[array objectAtIndex:idx]]
//             forState:UIControlStateHighlighted];
//            bannerBtn.url = [[NSString alloc]
//                              initWithFormat:@"https://developer.apple.com/%d",
// idx];
//
//            [bannerBtn addTarget:self
//                           action:@selector(buttonClick:)
//                 forControlEvents:UIControlEventTouchUpInside];
//
//            [self addSubview:bannerBtn];
//        }
//    }
//
//    return self;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
