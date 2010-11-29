//
//  griableAppDelegate.h
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GC_SplashScreen.h"

@interface griableAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, GC_SplashScreenDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
