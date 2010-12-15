//
//  RssFunAppDelegate.m
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RssFunAppDelegate.h"
#import "RssFunViewController.h"
#import "NewsDetailViewController.h"
#import "BlogRss.h"

@implementation RssFunAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navigationController = _navigationController;
@synthesize newsDetailController = _newsDetailController;
@synthesize currentlySelectedBlogItem = _currentlySelectedBlogItem;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    _navigationController.viewControllers = [NSArray arrayWithObject:_viewController];
	
    // Override point for customization after app launch    
    [_window addSubview:_navigationController.view];
    [_window makeKeyAndVisible];
}

-(void)loadNewsDetails{
	[[self navigationController]pushViewController:_newsDetailController animated:YES];
}


- (void)dealloc {
	[_navigationController release];
    [_viewController release];
    [_window release];
    [super dealloc];
}


@end
