//
//  BlogRss.m
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BlogRss.h"


@implementation BlogRss

@synthesize title = _title;
@synthesize description = _description;
@synthesize linkUrl = _linkUrl;
@synthesize guidUrl = _guidUrl;
@synthesize pubDate = _pubDate;
@synthesize mediaUrl = _mediaUrl;

-(void)dealloc{
	self.title = nil;
	self.description = nil;
	self.linkUrl = nil;
	self.guidUrl = nil;
	self.pubDate = nil;
	self.mediaUrl = nil;
	[super dealloc];
}

@end
