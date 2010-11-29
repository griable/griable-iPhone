//
//  GV_ExperienceTableViewCell.m
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GV_ExperienceTableViewCell.h"
#import "ASIHTTPRequest.h"

@implementation GV_ExperienceTableViewCell

@synthesize experienceRow;

@synthesize logoImageView, activityIndicator;
@synthesize titleLabel, placeLabel, dateLabel;

#pragma mark -
#pragma mark Data Management

- (void)setExperienceRow:(NSMutableDictionary *)value {
  if (value == experienceRow) {
    return;
  }
  
  [experienceRow autorelease];
  experienceRow = [value retain];
  
  [self reloadData];
}

- (void)reloadData {
  [titleLabel setText:[experienceRow objectForKey:@"title"]];
	[placeLabel setText:[NSString stringWithFormat:@"@%@", [experienceRow objectForKey:@"place"]]];
  [dateLabel setText:[experienceRow objectForKey:@"date"]];
  
  [self titleLabelAlignTop];
  
  if (![[experienceRow objectForKey:@"image"] isEqualToString:@""]) {
    [self downloadLogo];
  }
  else if ([activityIndicator isAnimating]) {
    [activityIndicator stopAnimating];
  }

}

#pragma mark -
#pragma mark DownloadLogo

- (void)downloadLogo {
  [activityIndicator startAnimating];
  
  NSString *logoPath = [SERVER_URL stringByAppendingFormat:@"images/logos/%@", [experienceRow objectForKey:@"image"]];
  NSLog(@"%@", logoPath);
  NSURL *logoURL     = [NSURL URLWithString:logoPath];
  
  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:logoURL];
  [request setDelegate:self];
  [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
  NSData *responseData = [request responseData];
  [logoImageView setImage:[UIImage imageWithData:responseData]]; 
  
  // ui
  [activityIndicator stopAnimating];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
  [activityIndicator stopAnimating];
}

#pragma mark -
#pragma mark View

- (void)titleLabelAlignTop {
  CGRect oldFrame = [titleLabel frame];
  
  CGSize maximumSize = CGSizeMake(oldFrame.size.width, oldFrame.size.height);
  NSString *titleString = [titleLabel text];
  
  CGSize titleStringSize = [titleString sizeWithFont:[titleLabel font] constrainedToSize:maximumSize lineBreakMode:[titleLabel lineBreakMode]];
  
  CGRect newFrame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, titleStringSize.height);
  
  [titleLabel setFrame:newFrame];
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
  [experienceRow release];
  
  [super dealloc];
}

@end
