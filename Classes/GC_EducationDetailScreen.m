//
//  GC_EducationDetailScreen.m
//  griable
//
//  Created by Gabriel Slama on 23/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_EducationDetailScreen.h"
#import "GV_EducationDetailScreen.h"
#import "ASIHTTPRequest.h"

@implementation GC_EducationDetailScreen

@synthesize educationRow;

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

- (void)setEducationRow:(NSMutableDictionary *)value {
  if (value == educationRow) {
    return;
  }
  
  [educationRow autorelease];
  educationRow = [value retain];
  
  [self downloadLogo];
}

#pragma mark -
#pragma mark DownloadLogo

- (void)downloadLogo {
  NSString *logoPath = [SERVER_URL stringByAppendingFormat:@"images/logos/%@", [educationRow objectForKey:@"image"]];
  NSURL *logoURL     = [NSURL URLWithString:logoPath];
  
  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:logoURL];
  [request setDelegate:self];
  [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
  NSData *responseData = [request responseData];
  [[(GV_EducationDetailScreen *)[self view] logoImageView] setImage:[UIImage imageWithData:responseData]]; 
  
  [[(GV_EducationDetailScreen *)[self view] activityIndicator] stopAnimating];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
  [[(GV_EducationDetailScreen *)[self view] activityIndicator] stopAnimating];
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
  [educationRow release];
  [super dealloc];
}


@end
