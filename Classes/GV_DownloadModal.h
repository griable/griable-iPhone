//
//  GV_DownloadModalView.h
//  griable
//
//  Created by Gabriel Slama on 22/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GV_DownloadModal : UIView {
  id controller;
  
  UIView *containerView;  
  UIImageView *statusImageView;
}

@property (nonatomic, retain) IBOutlet id controller;

@property (nonatomic, retain) IBOutlet UIView *containerView;
@property (nonatomic, retain) IBOutlet UIImageView *statusImageView;

- (void)dismiss;
- (void)rotateStatusView;

@end
