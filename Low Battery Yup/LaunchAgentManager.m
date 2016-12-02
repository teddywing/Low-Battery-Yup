//
//  LaunchAgentManager.m
//  Low Battery Yup.d
//
//  Created by TW on 12/2/16.
//  Copyright (c) 2016 TW. All rights reserved.
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
