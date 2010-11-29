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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dispatchAnimationCompletion {
  [[self delegate] animationsDidComplete];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
