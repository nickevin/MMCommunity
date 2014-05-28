//
//  Constants.h
//  MMCommunity
//
//  Created by Kevin Nick on 2012-10-28.
//  Copyright (c) 2012年 com.zen. All rights reserved.
//

#define NSLog(fmt, ...)                                                        \
  NSLog((@"%s [Line: %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define NSLogPoint(p) NSLog(@"%f, %f", p.x, p.y);
#define NSLogSize(p) NSLog(@"%f, %f", p.width, p.height);
#define NSLogRect(p)                                                           \
  NSLog(@"%f, %f, %f, %f", p.origin.x, p.origin.y, p.size.width, p.size.height);

#define CLEARCOLOR [UIColor clearColor]
#define RGBCOLOR(r, g, b)                                                      \
  [UIColor colorWithRed:(r) / 255.0f                                           \
                  green:(g) / 255.0f                                           \
                   blue:(b) / 255.0f                                           \
                  alpha:1]
#define RGBACOLOR(r, g, b, a)                                                  \
  [UIColor colorWithRed:(r) / 255.0f                                           \
                  green:(g) / 255.0f                                           \
                   blue:(b) / 255.0f                                           \
                  alpha:(a)]

#define FRAME_X(frame) (frame.origin.x)
#define FRAME_Y(frame) (frame.origin.y)
#define FRAME_W(frame) (frame.size.width)
#define FRAME_H(frame) (frame.size.height)

#define FONT_SIZE_SMALL 12.0f
#define FONT_SIZE_NORMAL 14.0f
#define FONT_SIZE_MEDIUM 16.0f
#define FONT_SIZE_LARGE 18.0f

#define HELVETICA @"Helvetica"
#define HELVETICA_LIGHT @"Helvetica-Light"
#define HELVETICA_BOLD @"Helvetica-Bold"
#define HELVETICANEUE @"HelveticaNeue"
#define HELVETICANEUE_LIGHT @"HelveticaNeue-Light"
#define HELVETICANEUE_BOLD @"HelveticaNeue-Bold"

#define HEITI_SC_LIGHT @"STHeitiSC-Light"
#define HEITI_SC_MEDIUM @"STHeitiSC-Medium"

#define ANIMATION_DURATION 0.35

#define IS_IPHONE_5 ([UIScreen mainScreen].bounds.size.height == 568.0)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define PICKER_HEIGHT 216.0f
#define KEYBOARD_HEIGHT_PORTRAIT 216.0f
#define KEYBOARD_HEIGHT_LANDSCAPE 162.0f
#define STATUS_BAR_HEIGHT 20.0f
#define SEARCH_BAR_HEIGHT 44.0f
#define TAB_BAR_HEIGHT 49.0f
#define TABLE_VIEW_HEIGHT NAVIGATION_CONTROLLER_HEIGHT - NAVIGATION_BAR_HEIGHT
#define TABLE_VIEW_CELL_HEIGHT 44.0f
#define NAVIGATION_CONTROLLER_HEIGHT SCREEN_HEIGHT - STATUS_BAR_HEIGHT
#define NAVIGATION_BAR_HEIGHT 44.0f
