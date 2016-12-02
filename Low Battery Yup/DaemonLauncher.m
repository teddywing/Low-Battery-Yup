//
//  DaemonLauncher.m
//  Low Battery Yup.d
//
//  Created by TW on 12/2/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "DaemonLauncher.h"

@implementation DaemonLauncher

- (BOOL)launch
{
	NSURL *daemon_url = [[NSBundle mainBundle] URLForResource:@"Low Battery Yup.d" withExtension:@"app"];

	NSError *error = nil;
	[[NSWorkspace sharedWorkspace]
		launchApplicationAtURL:daemon_url
		options:NSWorkspaceLaunchWithoutAddingToRecents | NSWorkspaceLaunchWithoutActivation
		configuration:nil
		error:&error];

	if (error != nil) {
		NSLog(@"%@", error);
		return NO;
	}

	return YES;
}

- (BOOL)quit
{
	NSArray *applications = [NSRunningApplication
		runningApplicationsWithBundleIdentifier:@"com.teddywing.Low-Battery-Yup-d"];

	if ([applications count] > 0) {
		NSRunningApplication *daemon = [applications objectAtIndex:0];
		return [daemon terminate];
	}

	return NO;
}

@end
