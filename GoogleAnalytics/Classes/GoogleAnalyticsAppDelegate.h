//
//  GoogleAnalyticsAppDelegate.h
//  GoogleAnalytics
//
//  Created by Jonathan Ramirez on 05-05-11.
//  Copyright 2011 Xcode.cl and iDevSoftware.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#define appDelegate ((GoogleAnalyticsAppDelegate *)([[UIApplication sharedApplication] delegate]))

@class RootViewController;
@interface GoogleAnalyticsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	RootViewController *rootViewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *rootViewController;


#pragma mark -
#pragma mark Google Analytics
- (void)initGoogleAnalyticsTracker;
- (void)googleAnalyticsTrackPageview:(NSString *)pageName;
- (void)googleAnalyticsTrackEvent:(NSString *)category  action:(NSString *)action  label:(NSString *)label  value:(NSInteger)value;
@end

