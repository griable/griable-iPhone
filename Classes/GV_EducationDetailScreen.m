//
//  GV_EducationDetailScreen.m
//  griable
//
//  Created by Gabriel Slama on 24/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GV_EducationDetailScreen.h"
#import "GU_Utils.h"
#import <QuartzCore/QuartzCore.h>

@implementation GV_EducationDetailScreen

@synthesize controller;

@synthesize value;

@synthesize logoImageView, activityIndicator;
@synthesize titleLabel, placeLabel, yearLabel;
@synthesize skillsContainer;

const int kEducationSkillBorderWidth = 2;
const int kEducationSkillTextPadding = 2;
const int kEducationSkillMarginRight = 10;

- (void)awakeFromNib {
  [controller addObserver:self forKeyPath:@"educationRow" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)drawRect:(CGRect)rect {
  [[[self logoImageView] layer] setBorderWidth:1.0f];
  [[[self logoImageView] layer] setBorderColor:[[UIColor blackColor] CGColor]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (keyPath == @"educationRow") {
    value = [change objectForKey:@"new"];
    [titleLabel setText: [value objectForKey:@"title"]];
    [GU_Utils alignTopLabel:titleLabel];
    
    [placeLabel setText: [NSString stringWithFormat:@"@ %@", [value objectForKey:@"place"]]];
    [yearLabel setText: [[value objectForKey:@"year"] stringValue]];
    
    [self displaySkills];
  }
}

-(void)displaySkills {
  for (UIView *subView in [skillsContainer subviews]) {
    [subView removeFromSuperview];
  }
  
  int hOffset = 0;
  for (NSString *skill in [value objectForKey:@"skills"]) {
    int skillsContainerHeight = [skillsContainer frame].size.height;
    
    // text size
    CGSize textSize = [skill sizeWithFont:[UIFont systemFontOfSize:11.0f] constrainedToSize:CGSizeMake(1000.0f, [skillsContainer bounds].size.height) lineBreakMode:UILineBreakModeWordWrap];
    
    // background view
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(hOffset, 0, textSize.width + kEducationSkillBorderWidth + kEducationSkillTextPadding * 2, skillsContainerHeight)];
    [backgroundView setBackgroundColor:[UIColor darkGrayColor]];
    
    // left border
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kEducationSkillBorderWidth, skillsContainerHeight)];
    [borderView setBackgroundColor:[UIColor lightGrayColor]];
    [backgroundView addSubview:borderView];
    [borderView release];
    
    // label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kEducationSkillBorderWidth + kEducationSkillTextPadding, 0, textSize.width, skillsContainerHeight)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:11.0f]];
    [label setText:skill];
    [backgroundView addSubview:label];
    [label release];
    
    [skillsContainer addSubview:backgroundView];
    [backgroundView release];
    
    hOffset += textSize.width + kEducationSkillMarginRight;
  }
}

- (void)dealloc {
  [controller removeObserver:self forKeyPath:@"educationRow"];
  
  [value release];
  
  [super dealloc];
}


@end
