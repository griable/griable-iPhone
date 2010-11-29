//
//  GC_ContactScreen.m
//  griable
//
//  Created by Gabriel Slama on 29/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_ContactScreen.h"

@implementation GC_ContactScreen

#pragma mark -
#pragma mark Unload views

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Compose Mail

- (void)sendMail {
  MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
  [controller setMailComposeDelegate:self];
  
  if ([MFMailComposeViewController canSendMail]) {
    [controller setToRecipients:[NSArray arrayWithObject:@"contact@griable.com"]];
    [controller setSubject:@" "];
    
    [self presentModalViewController:controller animated:YES];
  }
  
  [controller release];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error  {	
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end
