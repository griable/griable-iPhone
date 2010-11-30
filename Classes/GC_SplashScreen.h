//
//  GC_SplashScreen.h
//  griable
//
//  Created by Gabriel Slama on 24/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GC_SplashScreenDelegate

@required
-(void)animationsDidComplete;
@end

@interface GC_SplashScreen : UIViewController {
  id delegate;
}

@property (nonatomic,assign) id <GC_SplashScreenDelegate> delegate;

- (void)dispatchAnimationCompletion;

@end