//
//  GC_ContactScreen.h
//  griable
//
//  Created by Gabriel Slama on 29/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface GC_ContactScreen : UIViewController <MFMailComposeViewControllerDelegate>

- (void)sendMail;

@end
