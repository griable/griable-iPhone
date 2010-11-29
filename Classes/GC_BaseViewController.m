//
//  GC_BaseViewController.m
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_BaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GU_Constants.h"

@implementation UINavigationBar (UINavigationBarFlat)

int const kNavigationBarBorderHeight = 2;

- (void)drawRect:(CGRect)rect {	
	UIImage *image = [UIImage imageNamed: @"nav-bar.png"];
  [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
  
	CALayer *bottomLineLayer = [CALayer layer];
	[bottomLineLayer setFrame:CGRectMake(0, self.frame.size.height - kNavigationBarBorderHeight, self.frame.size.width, kNavigationBarBorderHeight)];
	[bottomLineLayer setBackgroundColor:[[GU_Constants highlightColor] CGColor]];
	[[self layer] addSublayer:bottomLineLayer];

	[self setTintColor:[GU_Constants darkColor]];
	
	UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-logo.png"]];
	[logoView setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - kNavigationBarBorderHeight)];
	[self addSubview:logoView];
	[logoView release];
}

@end

@implementation GC_BaseViewController

- (void)dealloc {
    [super dealloc];
}

@end
