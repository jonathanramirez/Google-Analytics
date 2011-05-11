    //
//  RootViewController.m
//  GoogleAnalytics
//
//  Created by Jonathan Ramirez on 05-05-11.
//  Copyright 2011 Xcode.cl and iDevSoftware.net. All rights reserved.
//

#import "RootViewController.h"
#import "GoogleAnalyticsAppDelegate.h"

@implementation RootViewController

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView *aView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = aView;
	[aView release];
	
	UIButton *trackMe = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[trackMe setFrame:CGRectMake(100, 70, 100, 44)];
	[trackMe setTitle:@"Track Me" forState:UIControlStateNormal];
	[trackMe addTarget:self action:@selector(touchMe:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:trackMe];
}

#pragma mark -
#pragma mark Button
- (void)touchMe:(id)sender{
	[appDelegate googleAnalyticsTrackEvent:@"Main" action:@"Clicked" label:@"Track Me" value:-1];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[appDelegate googleAnalyticsTrackPageview:@"/Main"];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
