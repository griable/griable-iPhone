//
//  GC_SplashScreen.m
//  griable
//
//  Created by Gabriel Slama on 24/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_SplashScreen.h"


@implementation GC_SplashScreen

@synthesize delegate;

#pragma mark -
#pragma mark Dispatch events

- (void)dispatchAnimationCompletion {
  [[self delegate] animationsDidComplete];
}

#pragma mark -
#pragma mark Views Lifecycle

- (void)viewDidUnload {
  [super viewDidUnload];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}

@end