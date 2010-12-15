//
//  RssFunAppDelegate.h
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RssFunViewController;
@class NewsDetailViewController;
@class BlogRss;

@interface RssFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow * _window;
    RssFunViewController * _viewController;
	UINavigationController * _navigationController;
	NewsDetailViewController * _newsDetailController;
	BlogRss * _currentlySelectedBlogItem;
}

@property (nonatomic, retain) IBOutlet UIWindow * window;
@property (nonatomic, retain) IBOutlet RssFunViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController * navigationController;
@property (nonatomic,retain) IBOutlet NewsDetailViewController * newsDetailController;

@property (readwrite,retain) BlogRss * currentlySelectedBlogItem;

-(void)loadNewsDetails;

@end

