//
//  RssFunViewController.m
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RssFunViewController.h"
#import "BlogRssParser.h"
#import "BlogRss.h";
#import "RssFunAppDelegate.h"

@implementation RssFunViewController

@synthesize rssParser = _rssParser;
@synthesize tableView = _tableView;
@synthesize appDelegate = _appDelegate;
@synthesize toolbar = _toolbar;

-(void)toolbarInit{
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
								   initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
								   target:self action:@selector(reloadRss)];
	refreshButton.enabled = NO;
	NSArray *items = [NSArray arrayWithObjects: refreshButton,  nil];
	[self.toolbar setItems:items animated:NO];
	[refreshButton release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self toolbarInit];
	_rssParser = [[BlogRssParser alloc]init];
	self.rssParser.delegate = self;
	[[self rssParser]startProcess];
}
	
-(void)reloadRss{
	[self toggleToolBarButtons:NO];
	[[self rssParser]startProcess];
}

-(void)toggleToolBarButtons:(BOOL)newState{
	NSArray *toolbarItems = self.toolbar.items;
	for (UIBarButtonItem *item in toolbarItems){
		item.enabled = newState;
	}	
}

//Delegate method for blog parser will get fired when the process is completed
- (void)processCompleted{
	//reload the table view
	[self toggleToolBarButtons:YES];
	[[self tableView]reloadData];
}

-(void)processHasErrors{
	//Might be due to Internet
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Rss Fun" message:@"Unable to download rss. Please check if you are connected to internet."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];	
	[alert release];
	[self toggleToolBarButtons:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [[[self rssParser]rssItems]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rssItemCell"];
	if(nil == cell){
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"rssItemCell"]autorelease];
	}
	cell.textLabel.text = [[[[self rssParser]rssItems]objectAtIndex:indexPath.row]title];
	cell.detailTextLabel.text = [[[[self rssParser]rssItems]objectAtIndex:indexPath.row]description];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[[self appDelegate] setCurrentlySelectedBlogItem:[[[self rssParser]rssItems]objectAtIndex:indexPath.row]];
	[self.appDelegate loadNewsDetails];
}


- (void)dealloc {
	[_appDelegate release];
	[_toolbar release];
	[_tableView release];
	[_rssParser release];
    [super dealloc];
}

@end
