//
//  griableAppDelegate.m
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "griableAppDelegate.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"

@implementation griableAppDelegate

@synthesize window;
@synthesize tabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
  // ASIHTTP caching
  [ASIHTTPRequest setDefaultCache:[ASIDownloadCache sharedCache]];
  
  // load splash screen
  GC_SplashScreen *splashScreen = [[GC_SplashScreen alloc] initWithNibName:@"SplashScreen" bundle:nil];
  [[splashScreen view] setFrame:CGRectMake(0, 20, 320, 460)];
  [splashScreen setDelegate:self];
  
  [window addSubview:[splashScreen view]];
  [splashScreen release];
  
  [window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark -
#pragma mark GV_SplashScreenDelegate

- (void)animationsDidComplete {
  [window addSubview:tabBarController.view];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application { }


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

