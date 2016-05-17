//
//  AppDelegate.m
//  DLNavigationTransition
//
//  Created by vera on 16/5/17.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "DLNavigationTransition.h"
#import "DLNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /*
     开启右滑返回手势
     
     注意：
     1.一定要在appDelegate里面开启，并且在UINavigationController初始化之前，否则没有效果。
     2.如果用的storyboard，直接在appDelegate类didFinishLaunchingWithOptions开启即可
    */
    [DLNavigationTransition enableNavigationTransitionWithPanGestureBack];

    
    OneViewController *oneCtrl = [[OneViewController alloc] init];
    //初始化导航控制器
    DLNavigationViewController *nav = [[DLNavigationViewController alloc] initWithRootViewController:oneCtrl];
    self.window.rootViewController = nav;
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
