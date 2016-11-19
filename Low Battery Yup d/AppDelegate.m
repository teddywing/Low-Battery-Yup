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

@implementation AppDelegate

- (void)dealloc
{
	[_mouse release];
	[super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	_mouse = [[Mouse alloc] init];

	DDHotKeyCenter *hotkey_center = [DDHotKeyCenter sharedHotKeyCenter];
	[hotkey_center registerHotKeyWithKeyCode:kVK_ANSI_0
		modifierFlags:(NSCommandKeyMask | NSAlternateKeyMask | NSShiftKeyMask | NSControlKeyMask)
		target:self
		action:@selector(dismissLowBatteryWarning:)
		object:nil];
}

- (void)dismissLowBatteryWarning:(NSEvent *)hotKeyEvent
{
	[_mouse moveToLowBatteryOK];
	[_mouse click];
}

@end
