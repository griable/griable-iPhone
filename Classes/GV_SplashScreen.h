//
//  GV_SplashScreen.h
//  griable
//
//  Created by Gabriel Slama on 24/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface GV_SplashScreen : UIView {
  id controller;
  
  CALayer *logoContainerLayer;
  CALayer *logoLayer;
}

@property (nonatomic, retain) IBOutlet id controller;

@property (nonatomic, retain) CALayer *logoContainerLayer;
@property (nonatomic, retain) CALayer *logoLayer;

- (void)drawElements;

- (void)triggerLogoAnimations;
- (void)triggerBackgroundAnimations;

- (CABasicAnimation*) scaleAnimation;
- (CABasicAnimation*) positionAnimation;
- (CABasicAnimation*) backgroundColorAnimation;

@end