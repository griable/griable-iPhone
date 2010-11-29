//
//  GC_ExperienceTableViewController.h
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GC_DownloadModal.h"

@interface GC_ExperienceTableViewScreen : UITableViewController {
	GC_DownloadModal *modalViewController;
  
	NSMutableData *_receivedData;
  NSArray *_data;
}

- (void)drawHeader;

- (void)refreshData;
- (void)loadData;
- (void)showDownloadModalView;

- (GC_DownloadModal*)modalViewController;

@end
