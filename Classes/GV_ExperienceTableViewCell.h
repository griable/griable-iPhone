//
//  GV_ExperienceTableViewCell.h
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GV_ExperienceTableViewCell : UITableViewCell {
	// data
  NSMutableDictionary *experienceRow;
  
  // logo
  UIImageView *logoImageView;
  UIActivityIndicatorView *activityIndicator;
  
  // labels
  UILabel *titleLabel;
  UILabel *placeLabel;
  UILabel *dateLabel;
}

// data
@property (nonatomic, retain) NSMutableDictionary *experienceRow;

// logo
@property (nonatomic, retain) IBOutlet UIImageView *logoImageView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

// labels
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *placeLabel;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;

// refresh data
- (void)reloadData;
- (void)downloadLogo;
- (void)titleLabelAlignTop;

@end
