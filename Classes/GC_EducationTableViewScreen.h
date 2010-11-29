//
//  GC_EducationTableViewScreen.h
//  griable
//
//  Created by Gabriel Slama on 22/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GC_DownloadModal.h"

@interface GC_EducationTableViewScreen : UITableViewController {
  GC_DownloadModal *modalViewController;
  
	NSMutableData *_receivedData;
  NSArray *_data;
}

- (void)addRefreshButton;

- (void)refreshData;
- (void)loadData;
- (void)showDownloadModalView;

- (GC_DownloadModal*)modalViewController;

@end
