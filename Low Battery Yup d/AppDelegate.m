//
//  AppDelegate.m
//  Low Battery Yup.d
//
//  Created by Teddy Wing on 11/16/16.
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

#import "AppDelegate.h"
#import "DDHotKeyCenter.h"
#import <Carbon/Carbon.h>
#import "Constants.h"

@implementation AppDelegate

- (void)dealloc
{
	[_mouse release];
	[super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	_mouse = [[Mouse alloc] init];

	[[NSUserDefaults standardUserDefaults] addSuiteNamed:@"com.teddywing.Low-Battery-Yup"];
	NSDictionary *shortcut = [[NSUserDefaults standardUserDefaults] objectForKey:kPreferenceGlobalShortcut];

	if (shortcut) {
		DDHotKeyCenter *hotkey_center = [DDHotKeyCenter sharedHotKeyCenter];
		[hotkey_center registerHotKeyWithKeyCode:[[shortcut objectForKey:@"keyCode"] unsignedIntegerValue]
			modifierFlags:[[shortcut objectForKey:@"modifierFlags"] unsignedIntegerValue]
			target:self
			action:@selector(dismissLowBatteryWarning:)
			object:nil];
	}
}

- (void)dismissLowBatteryWarning:(NSEvent *)hotKeyEvent
{
	[_mouse moveToLowBatteryOK];
	[_mouse click];
}

@end
