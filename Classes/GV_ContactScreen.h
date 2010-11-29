//
//  GV_ContactScreen.h
//  griable
//
//  Created by Gabriel Slama on 29/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GV_ContactScreen : UIView {
  id controller;
}

@property (nonatomic, retain) IBOutlet id controller;

- (IBAction)callCTouch;
- (IBAction)mailTouch;

@end
