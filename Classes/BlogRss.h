//
//  BlogRss.h
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BlogRss : NSObject {
	NSString * _title;
	NSString * _description;
	NSString * _linkUrl;
	NSString * _guidUrl;
	NSDate * _pubDate;	
	NSString * _mediaUrl;
}

@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * description;
@property(nonatomic, copy) NSString * linkUrl;
@property(nonatomic, copy) NSString * guidUrl;
@property(nonatomic, retain) NSDate * pubDate;
@property(nonatomic,copy) NSString * mediaUrl;

@end
