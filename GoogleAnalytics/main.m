//
//  main.m
//  GoogleAnalytics
//
//  Created by Jonathan Ramirez on 05-05-11.
//  Copyright 2011 Xcode.cl and iDevSoftware.net. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"GoogleAnalyticsAppDelegate");
    [pool release];
    return retVal;
}
