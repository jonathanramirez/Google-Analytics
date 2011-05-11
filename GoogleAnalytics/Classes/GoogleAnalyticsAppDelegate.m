//
//  GoogleAnalyticsAppDelegate.m
//  GoogleAnalytics
//
//  Created by Jonathan Ramirez on 05-05-11.
//  Copyright 2011 Xcode.cl and iDevSoftware.net. All rights reserved.
//

#import "GoogleAnalyticsAppDelegate.h"
#import "GANTracker.h"
#import "Static.h"
#import "RootViewController.h"


@implementation GoogleAnalyticsAppDelegate

@synthesize window;
@synthesize rootViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	window.backgroundColor = [UIColor whiteColor];
	
	//Lunch Track
	[self  initGoogleAnalyticsTracker];
	
	
	NSString* uniqueID = [UIDevice currentDevice].uniqueIdentifier;
	[self googleAnalyticsTrackEvent:@"GoogleAnalytics" action:@"Started" label:uniqueID value:-1];
	
    // Override point for customization after application launch.
    rootViewController = [[RootViewController alloc] init];
	[self.window addSubview:rootViewController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[[GANTracker sharedTracker] stopTracker];
    [window release];
    [super dealloc];
}



#pragma mark -
#pragma mark Google Analytics

// Dispatch period in seconds
static const NSInteger kGANDispatchPeriodSec = 10;

-(void)initGoogleAnalyticsTracker{
	[[GANTracker sharedTracker] startTrackerWithAccountID:KGAAccountID dispatchPeriod:kGANDispatchPeriodSec  delegate:nil];
	
	NSError *error;
	if (![[GANTracker sharedTracker] trackPageview:@"/" withError:&error]) {
		// Handle error here
		NSLog(@"initGoogleAnalyticsTracker GANTracker sharedTracker: %@", [error localizedDescription]);  
	}
}

- (void)googleAnalyticsTrackPageview:(NSString *)pageName {  
	NSError *gaError;  
	if (![[GANTracker sharedTracker] trackPageview:pageName withError:&gaError]) {  
		NSLog(@"googleAnalyticsTrackPageview: %@", [gaError localizedDescription]);  
	}  
}  

- (void)googleAnalyticsTrackEvent:(NSString *)category  action:(NSString *)action  label:(NSString *)label  value:(NSInteger)value {  
	NSError *gaError;  
	if (![[GANTracker sharedTracker] trackEvent:category action:action label:label value:value withError:&gaError]) {  
		NSLog(@"googleAnalyticsTrackEvent: %@", [gaError localizedDescription]);  
	}  
}


@end
