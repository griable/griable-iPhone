//
//  GV_ContactScreen.m
//  griable
//
//  Created by Gabriel Slama on 29/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GV_ContactScreen.h"
#import "GC_ContactScreen.h"

@implementation GV_ContactScreen

@synthesize controller;

- (IBAction)callCTouch { [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://+33603555012"]]; }
- (IBAction)mailTouch {
  [(GC_ContactScreen *)controller sendMail];
}

- (void)dealloc {
    [super dealloc];
}


@end
