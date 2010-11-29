//
//  GC_ExperienceDetailScreen.m
//  griable
//
//  Created by Gabriel Slama on 23/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_ExperienceDetailScreen.h"
#import "GV_ExperienceDetailScreen.h"
#import "ASIHTTPRequest.h"

@implementation GC_ExperienceDetailScreen

@synthesize experienceRow;

#pragma mark -
#pragma mark Views Lifecycle

- (void)viewDidLoad {
  UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 26)];
  [backButton setImage:[UIImage imageNamed:@"icon-back.png"] forState:UIControlStateNormal];
  [backButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
  
  UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
  [[self navigationItem] setLeftBarButtonItem:backButtonItem];
}

- (void)pop {
  [[self navigationController] popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Getters & Setters

- (void)setExperienceRow:(NSMutableDictionary *)value {
  if (value == experienceRow) {
    return;
  }
  
  [experienceRow autorelease];
  experienceRow = [value retain];
  
  [self downloadLogo];
}

#pragma mark -
#pragma mark DownloadLogo

- (void)downloadLogo {
  NSString *logoPath = [SERVER_URL stringByAppendingFormat:@"images/logos/%@", [experienceRow objectForKey:@"image"]];
  NSURL *logoURL     = [NSURL URLWithString:logoPath];
  
  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:logoURL];
  [request setDelegate:self];
  [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
  NSData *responseData = [request responseData];
  [[(GV_ExperienceDetailScreen *)[self view] logoImageView] setImage:[UIImage imageWithData:responseData]]; 
  
  [[(GV_ExperienceDetailScreen *)[self view] activityIndicator] stopAnimating];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
  [[(GV_ExperienceDetailScreen *)[self view] activityIndicator] stopAnimating];
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
  [experienceRow release];
  [super dealloc];
}


@end
