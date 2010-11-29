//
//  GC_ExperienceDetailScreen.h
//  griable
//
//  Created by Gabriel Slama on 23/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GC_ExperienceDetailScreen : UIViewController {
  NSMutableDictionary *experienceRow;
}

@property (nonatomic, retain) NSMutableDictionary *experienceRow;

- (void)pop;
- (void)downloadLogo;

@end
