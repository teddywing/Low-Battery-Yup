//
//  DaemonLauncher.m
//  Low Battery Yup.d
//
//  Created by Teddy Wing on 12/2/16.
//  Copyright (c) 2016 Teddy Wing. All rights reserved.
//
//  This file is part of Low Battery Yup.
//
//  Low Battery Yup is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as
//  published by the Free Software Foundation, either version 3 of the
//  License, or (at your option) any later version.
//
//  Low Battery Yup  is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
//  General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Low Battery Yup. If not, see
//  <http://www.gnu.org/licenses/>.
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

- (BOOL)isRunning
{
	NSArray *runningApplications = [[NSWorkspace sharedWorkspace] runningApplications];

	for (int i = 0; i < [runningApplications count]; i++) {
		if ([[[runningApplications objectAtIndex:i] bundleIdentifier]
			isEqualToString:@"com.teddywing.Low-Battery-Yup-d"]) {
			return YES;
		}
	}

	return NO;
}

@end
