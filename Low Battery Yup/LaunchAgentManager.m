//
//  LaunchAgentManager.m
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

#import "LaunchAgentManager.h"

@implementation LaunchAgentManager

- (id)init
{
    self = [super init];
    if (self) {
        _file_manager = [NSFileManager defaultManager];
    }
    return self;
}

- (BOOL)install
{
	NSBundle *main_bundle = [NSBundle mainBundle];
	NSURL *launchagents_url = [NSURL fileURLWithPath:
		[[LAUNCH_AGENTS_PATH stringByAppendingString:@"/com.teddywing.Low-Battery-Yup.StartAtLogin.plist"] stringByExpandingTildeInPath]
		isDirectory:YES];

	NSError *error;
	BOOL success = [_file_manager copyItemAtURL:
			[main_bundle URLForResource:@"com.teddywing.Low-Battery-Yup.StartAtLogin" withExtension:@"plist"]
		toURL:launchagents_url
		error:&error];

	if (!success) {
		NSLog(@"%@", error);
	}

	return success;
}

- (BOOL)uninstall
{
	return [[NSWorkspace sharedWorkspace]
		performFileOperation:NSWorkspaceRecycleOperation
		source:[LAUNCH_AGENTS_PATH stringByExpandingTildeInPath]
		destination:@""
		files:[NSArray arrayWithObject:@"com.teddywing.Low-Battery-Yup.StartAtLogin.plist"]
		tag:nil];
}

@end
