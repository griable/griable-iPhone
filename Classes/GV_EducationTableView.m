//
//  GV_EducationTableView.m
//  griable
//
//  Created by Gabriel Slama on 29/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GV_EducationTableView.h"

@implementation GV_EducationTableView

- (void)drawRect:(CGRect)rect {
  [self  setSeparatorColor:[GU_Constants highlightColor]];
  [self drawHeader];
}

- (void)drawHeader {
  // container
  UIView *headerView = [[[UIView alloc] init] autorelease];
  [headerView setFrame:CGRectMake(0, 0, 320, 80)];
  [headerView setBackgroundColor:[[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"table-view-header-background.png"]] autorelease]];
  
  // text
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 60)];
  [label setFont:[UIFont systemFontOfSize:20.0f]];
  [label setTextColor:[GU_Constants highlightColor]];
  [label setBackgroundColor:[UIColor clearColor]];
  [label setText:@"EDUCATION"];
  
  [headerView addSubview:label];
  [label release];
  
  // separator
  UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, 78, 320, 2)];
  [separator setBackgroundColor:[GU_Constants highlightColor]];
  
  [headerView addSubview:separator];
  [separator release];
  
  [self setTableHeaderView:headerView];
}

- (void)dealloc {
    [super dealloc];
}


@end
