//
//  AppDelegate.m
//  Low Battery Yup.d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
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
