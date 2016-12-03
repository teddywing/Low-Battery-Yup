//
//  FakeAlert.m
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
