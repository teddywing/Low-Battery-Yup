//
//  AppDelegate.m
//  Low Battery Yup.d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "AppDelegate.h"
#import "DDHotKeyCenter.h"
#import "Mouse.h"
#import <Carbon/Carbon.h>

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	DDHotKeyCenter *hotkey_center = [DDHotKeyCenter sharedHotKeyCenter];
	[hotkey_center registerHotKeyWithKeyCode:kVK_ANSI_0
		modifierFlags:(NSCommandKeyMask | NSAlternateKeyMask | NSShiftKeyMask | NSControlKeyMask)
		target:self
		action:@selector(dismissLowBatteryWarning:)
		object:nil];
}

- (void)dismissLowBatteryWarning:(NSEvent *)hotKeyEvent
{
	Mouse *m = [[Mouse alloc] init];
	[m moveToLowBatteryOK];
	[m click];
	[m release];
}

@end
