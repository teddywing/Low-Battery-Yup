//
//  FakeAlert.m
//  Low Battery Yup.d
//
//  Created by TW on 12/2/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "FakeAlert.h"

@implementation FakeAlert

- (NSRect)frame
{
	NSWindow *window = [[NSWindow alloc]
		initWithContentRect:NSMakeRect(0, 0, LOW_BATTERY_ALERT_WIDTH, LOW_BATTERY_ALERT_HEIGHT)
		styleMask:NSTitledWindowMask
		backing:NSBackingStoreBuffered
		defer:YES];
	[window center];

	NSRect frame = [window frame];

	[window release];

	return frame;
}

@end
