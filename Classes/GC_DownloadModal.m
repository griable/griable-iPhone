//
//  GC_DownloadModalViewController.m
//  griable
//
//  Created by Gabriel Slama on 22/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_DownloadModal.h"


@implementation GC_DownloadModal

@synthesize status;

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle {
  if (self = [super initWithNibName:nibName bundle:bundle]) {
    [[self view] setBounds:[[UIScreen mainScreen] bounds]];
  }
  return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
  [self setStatus:@"connecting"];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
