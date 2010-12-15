//
//  NewsDetailViewController.h
//  RssFun
//
//  Created by Imthiaz Rafiq on 8/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RssFunAppDelegate;

@interface NewsDetailViewController : UIViewController <UIActionSheetDelegate>{
	RssFunAppDelegate * _appDelegate;
	UITextView * _titleTextView;
	UITextView * _descriptionTextView;
	UIToolbar * _toolbar;
	UIImageView * _image;
}

@property (nonatomic, retain) IBOutlet RssFunAppDelegate * appDelegate;
@property (nonatomic, retain) IBOutlet UITextView * titleTextView;
@property (nonatomic, retain) IBOutlet UITextView * descriptionTextView;
@property (nonatomic, retain) IBOutlet UIToolbar * toolbar;
@property (nonatomic, retain) IBOutlet UIImageView * image;

@end
