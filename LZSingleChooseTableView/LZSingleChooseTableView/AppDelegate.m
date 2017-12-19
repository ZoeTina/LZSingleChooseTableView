//
//  AppDelegate.m
//  LZSingleChooseTableView
//
//  Created by 寕小陌 on 2017/12/19.
//  Copyright © 2017年 寕小陌. All rights reserved.
//

#import "AppDelegate.h"
#import "LZViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#define kColorWithRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor     = [UIColor whiteColor];
    
    LZViewController *mainVC   = [[LZViewController alloc] init];
    mainVC.view.backgroundColor = kColorWithRGB(211, 211, 211);
    navigationController     = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    navigationController.navigationBar.barTintColor = kColorWithRGB(176, 26, 29);
    navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    navigationController.navigationBar.translucent = NO;   // NavigationBar 是否透明
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.window.rootViewController  = navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end