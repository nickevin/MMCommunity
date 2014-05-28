//
//  AppDelegate.m
//  Tmp
//
//  Created by Kevin Nick on 2014-5-19.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import "AppDelegate.h"

#import "RootController.h"
#import "HomeController.h"
#import "LifeController.h"
#import "MemberController.h"
#import "MoreController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  //  [self initRootViewController];

  return YES;
}

- (void)initRootViewController {
  HomeController *homeController = [[HomeController alloc] init];
  LifeController *lifeController = [[LifeController alloc] init];
  MemberController *memberController = [[MemberController alloc] init];
  MoreController *moreController = [[MoreController alloc] init];

  RootController *rootController = [[RootController alloc] init];
  rootController.viewControllers = @[
    [[UINavigationController alloc] initWithRootViewController:homeController],
    [[UINavigationController alloc] initWithRootViewController:lifeController],
    [[UINavigationController alloc]
        initWithRootViewController:memberController],
    [[UINavigationController alloc] initWithRootViewController:moreController],
  ];

  //  [rootController setSelectedIndex:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = rootController;
  [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state.
  // This can occur for certain types of temporary interruptions (such as an
  // incoming phone call or SMS message) or when the user quits the application
  // and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down
  // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate
  // timers, and store enough application state information to restore your
  // application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called
  // instead of applicationWillTerminate: when the user quits.

  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state;
  // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the
  // application was inactive. If the application was previously in the
  // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if
  // appropriate. See also applicationDidEnterBackground:.
}

@end
