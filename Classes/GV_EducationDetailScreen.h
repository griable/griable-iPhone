//
//  GV_EducationDetailScreen.h
//  griable
//
//  Created by Gabriel Slama on 24/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GV_EducationDetailScreen : UIView {
  id controller;
    
  NSMutableDictionary *value;
  
  UIImageView *logoImageView;
  UIActivityIndicatorView *activityIndicator;
  
  UILabel *titleLabel;
  UILabel *placeLabel;
  UILabel *yearLabel;
  UIView *skillsContainer;
}

@property (nonatomic, retain) IBOutlet id controller;

@property (nonatomic, retain) NSMutableDictionary *value;

@property (nonatomic, retain) IBOutlet UIImageView *logoImageView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *placeLabel;
@property (nonatomic, retain) IBOutlet UILabel *yearLabel;
@property (nonatomic, retain) IBOutlet UIView *skillsContainer;

-(void)displaySkills;

@end
