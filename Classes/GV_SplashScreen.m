//
//  GV_SplashScreen.m
//  griable
//
//  Created by Gabriel Slama on 24/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GV_SplashScreen.h"
#import "GC_SplashScreen.h"
#import "GU_Constants.h"

@implementation GV_SplashScreen

const int kSlpashScreenLogoScaleFactor = 4;
const int kSlpashScreenLogoWidth       = 40;
const int kSlpashScreenLogoHeight      = 40;
const int kSlpashScreenLogoMarginTop   = 100;
const int kSlpashScreenLogoPaddingTop  = 40;

@synthesize controller;

@synthesize logoContainerLayer, logoLayer;

#pragma mark -
#pragma mark Draw elements

- (void)drawRect:(CGRect)rect {
  [self drawElements];
  
  [self triggerLogoAnimations];
  [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(triggerBackgroundAnimations) userInfo:nil repeats:NO];
}

- (void)drawElements {
  // logo container layer
  CGRect logoContainerLayerBounds = CGRectMake(0, 0, kSlpashScreenLogoScaleFactor * [[UIScreen mainScreen] bounds].size.width, kSlpashScreenLogoHeight * kSlpashScreenLogoScaleFactor);
  logoContainerLayer = [CALayer layer];
  [logoContainerLayer setBackgroundColor:[[GU_Constants darkColor] CGColor]];
  [logoContainerLayer setBounds:logoContainerLayerBounds];
  [logoContainerLayer setAnchorPoint:CGPointMake(0.5f, 0)];
  [logoContainerLayer setPosition:CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, kSlpashScreenLogoMarginTop)];
  
  // logo layer
  logoLayer = [CALayer layer];
  [logoLayer setAnchorPoint:CGPointMake(0.5f, 0)];
  [logoLayer setBounds:CGRectMake(0, 0, kSlpashScreenLogoHeight * kSlpashScreenLogoScaleFactor, kSlpashScreenLogoWidth * kSlpashScreenLogoScaleFactor)];
  [logoLayer setPosition:CGPointMake([logoContainerLayer bounds].size.width / 2, 2 * kSlpashScreenLogoScaleFactor)];
  UIImage *logoImage = [UIImage imageNamed:@"splash-screen-logo.png"];
  [logoLayer setContents:(id)[logoImage CGImage]];
  
  // adding sublayers
  [logoContainerLayer addSublayer:logoLayer];
  [[self layer] addSublayer:logoContainerLayer];
}

#pragma mark -
#pragma mark Animations

- (void)triggerLogoAnimations {
  CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
  [animationGroup setDuration:1.0f];
  [animationGroup setAnimations:[NSArray arrayWithObjects:[self scaleAnimation], [self positionAnimation], nil]];
  [logoContainerLayer addAnimation:animationGroup forKey:@"group"];
}

- (void)triggerBackgroundAnimations {
  CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
  [animationGroup setDuration:1.5f];
  [animationGroup setAnimations:[NSArray arrayWithObjects:[self backgroundColorAnimation], nil]];
  [animationGroup setDelegate:self];
  [[self layer] addAnimation:animationGroup forKey:@"group"];
}

#pragma mark Logo Animations

- (CABasicAnimation*) scaleAnimation {
  NSValue *value = nil;
  CABasicAnimation *animation = nil;
  CATransform3D transform;
  
  
  [animation setDuration:1.0f];
  
  // from
  animation = [CABasicAnimation animationWithKeyPath:@"transform"];
  transform = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
  value = [NSValue valueWithCATransform3D:transform];
  [animation setFromValue:value];
  
  // to
  transform = CATransform3DMakeScale(0.25f, 0.25f, 1.0f);
  value = [NSValue valueWithCATransform3D:transform];
  [animation setToValue:value];
  
  [logoContainerLayer setTransform:transform];
  
  return animation;
}

- (CABasicAnimation*) positionAnimation {
  CGPoint newPos = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, 0);
  
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
  
  [animation setDuration:1.0f];
  
  [animation setFromValue:[NSValue valueWithCGPoint:[logoContainerLayer position]]];
  [animation setToValue:[NSValue valueWithCGPoint:newPos]];
  
  [logoContainerLayer setPosition:newPos];
  
  return animation;
}

#pragma mark Background Animation

- (CABasicAnimation*) backgroundColorAnimation {
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
  [animation setBeginTime:1.0f];
  [animation setDuration:0.5f];
  [animation setFromValue:(id)[[GU_Constants darkColor] CGColor]];
  [animation setToValue:(id)[[GU_Constants lightColor] CGColor]];
  
  return animation;
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
  [[self layer] setBackgroundColor:[[GU_Constants lightColor] CGColor]];
  [(GC_SplashScreen *)controller dispatchAnimationCompletion];
}

#pragma mark -
#pragma mark Background Memory management

- (void)dealloc {
    [super dealloc];
}


@end
