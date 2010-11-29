//
//  GC_EducationDetailScreen.h
//  griable
//
//  Created by Gabriel Slama on 23/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GC_EducationDetailScreen : UIViewController {
  NSMutableDictionary *educationRow;
}

@property (nonatomic, retain) NSMutableDictionary *educationRow;

- (void)pop;
- (void)downloadLogo;

@end
