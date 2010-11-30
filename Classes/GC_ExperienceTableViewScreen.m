//
//  GC_ExperienceTableViewController.m
//  griable
//
//  Created by Gabriel Slama on 21/11/10.
//  Copyright 2010 griable. All rights reserved.
//

#import "GC_ExperienceTableViewScreen.h"
#import "griableAppDelegate.h"
#import "GU_Constants.h"

#import "GV_ExperienceTableViewCell.h"

#import "CJSONDeserializer.h"
#import "ASIHTTPRequest.h"

#import "GC_ExperienceDetailScreen.h"


@implementation GC_ExperienceTableViewScreen

#pragma mark -
#pragma mark View lifecycle¡

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 26)];
  [refreshButton setImage:[UIImage imageNamed:@"icon-refresh.png"] forState:UIControlStateNormal];
  [refreshButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
  
  UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
  [[self navigationItem] setRightBarButtonItem:refreshButtonItem];
  [refreshButton release];
  
  [self refreshData];
}

// download data
- (void)refreshData {
  [self loadData];
  [self showDownloadModalView];
}


// download data
- (void)loadData {
  // json downloading
  NSString *fileUrl = [SERVER_URL stringByAppendingString: @"experience.json"];
  
  NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:fileUrl]];
  NSURLConnection *connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
  
  if (connection) {
    _receivedData = [[NSMutableData data] retain];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
  } else {
    [[self modalViewController] setValue:@"failure" forKeyPath:@"status"];
  }
}

- (void)showDownloadModalView {
  griableAppDelegate *delegate = (griableAppDelegate *)[UIApplication sharedApplication].delegate;
  [delegate.window addSubview:[[self modalViewController] view]];
  [[[self modalViewController] view] setFrame:CGRectMake(0, 20, 320, 460)];
  [[self modalViewController] setValue:@"downloading" forKeyPath:@"status"];
}

- (GC_DownloadModal*)modalViewController {
  if (modalViewController == nil) {
    modalViewController = [[GC_DownloadModal alloc] initWithNibName:@"DownloadModal" bundle:nil];
  }
  
  return modalViewController;
}

#pragma mark -
#pragma mark NSURLConnectionDelegate

// data received
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [_receivedData appendData:data];
}

// download failure
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [[self modalViewController] setValue:@"failure" forKeyPath:@"status"];
  
  [connection release];
  
  [_receivedData release];
  
  NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription]);
  
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

// download finished
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  [[self modalViewController] setValue:@"finished" forKeyPath:@"status"];
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
  
  // json decoding
	NSError *error = nil;
	_data = [[[CJSONDeserializer deserializer] deserializeAsArray:_receivedData error:&error] retain];
  
  // release the connection, and the data object
  [connection release];
  [_receivedData release];
  
  [[self tableView] reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  GV_ExperienceTableViewCell *cell = (GV_ExperienceTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ExperienceTableViewCell" owner:nil options:nil];
		for(id currentObject in topLevelObjects) {
			if([currentObject isKindOfClass:[UITableViewCell class]]) {
				cell = (GV_ExperienceTableViewCell *) currentObject;
				
				break;
			}
		}
	}
  
  NSDictionary *currentRow = [_data objectAtIndex:indexPath.row];
  [cell setExperienceRow:(NSMutableDictionary *)currentRow];
  
  return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  GC_ExperienceDetailScreen *experienceDetailScreen = [[GC_ExperienceDetailScreen alloc] initWithNibName:@"ExperienceDetailScreen" bundle:nil];
  [[self navigationController] pushViewController:experienceDetailScreen animated:YES];
  [experienceDetailScreen setExperienceRow:[_data objectAtIndex:indexPath.row]];
  [experienceDetailScreen release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}


- (void)dealloc {
  [modalViewController release];
  [_data release];
  [super dealloc];
}

@end

