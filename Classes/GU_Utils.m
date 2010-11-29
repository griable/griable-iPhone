//
//  GU_Utils.m
//  griable
//
//  Created by Gabriel Slama on 28/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GU_Utils.h"


@implementation GU_Utils

+ (void)alignTopLabel:(UILabel *)label {
  CGRect oldFrame = [label frame];
  
  CGSize maximumSize = CGSizeMake(oldFrame.size.width, oldFrame.size.height);
  NSString *labelString = [label text];
  
  CGSize labelStringSize = [labelString sizeWithFont:[label font] constrainedToSize:maximumSize lineBreakMode:[label lineBreakMode]];
  
  CGRect newFrame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, labelStringSize.height);
  
  [label setFrame:newFrame];
}

@end
