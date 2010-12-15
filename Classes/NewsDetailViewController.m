//
//  NewsDetailViewController.m
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "RssFunAppDelegate.h"
#import "BlogRss.h";

@implementation NewsDetailViewController

@synthesize appDelegate = _appDelegate;
@synthesize titleTextView = _titleTextView;
@synthesize descriptionTextView = _descriptionTextView;
@synthesize toolbar = _toolbar;
@synthesize image = _image;

-(void)viewDidLoad{
	[super viewDidLoad];
	
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc]
									  initWithBarButtonSystemItem:UIBarButtonSystemItemAction
									  target:self action:@selector(openWebLink)];
	NSArray *items = [NSArray arrayWithObjects: actionButton,  nil];
	[self.toolbar setItems:items animated:NO];
	[actionButton release];
}

-(void)openWebLink{
	// open a dialog with an OK and cancel button
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Do you want to open current item in browser?"
															 delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	[actionSheet showFromToolbar:_toolbar];
	[actionSheet release];	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	if(buttonIndex == 0){
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[[self appDelegate] currentlySelectedBlogItem]linkUrl]]];
	}
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	NSString * mediaUrl = [[[self appDelegate]currentlySelectedBlogItem]mediaUrl];
	[[self image]setImage:[UIImage imageNamed:@"unknown.jpg"]];
	if(nil != mediaUrl){
		NSData* imageData;
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		@try {
			imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:mediaUrl]];
		}
		@catch (NSException * e) {
			//Some error while downloading data
		}
		@finally {
			UIImage * imageFromImageData = [[UIImage alloc] initWithData:imageData];
			[[self image]setImage:imageFromImageData];
			[imageData release];
			[imageFromImageData release];
		}
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	}
	self.titleTextView.text = [[[self appDelegate] currentlySelectedBlogItem]title];
	self.descriptionTextView.text = [[[self appDelegate] currentlySelectedBlogItem]description]; 
}

- (void)dealloc {
	[_appDelegate release];
    [super dealloc];
}


@end
